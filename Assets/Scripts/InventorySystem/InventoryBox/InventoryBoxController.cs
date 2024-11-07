using System;
using System.Collections.Generic; 
using Zenject;
using UnityEngine;

public class InventoryBoxController : IInventoryContoller, IInitializable, IDisposable
{
    public InventoryBoxController([Inject(Id = "inventoryBoxUI")] IInventoryUI inventoryBoxUI)
    {
        this.inventoryBoxUI = inventoryBoxUI;
    }
    private IInventoryUI inventoryBoxUI;
    public InventoryBox inventoryBox;

    public void Initialize()
    {
        inventoryBoxUI.onSetNewItem += GetCurrentItems;
    }
    public void Dispose()
    {
        inventoryBoxUI.onSetNewItem -= GetCurrentItems;
    }
    public void GetBoxByInventory(InventoryBoxScrObj box) // coll from class CharacterSwitchSystem
    {
        inventoryBox = box.inventoryBox; // get pick Box for inventory
        inventoryBoxUI.UpdateInventorySlots();
    }
    public bool AddItemToInventory(ItemScrObj newItem) //coll from EquipmentController,PickUpItems
    {
        bool isHas = inventoryBox.AddItemToInventory(newItem, out short index);
        inventoryBoxUI.SetNewItemByInventoryCell(newItem, index);
        return isHas;
    }
    public void RemoveItemFromInventory(ItemScrObj item) // coll from ItemInSlot
    {
        inventoryBox.RemoveItemFromInventory(item,out short index);
        inventoryBoxUI.ResetItemByInventoryCell(index);// update inventoryController equipmentSlots 
    }
    public ItemScrObj SwapItemFromInventory(ItemScrObj item, short index)
    {
        List<ItemScrObj> items = GetCurrentItems();
        if (index >= 0 && index < items.Count)
        { 
            FreeUpOldSlot(item);
            ItemScrObj oldItem = null;
            if (items[index] != null)
            {
                oldItem = items[index];
            } 
            inventoryBox.SwapItemFromInventory(item, index);
            inventoryBoxUI.SetNewItemByInventoryCell(item, index); 
            return oldItem;
        }
        else return null;
    }

    private void FreeUpOldSlot(ItemScrObj item)
    {
        List<ItemScrObj> items = GetCurrentItems();
        for (short i = 0; i < items.Count; i++)
        {
            if (items[i] == item)
            {
                inventoryBoxUI.ResetItemByInventoryCell(i);
                inventoryBox.FreeUpOldSlot(i);
            }
        }
    }
    public ItemScrObj UpdatePickItem(ItemScrObj pickItem, short index, string slotType)
    {
        if (slotType == "EquipSlot" && pickItem != null && pickItem.itemType != EquipItems.None)
        {
            return SwapItemFromInventory(pickItem, index);
        }
        else if (slotType == "Slot" && pickItem != null)
        { 
            return SwapItemFromInventory(pickItem, index);
        }
        return null;
    }
    public List<ItemScrObj> GetCurrentItems() //get a list of items from a character's inventoryController
    {
        return inventoryBox.GetCurrentItems();
    }
    public short GetIndexFreeSlot(ItemScrObj item, string slotType)
    {
        return inventoryBoxUI.GetIndexFreeSlot(item, slotType); 
    } 
}
