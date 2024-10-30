using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public interface IInventoryContoller
{
    event Func<ItemScrObj, bool> onEquipItemOnPerson;
    void EquipItem(ItemScrObj newItem);
    void UnEquipItem(ItemScrObj currentItem);
    List<ItemScrObj> GetEquipmentItems();
}
