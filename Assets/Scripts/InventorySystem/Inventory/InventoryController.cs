
using System;
using System.Collections.Generic; 
using UnityEngine;
using Zenject;
using static UnityEditor.Progress;

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
                Debug.Log("inventControlle Addto itemsList - " + i + " = " + newItem);
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
                Debug.Log("inventControlle Remove itemsList - " + i);
                return;
            }
        }
    } 
    public ItemScrObj SwapItemFromInventory(ItemScrObj item, short index)
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
    public List<ItemScrObj> GetCurrentItems() //get a list of items from a character's inventoryController
    {
        return  itemsInventory;
    }

    public short EquipingItem(ItemScrObj item, out ItemScrObj oldItem)
    {
        short index = inventoryUI.GetSlotForItem(item);
        oldItem = SwapItemFromInventory(item, index);
        return index;
    }
}
