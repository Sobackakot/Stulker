

using System;
using System.Collections.Generic;

namespace Inventory_
{
    public interface IInventoryUI
    {
        event Func<List<ItemScrObj>> onSetNewItem;
        bool isActiveInventory { get; set; }
        void SetNewItemByInventoryCell(ItemScrObj item, short slot);
        void ResetItemByInventoryCell(short slot);
        void UpdateInventorySlots();
        short GetIndexFreeSlot(ItemScrObj item, string slotType);
    }
}
