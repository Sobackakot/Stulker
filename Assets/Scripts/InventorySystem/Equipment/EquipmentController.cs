
using System;
using System.Collections.Generic;
using Zenject;
using UnityEngine;
using UnityEngine.TerrainUtils;
using UnityEditorInternal.Profiling.Memory.Experimental;

public class EquipmentController : IInventoryContoller, IInitializable, IDisposable
{
    public EquipmentController([Inject(Id = "equipmentUI")] IInventoryUI equipmentUI) 
    {
        this.equipmentUI = equipmentUI;
        int countSlotsItem = System.Enum.GetNames(typeof(EquipItems)).Length; //get the number of equipmentSlots for equipmentUI items
        equipmentItems = new List<ItemScrObj>(countSlotsItem);
        for (int i = 0; i < countSlotsItem; i++)
        {
            equipmentItems.Add(null); //initialize item equipmentUI equipmentSlots
        }
    }
    private IInventoryUI equipmentUI;
    public readonly List<ItemScrObj> equipmentItems;

    public void Initialize()
    {
        equipmentUI.onSetNewItem += GetCurrentItems;
    }
    public void Dispose()
    {
        equipmentUI.onSetNewItem -= GetCurrentItems;
    }
      
    public bool AddItemToInventory(ItemScrObj newItem)
    {
        for (byte i = 0; i < equipmentItems.Count; i++)
        {
            if (equipmentItems[i] == null)
            { 
                // update inventoryController equipmentSlots
                equipmentItems[i] = newItem;
                equipmentUI.SetNewItemByInventoryCell(newItem, i);
                Debug.Log("equipControlle Add to itemsList - " + i + " = "+ newItem);
                return true;
            }
        }
        return false;
    }
    public void RemoveItemFromInventory(ItemScrObj item)
    {
        for (byte i = 0; i < equipmentItems.Count; i++)
        {
            if (equipmentItems[i] == item)
            {
                equipmentItems[i] = null;
                equipmentUI.ResetItemByInventoryCell(i);// update inventoryController equipmentSlots
                Debug.Log("equipControlle Remove from itemsList - " + i);
                return;
            }
        }
    }
    public void SetItemToInventory(ItemScrObj item, short index)
    {
        equipmentItems[index] = item;
        equipmentUI.SetNewItemByInventoryCell(item, index);
        Debug.Log("Add equipContr " + index + " = " + item);
    }


    public void ResetItemFromInventory(ItemScrObj item, short index)
    {
        if (equipmentItems[index] == item)
        {
            equipmentItems[index] = null;
            equipmentUI.ResetItemByInventoryCell(index);
        }
        else
        {
            Debug.Log("error reset item");
        }
    }
    public void SwapItemInSlot(int slotIndex, ItemScrObj newItem)
    {
        if (slotIndex >= 0 && slotIndex < equipmentItems.Count)
        {
            UpdateInventoryPerson(newItem); //update item indexes when changing inventoryController equipmentSlots
            equipmentItems[slotIndex] = newItem;
            Debug.Log("Set new index equipItems List - " + slotIndex + " = " + newItem); 
        }
    }
    public void UpdateInventoryPerson(ItemScrObj newItem)
    {
        for (int i = 0; i < equipmentItems.Count; i++)
        {
            if (equipmentItems[i] == newItem)
            {
                equipmentItems[i] = null; //clearing the original slot when moving an item to another slot
                Debug.Log("Clear old index equipItems List - " + i + " = " + newItem);
                return;
            }
        }
    }
    public List<ItemScrObj> GetCurrentItems()
    {
        return equipmentItems;
    }
    public short EquipingItem(ItemScrObj item, out ItemScrObj oldItem)
    {
        short index = equipmentUI.GetSlotForItem(item);
        oldItem = null;
        if (equipmentItems[index] != null)
        {
            oldItem =  equipmentItems[index];  
        }
        SetItemToInventory(item, index);
        return index;
    }
}
