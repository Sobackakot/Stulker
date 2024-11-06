using System; 
using System.Collections.Generic;
using UnityEngine;

public class InventoryBoxUI : MonoBehaviour, IInventoryUI
{
    private List<ItemInSlotBox> itemsInSlotsBox = new List<ItemInSlotBox>();
    private List<InventorySlotBox> inventorySlotsBox = new List<InventorySlotBox>();

    public event Func<List<ItemScrObj>> onSetNewItem;

    public bool isActiveInventory { get; set; }

    private void Awake()
    {
        itemsInSlotsBox.AddRange(GetComponentsInChildren<ItemInSlotBox>(false));
        inventorySlotsBox.AddRange(GetComponentsInChildren<InventorySlotBox>(false));
    }
    private void Start()
    {
        for (short i = 0; i < inventorySlotsBox.Count; i++)
        {
            itemsInSlotsBox[i].slotIndexBox = i;
        }
    }
    public void SetNewItemByInventoryCell(ItemScrObj newItem, short slotIndex) //coll from InventoryController
    {
        List<ItemScrObj> items = onSetNewItem?.Invoke();
        if (slotIndex < items.Count && items[slotIndex] != null) //updates the inventoryController user interface, those equipmentSlots that have been changed
        {
            inventorySlotsBox[slotIndex].AddItemInSlot(itemsInSlotsBox[slotIndex], newItem);
            Debug.Log("inventUiBox Set  - slot " + slotIndex + " = " + newItem.NameItem);
        }
    }
    public void ResetItemByInventoryCell(short slot) //coll from InventoryController
    {
        List<ItemScrObj> items = onSetNewItem?.Invoke();
        if (slot < items.Count) //updates the inventoryController user interface, those equipmentSlots that have been changed
        {
            Debug.Log("inventUiBox Reset - slot " + slot + " = " + itemsInSlotsBox[slot].dataItem.NameItem); //bag
            inventorySlotsBox[slot].RemoveItemInSlot(itemsInSlotsBox[slot]);
        }
    }
    public void UpdateInventorySlots() //coll from InventoryController
    {
        List<ItemScrObj> items = onSetNewItem?.Invoke();
        for (short i = 0; i < inventorySlotsBox.Count; i++) //Updates the inventoryController UI completely when changing characters
        {
            if (itemsInSlotsBox[i].dataItem != null)
            {
                inventorySlotsBox[i].RemoveItemInSlot(itemsInSlotsBox[i]);
            }
            if (i < items.Count && items[i] != null)
            {
                inventorySlotsBox[i].AddItemInSlot(itemsInSlotsBox[i], items[i]);
            }
        }
    }

    public short GetIndexSlot(ItemScrObj item, string slotType)
    {
        for (short i = 0; i < inventorySlotsBox.Count; i++)
        {
            if (slotType == "EquipSlot" && item.itemType != EquipItems.Ñonsumables && itemsInSlotsBox[i].dataItem == null) 
            {
                Debug.Log("GetIndexSlotBox from EquipSlot = " + i);
                return i;
            }
            else if (slotType == "Slot" && item != null && itemsInSlotsBox[i].dataItem == null)
            {
                Debug.Log("GetIndexSlotBox from Slot = " + i);
                return i; 
            }
        }
        Debug.Log("Not Slot !!!!!!!!!!");
        return -1;
    }
}
