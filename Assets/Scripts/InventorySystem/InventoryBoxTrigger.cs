 
using UnityEngine;
using Zenject;

public class InventoryBoxTrigger : MonoBehaviour
{
    private InventoryBoxGameObject boxInventoryPanel; 
    private InventoryPersonGameObject playerInventoryPanel;

    public InventoryBoxScrObj inventoryBoxScrObj;
    private InventoryBoxController inventoryBoxController;
    [Inject]
    private void Container(InventoryBoxController inventoryBoxController)
    {
        this.inventoryBoxController = inventoryBoxController;
    }

    private void Awake()
    {
        boxInventoryPanel = FindAnyObjectByType<InventoryBoxGameObject>();
        playerInventoryPanel = FindAnyObjectByType<InventoryPersonGameObject>();
        inventoryBoxScrObj.inventoryBoxData.SetNewInventoryBoxId();
    }
    private void OnTriggerEnter(Collider other)
    {
        if(other.gameObject.tag == "Player")
        {   
            boxInventoryPanel.gameObject.SetActive(true);
            playerInventoryPanel.gameObject.SetActive(true);
            inventoryBoxController.GetBoxByInventory(inventoryBoxScrObj);
        }
    }
    private void OnTriggerExit(Collider other)
    {
        if (other.gameObject.tag == "Player")
        {
            boxInventoryPanel.gameObject.SetActive(false);
            playerInventoryPanel.gameObject.SetActive(false);
        }
    }
}
