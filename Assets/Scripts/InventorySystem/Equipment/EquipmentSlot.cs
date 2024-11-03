 
using UnityEngine;
using UnityEngine.EventSystems;
using Zenject;

public class EquipmentSlot : InventorySlot
{ 
    public EquipFieldScrObj equipFieldData;
    private InventoryController inventoryController;
    private EquipmentController equipmentController;
    private RectTransform equipmentSlot;

    [Inject]
    private void Container(InventoryController inventory, EquipmentController equipmentController)
    {
        this.inventoryController = inventory;
        this.equipmentController = equipmentController;
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
        if (droppedItem == null&& equipFieldData==null) return;
        if ((short)equipFieldData.fieldType == (short)droppedItem.dataItem.itemType)
        {
            if (!CheckDropItemType(droppedItem)) return;
            base.OnDrop(eventData);
        } 
        else Debug.Log("is not an equipment slot item");
    }
    private bool CheckDropItemType(ItemInSlot dropItem)
    {
        InventorySlot dropSlot = dropItem.originalSlot;
        if (dropSlot.gameObject.tag == "Slot" && equipmentSlot.gameObject.tag == "EquipSlot")
        {
            Equipping(dropItem);
            return false;
        }
        else return true;
    }
    private void Equipping(ItemInSlot dropItem)
    {
        equipmentController.UpdateEquip(dropItem.dataItem, out ItemScrObj oldItem);
        inventoryController.RemoveItemFromInventory(dropItem.dataItem);
        if (oldItem != null) inventoryController.AddItemToInventory(oldItem);
    }
}
