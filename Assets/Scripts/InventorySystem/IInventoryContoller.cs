 
using System.Collections.Generic; 

public interface IInventoryContoller
{
    bool AddItemToInventory(ItemScrObj newItem);
    void RemoveItemFromInventory(ItemScrObj item);
    ItemScrObj SwapItemFromInventory(ItemScrObj item, short index);
    void UpdatePickItem(ItemScrObj pickItem, short index, string slotType);
    List<ItemScrObj> GetCurrentItems();
    short GetIndexFreeSlot(ItemScrObj item, string slotType);
}
