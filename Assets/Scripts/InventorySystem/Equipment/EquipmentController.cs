
using System;
using System.Collections.Generic;
using Zenject;
using UnityEngine; 

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
    public ItemScrObj SwapItemFromInventory(ItemScrObj item, short index)
    {
        FreeUpOldSlot(item);
        ItemScrObj oldItem = null;
        if (equipmentItems[index] != null)
        {
            oldItem = equipmentItems[index];
        }
        equipmentItems[index] = item;
        equipmentUI.SetNewItemByInventoryCell(item, index);
        return oldItem;
    }

    private void FreeUpOldSlot(ItemScrObj item)
    {
        for (short i = 0; i < equipmentItems.Count; i++)
        {
            if (equipmentItems[i] == item)
            {
                equipmentUI.ResetItemByInventoryCell(i);
                equipmentItems[i] = null;
            }
        }
    }
    public List<ItemScrObj> GetCurrentItems()
    {
        return equipmentItems;
    }
    public void EquipingItem(ItemScrObj item, out ItemScrObj oldItem)
    {
        if (item != null && item.itemType != EquipItems.None)
        {
            short index = equipmentUI.GetSlotForItem(item);
            oldItem = SwapItemFromInventory(item, index); 
        }
        else oldItem = null;
    }

}
