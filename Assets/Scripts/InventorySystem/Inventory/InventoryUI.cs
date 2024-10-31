

using System;
using System.Collections.Generic;
using UnityEngine;

public class InventoryUI: MonoBehaviour
{ 
    private List<ItemInSlot> itemsInSlots = new List<ItemInSlot>();
    private List<InventorySlot> Slots = new List<InventorySlot>();

    public event Func<List<ItemScrObj>> onSetNewItem;

    public bool isCameraActive { get; set; }

    private void Awake()
    {
        itemsInSlots.AddRange(GetComponentsInChildren<ItemInSlot>(false));
        Slots.AddRange(GetComponentsInChildren<InventorySlot>(false)); 
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
        for(int i  =0; i < Slots.Count; i++)
        {
            itemsInSlots[i].slotIndex = i;
        }  
    } 
    public virtual void SetNewItemByInventoryCell(ItemScrObj newItem, short slotIndex) //coll from InventoryController
    { 
        List<ItemScrObj> items = onSetNewItem?.Invoke();
        if (slotIndex < items.Count && items[slotIndex] != null) //updates the inventoryController user interface, those slots that have been changed
        { 
            Slots[slotIndex].AddItemInSlot(itemsInSlots[slotIndex], newItem);
        }
    }
    public virtual void ResetItemByInventoryCell(short slot) //coll from InventoryController
    {
        List<ItemScrObj> items = onSetNewItem?.Invoke();
        if (slot < items.Count) //updates the inventoryController user interface, those slots that have been changed
        {
            Slots[slot].RemoveItemInSlot(itemsInSlots[slot]);
        }
    }
    public virtual void UpdateInventorySlots() //coll from InventoryController
    { 
        List<ItemScrObj> items = onSetNewItem?.Invoke();
        for (short i = 0; i < Slots.Count; i++) //Updates the inventoryController UI completely when changing characters
        {
            if (itemsInSlots[i].dataItem != null)
            {
                Slots[i].RemoveItemInSlot(itemsInSlots[i]);
            }
            if (i < items.Count && items[i] != null)
            {
                Slots[i].AddItemInSlot(itemsInSlots[i], items[i]);
            }
        }
    } 
}
