 
using UnityEngine;
using UnityEngine.EventSystems; 

public class EquipmentSlot : InventorySlot
{ 
    public EquipFieldScrObj equipFieldData;
     
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
            base.OnDrop(eventData);
        else Debug.Log("is not an equipment slot item");
    } 
}
