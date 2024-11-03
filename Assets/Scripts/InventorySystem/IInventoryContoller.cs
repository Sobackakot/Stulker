using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public interface IInventoryContoller
{
    bool AddItemToInventory(ItemScrObj newItem);
    void RemoveItemFromInventory(ItemScrObj item); 
    void UpdateEquip(ItemScrObj item, out ItemScrObj oldItem);
    List<ItemScrObj> GetCurrentItems();
}
