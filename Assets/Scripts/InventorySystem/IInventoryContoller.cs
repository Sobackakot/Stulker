 
using System.Collections.Generic; 

public interface IInventoryContoller
{
    bool AddItemToInventory(ItemScrObj newItem);
    void RemoveItemFromInventory(ItemScrObj item); 
    bool UpdatePickItem(ItemScrObj pickItem, out ItemScrObj oldItem, string slotType);
    List<ItemScrObj> GetCurrentItems();
}
