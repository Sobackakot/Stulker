 
using UnityEngine;
using UnityEngine.EventSystems;
using Zenject;


namespace Inventory_
{
    public class InventorySlotBox : InventorySlot
    {
        private InventoryController inventoryController;
        private EquipmentController equipmentController;
        private InventoryBoxController inventoryBoxController;

        private RectTransform transformBoxSlot;

        [Inject]
        private void Container(InventoryController inventory, EquipmentController equipmentController, InventoryBoxController inventoryBoxController)
        {
            this.inventoryController = inventory;
            this.equipmentController = equipmentController;
            this.inventoryBoxController = inventoryBoxController;
        }
        private void Awake()
        {
            transformBoxSlot = GetComponent<RectTransform>();
        }

        public override void AddItemInSlot(ItemInSlot item, ItemScrObj data) //coll from class InventoryUI
        {
            base.AddItemInSlot(item, data);
        }
        public override void RemoveItemInSlot(ItemInSlot item)//coll from class InventoryUI
        {
            base.RemoveItemInSlot(item);
        }
        public override void OnDrop(PointerEventData eventData)
        {
            ItemInSlot dropItem = eventData.pointerDrag.GetComponent<ItemInSlot>();
            ItemScrObj itemData = dropItem.dataItem;
            if (transformBoxSlot?.childCount > 0 && itemData != null)
            {
                ItemInSlot pickItem = transformBoxSlot.GetChild(0).GetComponent<ItemInSlot>();
                if (!CheckDropItemType(dropItem, pickItem)) return;
            }
            base.OnDrop(eventData);
        }

        public override void DropItemInventory(ItemScrObj itemData, ItemInSlot dropItem)
        {
            base.DropItemInventory(itemData, dropItem);
        }
        public override bool CheckDropItemType(ItemInSlot dropItem, ItemInSlot pickItem)
        {
            Transform dropSlot = dropItem.originalSlot;
            if (dropSlot.gameObject.tag == "FastSlot") return false;
            if (dropSlot.gameObject.tag == "Slot" | dropSlot.gameObject.tag == "EquipSlot" && pickItem.dataItem != null) return false;
            if (UnEquip(dropItem, dropSlot.gameObject.tag)) return false;
            else return true;
        }
        private bool UnEquip(ItemInSlot dropItem, string slotType)
        {
            short index = inventoryBoxController.GetIndexFreeSlot(dropItem.dataItem, slotType);

            if (slotType == "EquipSlot" && index != -1)
            {
                inventoryBoxController.UpdatePickItem(dropItem.dataItem, index, slotType);
                equipmentController.RemoveItemFromInventory(dropItem.dataItem);
                return true;
            }
            else if (slotType == "Slot" && index != -1)
            {
                inventoryBoxController.UpdatePickItem(dropItem.dataItem, index, slotType);
                inventoryController.RemoveItemFromInventory(dropItem.dataItem);
                return true;
            }
            else return false;
        }
    }
}

