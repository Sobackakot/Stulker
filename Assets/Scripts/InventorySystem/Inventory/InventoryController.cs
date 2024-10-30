
using System;
using System.Collections.Generic;
using Zenject;

public class InventoryController: IInitializable, IDisposable
{
    public InventoryController([Inject(Id = "inventoryUI")] IInventoryUI inventoryUI, EquipmentController equipment)
    {
        this.inventoryUI = inventoryUI;
        this.equipmentController = equipment;

        itemsInventory = new List<ItemScrObj>(space);
        for (int i = 0; i < space; i++)
        {
            itemsInventory.Add(null); // Initialize the list with null values 
        }
    }

    private EquipmentController equipmentController;
    private IInventoryUI inventoryUI;
     
    public readonly List<ItemScrObj> itemsInventory;
    private int space = 48;
     
   

    public void Initialize()
    {
        inventoryUI.onSetNewItem += GetCurrentInventory;
        equipmentController.onAddItemToInventory += AddItemToInventory;
        equipmentController.onRemoveItemToInventory += RemoveItemFromInventory;
    }
    public void Dispose()
    {
        inventoryUI.onSetNewItem -= GetCurrentInventory;
        equipmentController.onAddItemToInventory -= AddItemToInventory;
        equipmentController.onRemoveItemToInventory -= RemoveItemFromInventory;
    } 

    public bool AddItemToInventory(ItemScrObj newItem) //coll from EquipmentController,PickUpItems
    { 
        for (byte i = 0; i < itemsInventory.Count; i++)
        {
            if (itemsInventory[i] == null)
            {
                itemsInventory[i] = newItem; 
                inventoryUI.SetNewItemByInventoryCell( newItem, i); // update inventoryController slots
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
                inventoryUI.ResetItemByInventoryCell(item,i);// update inventoryController slots
                return;
            }
        }
        
    }
    public void SwapItemInSlot(int slotIndex, ItemScrObj newItem) // coll from class InventorySlot
    {
        if (slotIndex >= 0 && slotIndex < space)
        {
            UpdateInventoryPerson(newItem); //update item indexes when changing inventoryController slots
            itemsInventory[slotIndex] = newItem;
        } // set new slot for item on Drop  
    }
    private void UpdateInventoryPerson(ItemScrObj newItem)
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
   
    public List<ItemScrObj> GetCurrentInventory() //get a list of items from a character's inventoryController
    {
        return  itemsInventory;
    } 
}
