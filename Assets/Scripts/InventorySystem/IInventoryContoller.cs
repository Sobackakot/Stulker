using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public interface IInventoryContoller
{
    bool AddItemToInventory(ItemScrObj newItem);
    void RemoveItemFromInventory(ItemScrObj item);
    void SwapItemInSlot(int slotIndex, ItemScrObj newItem);
    void UpdateInventoryPerson(ItemScrObj newItem);
    short EquipingItem(ItemScrObj item, out ItemScrObj oldItem);
    List<ItemScrObj> GetCurrentItems();
}
