

using System;
using System.Collections.Generic;

public interface IInventoryUI
{
    event Func<List<ItemScrObj>> onSetNewItem;
    bool isCameraActive { get; set; }
    void SetNewItemByInventoryCell(ItemScrObj item,short slot = default);
    void ResetItemByInventoryCell(ItemScrObj item = default, short slot = default);
    void UpdateInventorySlots();
}