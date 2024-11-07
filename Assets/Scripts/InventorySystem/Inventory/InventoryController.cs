
using System;
using System.Collections.Generic; 
using UnityEngine;
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
            if (itemsInventory[i] == null )
            {
                // update inventoryController equipmentSlots
                itemsInventory[i] = newItem;
                inventoryUI.SetNewItemByInventoryCell(newItem, i);  
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
    public ItemScrObj SwapItemFromInventory(ItemScrObj item, short index)
    { 
        if (index >= 0 && index < itemsInventory.Count)
        {
            FreeUpOldSlot(item);
            ItemScrObj oldItem = null;
            if (itemsInventory[index] != null)
            {
                oldItem = itemsInventory[index];
            }
            itemsInventory[index] = item;
            inventoryUI.SetNewItemByInventoryCell(item, index);
            return oldItem;
        }
        else return null;
    } 

    private void FreeUpOldSlot(ItemScrObj item) 
    {
        for (short i = 0; i < itemsInventory.Count; i++)
        {
            if (itemsInventory[i] == item)
            {
                inventoryUI.ResetItemByInventoryCell(i);
                itemsInventory[i] = null; 
            }     
        }
    }
    public ItemScrObj UpdatePickItem(ItemScrObj pickItem, short index, string slotType)
    {
        if (slotType == "EquipSlot" && pickItem != null && pickItem.itemType != EquipItems.None)
        {
            return SwapItemFromInventory(pickItem, index);
        }
        else if (slotType == "SlotBox" && pickItem != null)
        {
            return SwapItemFromInventory(pickItem, index);
        }
        return null;    
    }
    public List<ItemScrObj> GetCurrentItems() //get a list of items from a character's inventoryController
    {
        return  itemsInventory;
    }
    public short GetIndexFreeSlot(ItemScrObj item, string slotType)
    {
        return inventoryUI.GetIndexFreeSlot(item, slotType);
    } 
}
