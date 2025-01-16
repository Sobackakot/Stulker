
using System;
using System.Collections.Generic;
using Zenject;


namespace Inventory_
{
    public class EquipmentController : IInventoryContoller, IInitializable, IDisposable
    {
        public EquipmentController([Inject(Id = "equipmentUI")] IInventoryUI equipmentUI, InventoryBoxGameObject inventoryBox)
        {
            this.equipmentUI = equipmentUI;
            this.inventoryBox = inventoryBox;

            int countSlotsItem = System.Enum.GetNames(typeof(EquipItemTypes)).Length; //get the number1 of equipmentSlots for equipmentUI items
            equipmentItems = new List<ItemScrObj>(countSlotsItem);
            for (int i = 0; i < countSlotsItem; i++)
            {
                equipmentItems.Add(null); //initialize item equipmentUI equipmentSlots
            }
        }
        private IInventoryUI equipmentUI;
        private InventoryBoxGameObject inventoryBox;

        public readonly List<ItemScrObj> equipmentItems;

        public void Initialize()
        {
            equipmentUI.onSetNewItem += GetCurrentItems;
        }
        public void Dispose()
        {
            equipmentUI.onSetNewItem -= GetCurrentItems;
        }

        public bool AddItemToInventory(ItemScrObj newItem)
        {
            for (byte i = 0; i < equipmentItems.Count; i++)
            {
                if (equipmentItems[i] == null)
                {
                    // update inventoryController equipmentSlots
                    equipmentItems[i] = newItem;
                    equipmentUI.SetNewItemByInventoryCell(newItem, i);
                    return true;
                }
            }
            return false;
        }
        public void RemoveItemFromInventory(ItemScrObj item)
        {
            for (byte i = 0; i < equipmentItems.Count; i++)
            {
                if (equipmentItems[i] == item)
                {
                    equipmentItems[i] = null;
                    equipmentUI.ResetItemByInventoryCell(i);// update inventoryController equipmentSlots 
                    return;
                }
            }
        }
        public ItemScrObj SwapItemFromInventory(ItemScrObj item, short index)
        {
            if (index >= 0 && index < equipmentItems.Count)
            {
                FreeUpOldSlot(item);
                ItemScrObj oldItem = null;
                if (equipmentItems[index] != null)
                {
                    oldItem = equipmentItems[index];
                }
                equipmentItems[index] = item;
                equipmentUI.SetNewItemByInventoryCell(item, index);
                return oldItem;
            }
            else return null;
        }

        private void FreeUpOldSlot(ItemScrObj item)
        {
            for (short i = 0; i < equipmentItems.Count; i++)
            {
                if (equipmentItems[i] == item)
                {
                    equipmentUI.ResetItemByInventoryCell(i);
                    equipmentItems[i] = null;
                }
            }
        }
        public ItemScrObj UpdatePickItem(ItemScrObj item, short index, string slotType)
        {
            if (slotType == "Slot" && item != null && item.IsEquipmentItem())
            {
                return SwapItemFromInventory(item, index);
            }
            else if (slotType == "SlotBox" && item != null && item.IsEquipmentItem())
            {
                return SwapItemFromInventory(item, index);
            }
            return null;
        }
        public List<ItemScrObj> GetCurrentItems()
        {
            return equipmentItems;
        }

        public short GetIndexFreeSlot(ItemScrObj item, string slotType)
        {
            return equipmentUI.GetIndexFreeSlot(item, slotType);
        }
        public bool CheckIsActiveInventoryBox()
        {
            return inventoryBox.isActiveInventoryBox;
        }
    }
}

