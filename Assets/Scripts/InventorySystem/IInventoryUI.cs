

using System;
using System.Collections.Generic;

public interface IInventoryUI
{
    event Func<List<ItemScrObj>> onSetNewItem;
    bool isCameraActive { get; set; }
    void SetNewItemByInventoryCell(ItemScrObj item,short slot);
    void ResetItemByInventoryCell(short slot);
    void UpdateInventorySlots();
    short GetIndexSlot(ItemScrObj item);
}