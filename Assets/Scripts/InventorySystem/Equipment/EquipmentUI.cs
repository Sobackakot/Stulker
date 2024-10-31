
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
    public  void SetNewItemByInventoryCell(ItemScrObj newItem, short slotIndex)
    {
        List<ItemScrObj> items = onSetNewItem?.Invoke();
        if (slotIndex < items.Count && items[slotIndex] != null) //updates the inventoryController user interface, those equipmentSlots that have been changed
        {
            equipmentSlots[slotIndex].AddItemInSlot(equipItemInSlots[slotIndex], newItem);
        }
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
    }
}
