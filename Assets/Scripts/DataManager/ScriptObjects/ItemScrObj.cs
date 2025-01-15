
using System;
using UnityEngine;

[CreateAssetMenu(fileName = "New Item", menuName = "InventoryItems/Item")]
public class ItemScrObj : ScriptableObject
{ 
    public string Id { get; private set; }
    public int amount =1;
    public string NameItem;
    public Sprite IconItem;
    public float Weight;
    public bool isDefaultItem;
    public bool isStackable;

    private bool isInstaled;

    public virtual bool IsCompatibleWithSlot(EquipFieldScrObj equipData)
    {
        // Default implementation for non-equipment items 
        return false;
    }
    public virtual bool IsEquipmentItem()
    {
        return false;
    }
    public virtual bool IsRequiredItem(EquipItemTypes itemType)
    {
        return false;
    }

    public void SetIdFromNewItem()
    {
        if (isInstaled)
        {
            Id = Guid.NewGuid().ToString();
            isInstaled = true;
        }
    } 
}

