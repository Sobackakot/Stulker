 
using UnityEngine;
using UnityEngine.EventSystems;
using Zenject;

public class InventorySlot : MonoBehaviour, IDropHandler   
{   
    private InventoryController inventoryController;
    private EquipmentController equipmentController;
    private RectTransform transformSlot; 

    [Inject]
    private void Container(InventoryController inventory, EquipmentController equipmentController)
    {
        this.inventoryController = inventory;   
        this.equipmentController = equipmentController;
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
        
        if (transformSlot.childCount > 0 && itemData != null)
        {
            if (!CheckDropItemType(dropItem)) return;
            DropItemInventory(itemData, dropItem); 
        }
    }
    private void DropItemInventory(ItemScrObj itemData, ItemInSlot dropItem)
    {    
        ItemInSlot pickItem = transformSlot.GetChild(0).GetComponent<ItemInSlot>(); 
        ItemScrObj oldItemData = inventoryController.SwapItemFromInventory(itemData, pickItem.slotIndex); 

        if (oldItemData != null)
        {
            inventoryController.SwapItemFromInventory(oldItemData, dropItem.slotIndex); 
        }
    } 
    private bool CheckDropItemType(ItemInSlot dropItem)
    {   
        InventorySlot dropSlot = dropItem.originalSlot;
        ItemInSlot pickItem = transformSlot.GetChild(0).GetComponent<ItemInSlot>();
        if(dropSlot.gameObject.tag == "FastSlot") return false;
        if(dropSlot.gameObject.tag == "EquipSlot" && pickItem.dataItem != null) return false; 
        if(dropSlot.gameObject.tag == "EquipSlot" && pickItem.dataItem == null)
        {
            UseItem(dropItem);
            return false;
        }
        else  return true; 
    }
    private void UseItem(ItemInSlot dropItem)
    {
        inventoryController.EquipingItem(dropItem.dataItem, out ItemScrObj oldItem);
        equipmentController.RemoveItemFromInventory(dropItem.dataItem);
        if (oldItem != null) Debug.Log("Bug drop Equip!!!-------------------------------------------------------");
    }
}
