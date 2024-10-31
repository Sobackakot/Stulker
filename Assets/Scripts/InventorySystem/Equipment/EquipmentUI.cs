
using System;
using System.Collections.Generic;
using UnityEngine; 

public class EquipmentUI : InventoryUI
{ 
    private List<EquipmentSlot> slots = new List<EquipmentSlot>();
    private List<EquipmentItemInSlot> equipItemInSlots = new List<EquipmentItemInSlot>();
      
    private void Awake()
    {
        slots.AddRange(GetComponentsInChildren<EquipmentSlot>(false));
        equipItemInSlots.AddRange(GetComponentsInChildren<EquipmentItemInSlot>(false));
    }
    public override void SetNewItemByInventoryCell(ItemScrObj newItem, short slotIndex)
    {
        EquipFields equipFields = slots[slotIndex].equipFieldData.fieldType;
        if((short)newItem.itemType == (short)equipFields)
        {
            base.SetNewItemByInventoryCell(newItem, slotIndex);
        }
        else
        {
            Debug.Log("Not equip slot");
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
