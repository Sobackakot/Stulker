
using System;
using System.Collections.Generic;
using Zenject;

public class InventoryController: IInventoryContoller, IInitializable, IDisposable
{
    public InventoryController([Inject(Id = "inventoryUI")]IInventoryUI inventoryUI)
    {
        this.inventoryUI = inventoryUI; 

        itemsInventory = new List<ItemScrObj>(space);
        for (int i = 0; i < space; i++)
        {
            itemsInventory.Add(null); // Initialize the list with null values 
        }
    }
    private IInventoryUI inventoryUI;
     
    public readonly List<ItemScrObj> itemsInventory;
    private int space = 48; 

    public void Initialize()
    {
        inventoryUI.onSetNewItem += GetCurrentItems; 
    }
    public void Dispose()
    {
        inventoryUI.onSetNewItem -= GetCurrentItems; 
    } 

    public bool AddItemToInventory(ItemScrObj newItem) //coll from EquipmentController,PickUpItems
    { 
        for (byte i = 0; i < itemsInventory.Count; i++)
        {
            if (itemsInventory[i] == null && inventoryUI.SetNewItemByInventoryCell(newItem, i))
            {
                // update inventoryController equipmentSlots
                itemsInventory[i] = newItem;  
                return true;
            }
        } 
        return false; // InventoryPerson is full 
    }

    public void RemoveItemFromInventory(ItemScrObj item) // coll from ItemInSlot
    {
        for (byte i = 0; i < itemsInventory.Count; i++)
        {
            if (itemsInventory[i] == item)
            {
                itemsInventory[i] = null;
                inventoryUI.ResetItemByInventoryCell(i);// update inventoryController equipmentSlots
                return;
            }
        }     
    }
    public void SwapItemInSlot(int slotIndex, ItemScrObj newItem) // coll from class InventorySlot
    {
        if (slotIndex >= 0 && slotIndex < space)
        {
            UpdateInventoryPerson(newItem); //update item indexes when changing inventoryController equipmentSlots
            itemsInventory[slotIndex] = newItem;
        } // set new slot for item on Drop  
    }
    public void UpdateInventoryPerson(ItemScrObj newItem)
    {
        for (int i = 0; i < itemsInventory.Count; i++)
        {
            if (itemsInventory[i] == newItem)
            {
                itemsInventory[i] = null; //clearing the original slot when moving an item to another slot
                return;
            }
        }
    }
   
    public List<ItemScrObj> GetCurrentItems() //get a list of items from a character's inventoryController
    {
        return  itemsInventory;
    }

    public void EquipingItem(ItemScrObj item, short index)
    {
        throw new NotImplementedException();
    }
}
