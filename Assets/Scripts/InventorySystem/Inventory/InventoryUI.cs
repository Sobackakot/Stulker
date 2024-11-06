

using System;
using System.Collections.Generic;
using UnityEngine; 

public class InventoryUI: MonoBehaviour, IInventoryUI
{ 
    private List<ItemInSlot> itemsInSlots = new List<ItemInSlot>();
    private List<InventorySlot> inventorySlots = new List<InventorySlot>();

    public event Func<List<ItemScrObj>> onSetNewItem;

    public bool isCameraActive { get; set; }

    private void Awake()
    {
        itemsInSlots.AddRange(GetComponentsInChildren<ItemInSlot>(false));
        inventorySlots.AddRange(GetComponentsInChildren<InventorySlot>(false)); 
    }
    private void OnEnable()
    {
        Cursor.lockState = CursorLockMode.None;
        isCameraActive = false;
    }
    private void OnDisable()
    {
        Cursor.lockState = CursorLockMode.Locked;
        isCameraActive = true;
    }
    private void Start()
    {
        for(short i  =0; i < inventorySlots.Count; i++)
        {
            itemsInSlots[i].slotIndex = i;
        }  
    } 
    public void SetNewItemByInventoryCell(ItemScrObj newItem, short slotIndex) //coll from InventoryController
    { 
        List<ItemScrObj> items = onSetNewItem?.Invoke();
        if (slotIndex < items.Count && items[slotIndex] != null) //updates the inventoryController user interface, those equipmentSlots that have been changed
        {
            inventorySlots[slotIndex].AddItemInSlot(itemsInSlots[slotIndex], newItem);
            Debug.Log("inventUi Set  - slot " + slotIndex + " = " + newItem.NameItem);
        } 
    }
    public void ResetItemByInventoryCell(short slot) //coll from InventoryController
    {
        List<ItemScrObj> items = onSetNewItem?.Invoke();
        if (slot < items.Count) //updates the inventoryController user interface, those equipmentSlots that have been changed
        {
            Debug.Log("inventUi Reset - slot " + slot + " = " + itemsInSlots[slot].dataItem.NameItem);
            inventorySlots[slot].RemoveItemInSlot(itemsInSlots[slot]); 
        }
    }
    public void UpdateInventorySlots() //coll from InventoryController
    { 
        List<ItemScrObj> items = onSetNewItem?.Invoke();
        for (short i = 0; i < inventorySlots.Count; i++) //Updates the inventoryController UI completely when changing characters
        {
            if (itemsInSlots[i].dataItem != null)
            {
                inventorySlots[i].RemoveItemInSlot(itemsInSlots[i]);
            }
            if (i < items.Count && items[i] != null)
            {
                inventorySlots[i].AddItemInSlot(itemsInSlots[i], items[i]);
            }
        }
    }

    public short GetIndexSlot(ItemScrObj item, string slotType)
    {
        for (short i = 0; i < inventorySlots.Count; i++)
        {    
            if (slotType == "EquipSlot" && item.itemType != EquipItems.Ñonsumables && itemsInSlots[i].dataItem == null)
            {
                Debug.Log("GetIndexSlotUI from EquipSlot = " + i);
                return i;
            }
            else if(slotType == "SlotBox" && item!=null && itemsInSlots[i].dataItem == null)
            {
                Debug.Log("GetIndexSlotUI from SlotBox = " + i);
                return i;
            }
        }
        Debug.Log("Not Slot !!!!!!!!!!");
        return -1;
    }
}
