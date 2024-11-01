
using UnityEngine;
using UnityEngine.EventSystems;
using Zenject;

public class EquipmentItemInSlot : ItemInSlot
{  
    public int equipSlotIndex { get; set; } 
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
        base.OnBeginDrag(eventData);
    }
    public override void OnDrag(PointerEventData eventData)
    { 
        base.OnDrag(eventData);
    }
    public override void OnEndDrag(PointerEventData eventData)
    {
        base.OnEndDrag(eventData);
    }
    public override void OnPointerClick(PointerEventData eventData)
    {
        if (eventData.button == PointerEventData.InputButton.Left && dataItem != null)
        {
            //if (dataItem.itemType != EquipItems.None)
            //{ 
            //    equipmentController.UnEquipItem(dataItem); 
            //}
        }
    }
}
