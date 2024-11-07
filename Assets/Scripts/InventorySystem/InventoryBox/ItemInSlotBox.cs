
using UnityEngine;
using UnityEngine.EventSystems;
using Zenject;

public class ItemInSlotBox : ItemInSlot
{
    public short slotIndexBox { get; set; } 
      
    private EquipmentController equipmentController;
    private InventoryController inventoryController;
    private InventoryBoxController inventoryBoxController;

    private Transform originSlotBox;

    [Inject]
    private void Container(EquipmentController equipmenrt, InventoryController inventoryController, InventoryBoxController inventoryBoxController)
    {
        equipmentController = equipmenrt;
        this.inventoryController = inventoryController;
        this.inventoryBoxController = inventoryBoxController;
    }
     
    public override void OnBeginDrag(PointerEventData eventData)
    {
        originSlotBox = transform.parent;
        base.OnBeginDrag(eventData);
    }
    public override void OnDrag(PointerEventData eventData) //moves an item to the mouse cursor position
    {
        base.OnDrag(eventData);
    }
    public override void OnEndDrag(PointerEventData eventData)
    {
        base.OnEndDrag(eventData);
        originSlotBox = transform.parent;
    }
    public override void OnPointerClick(PointerEventData eventData)
    {
        originSlotBox = transform.parent;
        if (eventData.button == PointerEventData.InputButton.Left)
        {
            Equipping(originSlotBox.gameObject.tag);
        }
    }
    private void Equipping(string slotType)
    {
        short index = inventoryController.GetIndexFreeSlot(dataItem, slotType);
        short index2 = equipmentController.GetIndexFreeSlot(dataItem, slotType);
        
        if (index != -1)
        {
            inventoryController.UpdatePickItem(dataItem, index, slotType);
            inventoryBoxController.RemoveItemFromInventory(dataItem); 
        }
        else if (index2 != -1)
        { 
            ItemScrObj oldItem = equipmentController.UpdatePickItem(dataItem, index, slotType);
            inventoryBoxController.RemoveItemFromInventory(dataItem);
            if(oldItem != null) inventoryBoxController.AddItemToInventory(oldItem);
        }
    }
}
