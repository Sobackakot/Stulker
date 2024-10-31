
using System;
using System.Collections.Generic; 
using Zenject; 

public class EquipmentController  : InventoryController, IInitializable, IDisposable
{
    public EquipmentController(EquipmentUI equipmentUI) : base(equipmentUI)
    {
        this.equipmentUI = equipmentUI;
        int indexSlot = System.Enum.GetNames(typeof(EquipItems)).Length; //get the number of slots for equipmentUI items
        equipmentItem = new List<ItemScrObj>(indexSlot);
        for (int i = 0; i < indexSlot; i++)
        {
            equipmentItem.Add(null); //initialize item equipmentUI slots
        }
    }
    private EquipmentUI equipmentUI;
    public readonly List<ItemScrObj> equipmentItem;

    public new void Initialize()
    {
        equipmentUI.onSetNewItem += GetCurrentItems;
    }
    public new void Dispose()
    {
        equipmentUI.onSetNewItem -= GetCurrentItems;
    }
      
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
    public override List<ItemScrObj> GetCurrentItems()
    {
        return equipmentItem;
    }
}
