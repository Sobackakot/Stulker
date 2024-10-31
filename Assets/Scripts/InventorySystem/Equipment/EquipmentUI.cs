
using System;
using System.Collections.Generic;
using UnityEngine; 

public class EquipmentUI : InventoryUI
{ 
    private List<EquipmentSlot> slots = new List<EquipmentSlot>();
    private List<EquipmentItemInSlot> equipItemInSlots = new List<EquipmentItemInSlot>();

    public event Func<List<ItemScrObj>> onSetNewItemEquip;
    private void Awake()
    {
        slots.AddRange(GetComponentsInChildren<EquipmentSlot>(false));
        equipItemInSlots.AddRange(GetComponentsInChildren<EquipmentItemInSlot>(false));
    }
    private void Start()
    {
        for (int i = 0; i < slots.Count; i++)
        {
            equipItemInSlots[i].slotIndex = i;
        }
    }
    public override void SetNewItemByInventoryCell(ItemScrObj newItem, short slotIndex)
    {
        EquipFields equipFields = slots[slotIndex].equipFieldData.fieldType;
        if((short)newItem.itemType == (short)equipFields)
        {
            List<ItemScrObj> items = onSetNewItemEquip?.Invoke();
            if (slotIndex < items.Count && items[slotIndex] != null) //updates the inventoryController user interface, those slots that have been changed
            {
                slots[slotIndex].AddItemInSlot(equipItemInSlots[slotIndex], newItem);
            }
        } 
    }
    public override void ResetItemByInventoryCell(short slot)
    {
        base.ResetItemByInventoryCell(slot);
    }
    public override void UpdateInventorySlots()
    {
        base.UpdateInventorySlots();
    }
}
