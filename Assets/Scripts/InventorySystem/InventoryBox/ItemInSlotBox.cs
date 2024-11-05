
using UnityEngine.EventSystems;
using Zenject;

public class ItemInSlotBox : ItemInSlot
{
    public short slotIndexBox { get; set; } 
      
    private EquipmentController equipmentController;
    private InventoryController inventoryController;
    private InventoryBoxController inventoryBoxController;

    private InventorySlotBox originSlotBox;

    [Inject]
    private void Container(EquipmentController equipmenrt, InventoryController inventoryController, InventoryBoxController inventoryBoxController)
    {
        equipmentController = equipmenrt;
        this.inventoryController = inventoryController;
        this.inventoryBoxController = inventoryBoxController;
    }
     
    public override void OnBeginDrag(PointerEventData eventData)
    {
        originSlotBox = transform.GetComponentInParent<InventorySlotBox>();
        base.OnBeginDrag(eventData);
    }
    public override void OnDrag(PointerEventData eventData) //moves an item to the mouse cursor position
    {
        base.OnDrag(eventData);
    }
    public override void OnEndDrag(PointerEventData eventData)
    {
        base.OnEndDrag(eventData);
        originSlotBox = transform.GetComponentInParent<InventorySlotBox>();
    }
    public override void OnPointerClick(PointerEventData eventData)
    {
        if (eventData.button == PointerEventData.InputButton.Left)
        {
            Equipping(originSlotBox.gameObject.tag);
        }
    }
    private void Equipping(string slotType)
    {
        ItemScrObj oldItem = null;
        bool successfully = true;

        if (!equipmentController.equipmentItems.Contains(dataItem))
        {
            successfully = equipmentController.UpdatePickItem(dataItem, out oldItem, slotType);
        }
        else
        {
            successfully = inventoryController.UpdatePickItem(dataItem, out oldItem, slotType);
        }
        if (successfully)
        {
            inventoryBoxController.RemoveItemFromInventory(dataItem);
            if (oldItem != null) inventoryBoxController.AddItemToInventory(oldItem);
        }
    }
}
