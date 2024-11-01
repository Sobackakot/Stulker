
using System;
using System.Collections.Generic;
using UnityEngine; 

public class EquipmentUI : MonoBehaviour, IInventoryUI
{ 
    private List<EquipmentSlot> equipmentSlots = new List<EquipmentSlot>();
    private List<EquipmentItemInSlot> equipItemInSlots = new List<EquipmentItemInSlot>();

    public bool isCameraActive { get ; set; }

    public event Func<List<ItemScrObj>> onSetNewItem;
    private void Awake()
    {
        equipmentSlots.AddRange(GetComponentsInChildren<EquipmentSlot>(false));
        equipItemInSlots.AddRange(GetComponentsInChildren<EquipmentItemInSlot>(false));
    }
    private void Start()
    {
        for (int i = 0; i < equipmentSlots.Count; i++)
        {
            equipItemInSlots[i].equipSlotIndex = i;
        }
    }
    public bool SetNewItemByInventoryCell(ItemScrObj newItem, short slotIndex)
    {
        List<ItemScrObj> items = onSetNewItem?.Invoke();
        if (slotIndex < items.Count && items[slotIndex] == null) //updates the inventoryController user interface, those equipmentSlots that have been changed
        {
            equipmentSlots[slotIndex].AddItemInSlot(equipItemInSlots[slotIndex], newItem);
            return true;
        }
        else return false;
    }
    public  void ResetItemByInventoryCell(short slot)
    {
        List<ItemScrObj> items = onSetNewItem?.Invoke();
        if (slot < items.Count) //updates the inventoryController user interface, those equipmentSlots that have been changed
        {
            equipmentSlots[slot].RemoveItemInSlot(equipItemInSlots[slot]);
        }
    }
    public  void UpdateInventorySlots()
    {
        List<ItemScrObj> items = onSetNewItem?.Invoke();
        for (short i = 0; i < equipmentSlots.Count; i++) //Updates the inventoryController UI completely when changing characters
        {
            if (equipItemInSlots[i].dataItem != null)
            {
                equipmentSlots[i].RemoveItemInSlot(equipItemInSlots[i]);
            }
            if (i < items.Count && items[i] != null)
            {
                equipmentSlots[i].AddItemInSlot(equipItemInSlots[i], items[i]);
            }
        }
    }
}
