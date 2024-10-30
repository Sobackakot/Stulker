

using System;
using System.Collections.Generic;
using UnityEngine;

public class InventoryUI: MonoBehaviour, IInventoryUI
{ 
    private List<ItemInSlot> ItemsInSlot = new List<ItemInSlot>();
    private List<InventorySlot> Slots = new List<InventorySlot>();

    public event Func<List<ItemScrObj>> onSetNewItem;

    public bool isCameraActive { get; set; }

    private void Awake()
    {
        ItemsInSlot.AddRange(GetComponentsInChildren<ItemInSlot>(false));
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
            ItemsInSlot[i].slotIndex = i;
        }  
    } 
    public void SetNewItemByInventoryCell(ItemScrObj newItem, short slotIndex) //coll from InventoryController
    { 
        List<ItemScrObj> items = onSetNewItem?.Invoke();
        if (slotIndex < items.Count && items[slotIndex] != null) //updates the inventoryController user interface, those slots that have been changed
        { 
            Slots[slotIndex].AddItemInSlot(ItemsInSlot[slotIndex], newItem);
        }
    }
    public void ResetItemByInventoryCell(ItemScrObj item = null, short slot = 0) //coll from InventoryController
    {
        List<ItemScrObj> items = onSetNewItem?.Invoke();
        if (slot < items.Count) //updates the inventoryController user interface, those slots that have been changed
        {
            Slots[slot].RemoveItemInSlot(ItemsInSlot[slot]);
        }
    }
    public void UpdateInventorySlots() //coll from InventoryController
    { 
        List<ItemScrObj> items = onSetNewItem?.Invoke();
        for (short i = 0; i < Slots.Count; i++) //Updates the inventoryController UI completely when changing characters
        {
            if (ItemsInSlot[i].dataItem != null)
            {
                Slots[i].RemoveItemInSlot(ItemsInSlot[i]);
            }
            if (i < items.Count && items[i] != null)
            {
                Slots[i].AddItemInSlot(ItemsInSlot[i], items[i]);
            }
        }
    } 
}
