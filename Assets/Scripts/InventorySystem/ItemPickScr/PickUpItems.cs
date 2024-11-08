
using System;
using UnityEngine; 
using Zenject;

public class PickUpItems : Interactable 
{   
    [field : SerializeField] public ItemScrObj item {  get; private set; }
    private InventoryController inventory;

    [Inject]
    private void Container(InventoryController inventory)
    {
        this.inventory = inventory;
    }
    public override void Interaction()
    {   
        base.Interaction(); //interaction with default item
        PickUpItem(); //pick up item in inventoryController
    }
    private void PickUpItem()
    {   
        if(!item.isDefaultItem)
        {
            bool isPickUp = inventory.AddItemToInventory(item);
            if (isPickUp)
            {
                Destroy(gameObject);
            }
        } 
    } 
}
      
