
using System;
using System.Collections.Generic;
using UnityEditorInternal.Profiling.Memory.Experimental;
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
    public void SetItemToInventory(ItemScrObj item, short index)
    {
        if (index >= 0 && index < space)
        {
            itemsInventory[index] = item;
            inventoryUI.SetNewItemByInventoryCell(item, index);
        }   
    }

    
    public void ResetItemFromInventory(ItemScrObj item, short index)
    {
        if (itemsInventory[index] == item)
        {
            itemsInventory[index] = null;
            inventoryUI.ResetItemByInventoryCell(index);
        }
        else
        {
            Debug.Log("error reset item");
        }
    }
    public void SwapItemInSlot(int slotIndex, ItemScrObj newItem) // coll from class InventorySlot
    {
        if (slotIndex >= 0 && slotIndex < space)
        {
            UpdateInventoryPerson(newItem); //update item indexes when changing inventoryController equipmentSlots
            itemsInventory[slotIndex] = newItem;
            Debug.Log("Set new index invenItems List - " + slotIndex + " = " + newItem);
        } // set new slot for item on Drop  
    }
    public void UpdateInventoryPerson(ItemScrObj newItem)
    {
        for (int i = 0; i < itemsInventory.Count; i++)
        {
            if (itemsInventory[i] == newItem)
            {
                itemsInventory[i] = null; //clearing the original slot when moving an item to another slot
                Debug.Log("Clear old index inventItems List - " + i + " = " + newItem);
                return;
            }
        }
    }
   
    public List<ItemScrObj> GetCurrentItems() //get a list of items from a character's inventoryController
    {
        return  itemsInventory;
    }

    public short EquipingItem(ItemScrObj item, out ItemScrObj oldItem)
    {
        throw new NotImplementedException();
    }
}
