
using UnityEngine;
using UnityEngine.EventSystems; 
using Zenject;


public class EquipmentItemInSlot : ItemInSlot
{  
    public int equipSlotIndex { get; set; }
    private  EquipmentController equipmentController;
    private InventoryController inventoryController;
    private InventoryBoxController inventoryBoxController;

    private Transform originEquipSlot;
     
    [Inject]
    private void Container(EquipmentController equipmentController, InventoryController inventoryController, InventoryBoxController inventoryBoxController)
    {   
        this.equipmentController = equipmentController;
        this.inventoryController = inventoryController;
        this.inventoryBoxController = inventoryBoxController;
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
        originEquipSlot = transform.parent;
        if (eventData.button == PointerEventData.InputButton.Left && dataItem != null)
        {
            Equipping(originEquipSlot.gameObject.tag);
        }
    } 
    private void Equipping(string slotType)
    {
        short index = inventoryController.GetIndexFreeSlot(dataItem, slotType);
        short index1 = inventoryBoxController.GetIndexFreeSlot(dataItem, slotType); 
        if (index != -1)
        {
            inventoryController.UpdatePickItem(dataItem, index, slotType);
            equipmentController.RemoveItemFromInventory(dataItem); 
        }
        else if (index1 != -1 && equipmentController.CheckIsActiveInventoryBox())
        {
            inventoryBoxController.UpdatePickItem(dataItem, index, slotType);
            equipmentController.RemoveItemFromInventory(dataItem);
        }
    }
}
