
using System;
using System.Collections.Generic;
using UnityEngine; 

public class EquipmentUI : MonoBehaviour, IInventoryUI
{ 
    private List<EquipmentSlot> slots = new List<EquipmentSlot>();
    private List<EquipmentItemInSlot> itemsInSlots = new List<EquipmentItemInSlot>();

    public event Func<List<ItemScrObj>> onSetNewItem;

    public bool isCameraActive { get; set; }
    private void Awake()
    {
        slots.AddRange(GetComponentsInChildren<EquipmentSlot>(false));
        itemsInSlots.AddRange(GetComponentsInChildren<EquipmentItemInSlot>(false));
    } 
    public void SetNewItemByInventoryCell(ItemScrObj newItem, short index = 0) //coll from InventoryController
    { 
        for(short i = 0; i < slots.Count; i++)
        {
            EquipFields equipFields = slots[i].equipField.fieldType;
            if((short)newItem.itemType == (short)equipFields)
            {
                slots[i].AddItemInSlot(itemsInSlots[i], newItem);
                return;
            }
        } 
    }
    public void ResetItemByInventoryCell(ItemScrObj item = null, short index = 0) //coll from InventoryController
    { 
        for(short i = 0; i < slots.Count; i++)
        {
            EquipFields equipFields = slots[i].equipField.fieldType;
            if ((short)item.itemType == (short)equipFields)
            { 
                slots[i].RemoveItemInSlot(itemsInSlots[i]);
            }
        }
    }
    public void UpdateInventorySlots() //coll from InventoryController
    {
        List<ItemScrObj> items = onSetNewItem?.Invoke();
        for (short i = 0; i < slots.Count; i++) //Updates the inventoryController UI completely when changing characters
        {
            if (itemsInSlots[i].dataItem != null)
            {
                slots[i].RemoveItemInSlot(itemsInSlots[i]);
            }
            if (i < items.Count && items[i] != null)
            {
                slots[i].AddItemInSlot(itemsInSlots[i], items[i]);
            }
        }
    } 
}
