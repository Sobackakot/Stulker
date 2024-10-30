
using System;
using System.Collections.Generic; 
using Zenject; 

public class EquipmentController  : IInitializable, IDisposable
{
    public EquipmentController([Inject(Id = "equipmentUI")] IInventoryUI equipmentUI)
    {
        this.equipmentUI = equipmentUI; 

        int indexSlot = System.Enum.GetNames(typeof(EquipItems)).Length; //get the number of slots for equipmentUI items
        equipmentItem = new List<ItemScrObj>(indexSlot);
        for (int i = 0; i < indexSlot; i++)
        {
            equipmentItem.Add(null); //initialize item equipmentUI slots
        }
    }

    private IInventoryUI equipmentUI;

    public event Func<ItemScrObj, bool> onAddItemToInventory;
    public event Action<ItemScrObj> onRemoveItemToInventory;

    public readonly List<ItemScrObj> equipmentItem;
    
    public void Initialize()
    {
        equipmentUI.onSetNewItem += GetEquipmentItems;
    } 
    public void Dispose()
    {
        equipmentUI.onSetNewItem -= GetEquipmentItems;
    }
    public void ActiveEquipmentPanel()
    {
        equipmentUI.UpdateInventorySlots();
    }
    public void EquipItem(ItemScrObj newItem) //coll from ItemInSlot
    {
        byte currentIndex = (byte)newItem.itemType; // convert from EquipmentScrObj Slot to index 
        ItemScrObj oldItem = null;
        if (equipmentItem[currentIndex] != null) //if such an item is already equipped
        {
            oldItem = equipmentItem[currentIndex]; //return the item back to inventoryController
            onAddItemToInventory?.Invoke(oldItem);
        } 
        equipmentItem[currentIndex] = newItem;//equip pick item  from inventoryController cell
        equipmentUI.SetNewItemByInventoryCell(newItem); // update UI slots
        onRemoveItemToInventory?.Invoke(newItem); // Remove from inventoryController cell
    }
   
    public void UnEquipItem(ItemScrObj currentItem)
    {
        byte currentIndex = (byte)currentItem.itemType;
        if (equipmentItem[currentIndex] != null)//if such an item is already equipped
        { 
            onAddItemToInventory?.Invoke(currentItem);
            equipmentUI.ResetItemByInventoryCell(currentItem);// update UI slots
            equipmentItem[currentIndex] = null;//reset an item's equipmentUI slot 
        } 
    }
    public List<ItemScrObj> GetEquipmentItems()
    {
        return equipmentItem;
    }  
}
