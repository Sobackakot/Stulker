
using System;
using System.Collections.Generic; 
using Zenject; 

public class EquipmentController  : InventoryController
{
    public EquipmentController(EquipmentUI equipmentUI) : base(equipmentUI)
    {

        int indexSlot = System.Enum.GetNames(typeof(EquipItems)).Length; //get the number of slots for equipmentUI items
        equipmentItem = new List<ItemScrObj>(indexSlot);
        for (int i = 0; i < indexSlot; i++)
        {
            equipmentItem.Add(null); //initialize item equipmentUI slots
        }
    }

    public readonly List<ItemScrObj> equipmentItem;
    
    public override bool AddItemToInventory(ItemScrObj newItem)
    {
        return base.AddItemToInventory(newItem);
    }
    public override void RemoveItemFromInventory(ItemScrObj item)
    {
        base.RemoveItemFromInventory(item);
    }
    public override void SwapItemInSlot(int slotIndex, ItemScrObj newItem)
    {
        base.SwapItemInSlot(slotIndex, newItem);
    }
    public override void UpdateInventoryPerson(ItemScrObj newItem)
    {
        base.UpdateInventoryPerson(newItem);
    }
}
