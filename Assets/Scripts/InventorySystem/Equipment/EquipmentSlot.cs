 
using UnityEngine;
using UnityEngine.EventSystems;
using Zenject;

public class EquipmentSlot : InventorySlot
{ 
    public EquipFieldScrObj equipFieldData;
    private InventoryController inventoryController;
    private InventoryBoxController inventoryBoxController;
    private EquipmentController equipmentController;
    private RectTransform equipmentSlot;

    [Inject]
    private void Container(InventoryController inventory, EquipmentController equipmentController, InventoryBoxController inventoryBoxController)
    {
        this.inventoryController = inventory;
        this.equipmentController = equipmentController;
        this.inventoryBoxController = inventoryBoxController;
    }
    private void Awake()
    {
        equipmentSlot = GetComponent<RectTransform>();
    }
    public override void AddItemInSlot(ItemInSlot item, ItemScrObj data)
    {        
        base.AddItemInSlot(item, data);
    }
    public override void RemoveItemInSlot(ItemInSlot item)
    { 
        base.RemoveItemInSlot(item);
    }
    public override void OnDrop(PointerEventData eventData)
    {
        ItemInSlot droppedItem = eventData.pointerDrag.GetComponent<ItemInSlot>();
        if (droppedItem == null && (short)equipFieldData?.fieldType != (short)droppedItem.dataItem?.itemType) return; 
        if (!CheckDropItemType(droppedItem)) return;
        base.OnDrop(eventData);
    }
    private bool CheckDropItemType(ItemInSlot dropItem)
    {
        Transform dropSlot = dropItem.originalSlot;
        if (dropSlot.gameObject.tag == "Slot" && equipmentSlot.gameObject.tag == "EquipSlot")
        {
            Equipping(dropItem, dropSlot.gameObject.tag);
            return false;
        }
        else return true;
    } 
    private bool Equipping(ItemInSlot dropItem, string slotType)
    {
        short index = equipmentController.GetIndexFreeSlot(dropItem.dataItem, slotType);

        if (slotType == "Slot" && index != -1)
        {
            equipmentController.UpdatePickItem(dropItem.dataItem, index, slotType);
            inventoryController.RemoveItemFromInventory(dropItem.dataItem);
            //if (oldItem != null) inventoryController.AddItemToInventory(oldItem);
            return true;
        }
        else if (slotType == "SlotBox" && index != -1)
        {
            equipmentController.UpdatePickItem(dropItem.dataItem, index, slotType);
            inventoryBoxController.RemoveItemFromInventory(dropItem.dataItem);
            //if (oldItem != null) inventoryBoxController.AddItemToInventory(oldItem);
            return true;
        }
        else return false;
    }
}
