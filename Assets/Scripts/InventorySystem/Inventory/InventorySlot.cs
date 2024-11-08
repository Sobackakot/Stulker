 
using UnityEngine;
using UnityEngine.EventSystems;
using Zenject;

public class InventorySlot : MonoBehaviour, IDropHandler   
{   
    private InventoryController inventoryController;
    private InventoryBoxController inventoryBoxController;
    private EquipmentController equipmentController;
    private RectTransform transformSlot; 

    [Inject]
    private void Container(InventoryController inventory, EquipmentController equipmentController, InventoryBoxController inventoryBoxController)
    {
        this.inventoryController = inventory;   
        this.equipmentController = equipmentController;
        this.inventoryBoxController = inventoryBoxController;
    }
    private void Awake()
    {   
        transformSlot = GetComponent<RectTransform>();   
    }
     
    public virtual void AddItemInSlot(ItemInSlot item, ItemScrObj data) //coll from class InventoryUI
    {
        item.SetItem(data);
    }
    public virtual void RemoveItemInSlot(ItemInSlot item)//coll from class InventoryUI
    {
        item.CleareItem();
    }
    public virtual void OnDrop(PointerEventData eventData)
    {
        ItemInSlot dropItem = eventData.pointerDrag.GetComponent<ItemInSlot>(); 
        ItemScrObj itemData = dropItem.dataItem; 
        if (transformSlot?.childCount > 0 && itemData != null) DropItemInventory(itemData, dropItem);
    }
    public virtual void DropItemInventory(ItemScrObj itemData, ItemInSlot dropItem)
    {
        ItemInSlot pickItem = transformSlot.GetChild(0).GetComponent<ItemInSlot>();
        if (!CheckDropItemType(dropItem, pickItem)) return;
        ItemScrObj oldItemData = inventoryController.SwapItemFromInventory(itemData, pickItem.slotIndex); 
        if (oldItemData != null) inventoryController.SwapItemFromInventory(oldItemData, dropItem.slotIndex);
    } 
    public virtual bool CheckDropItemType(ItemInSlot dropItem, ItemInSlot pickItem)
    {   
        Transform dropSlot = dropItem.originalSlot; 
        if(dropSlot.gameObject.tag == "FastSlot") return false;
        if (dropSlot.gameObject.tag == "SlotBox" | dropSlot.gameObject.tag == "EquipSlot" && pickItem.dataItem != null) return false;
        if(UnEquip(dropItem,dropSlot.gameObject.tag)) return false; 
        else  return true; 
    }
    private bool UnEquip(ItemInSlot dropItem,string slotType)
    {
        short index = inventoryController.GetIndexFreeSlot(dropItem.dataItem, slotType);

        if(slotType == "EquipSlot" && index != -1)
        {
            inventoryController.UpdatePickItem(dropItem.dataItem, index, slotType);
            equipmentController.RemoveItemFromInventory(dropItem.dataItem); 
            return true;
        }
        else if(slotType == "SlotBox" && index != -1)
        {
            inventoryController.UpdatePickItem(dropItem.dataItem, index, slotType);
            inventoryBoxController.RemoveItemFromInventory(dropItem.dataItem); 
            return true;
        } 
        else return false;
    }
}
