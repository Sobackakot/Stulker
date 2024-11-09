 
using UnityEngine;
using Zenject;

public class InventoryBoxTrigger : MonoBehaviour
{
    private InventoryBoxGameObject boxInventoryPanel; 
    private InventoryPersonGameObject playerInventoryPanel;

    public InventoryBoxScrObj inventoryBoxScrObj;
    private InventoryBoxController inventoryBoxController;

    [SerializeField] private Material materialBox;
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
    private void Start()
    {
        materialBox.color = Color.red;
    }
    public void OnActiveInventoryBox(bool isActive)
    {
        boxInventoryPanel.gameObject.SetActive(isActive);
        playerInventoryPanel.gameObject.SetActive(isActive);
        inventoryBoxController.SetBoxByInventory(inventoryBoxScrObj);
        materialBox.color = Color.green;
    } 
}
