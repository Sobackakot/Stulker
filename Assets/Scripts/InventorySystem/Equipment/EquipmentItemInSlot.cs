
using UnityEngine;
using UnityEngine.EventSystems; 
using Zenject;


public class EquipmentItemInSlot : ItemInSlot
{  
    public int equipSlotIndex { get; set; }
    private  EquipmentController equipmentController;
    private InventoryController inventoryController;

    private Transform originEquipSlot;
     
    [Inject]
    private void Container(EquipmentController equipmentController, InventoryController inventoryController)
    {   
        this.equipmentController = equipmentController;
        this.inventoryController = inventoryController;
    }
    public override void SetItem(ItemScrObj newItem)
    { 
        base.SetItem(newItem);
    }
    public override void CleareItem()
    { 
        base.CleareItem();
    }
    public override void OnBeginDrag(PointerEventData eventData)
    {
        originEquipSlot = transform.parent;
        base.OnBeginDrag(eventData); 
    }
    public override void OnDrag(PointerEventData eventData)
    {
        base.OnDrag(eventData); 
    }
    public override void OnEndDrag(PointerEventData eventData)
    {
        base.OnEndDrag(eventData);
        originEquipSlot = transform.parent;
    }
    public override void OnPointerClick(PointerEventData eventData)
    {
        if (eventData.button == PointerEventData.InputButton.Left && dataItem != null)
        {
            UnEquip(originEquipSlot.gameObject.tag);
        }
    }
    private void UnEquip(string slotType)
    {
        inventoryController.UpdatePickItem(dataItem, out ItemScrObj oldItem, slotType);
        equipmentController.RemoveItemFromInventory(dataItem);
    }
}
