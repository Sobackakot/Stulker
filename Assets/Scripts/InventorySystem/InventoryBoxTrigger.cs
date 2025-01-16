 
using UnityEngine;
using Zenject;
using Inventory_;
public class InventoryBoxTrigger : MonoBehaviour
{
    private InventoryBoxGameObject boxInventoryPanel; 
    private InventoryPersonGameObject playerInventoryPanel;

    public InventoryBoxScrObj inventoryBoxScrObj;
    private IInventoryController inventoryBox;

    [SerializeField] private Material materialBox;
    [Inject]
    private void Container([Inject(Id = "inventoryBox")] IInventoryController inventoryBox)
    {
        this.inventoryBox = inventoryBox;
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
        inventoryBox.SetBoxByInventory(inventoryBoxScrObj);
        materialBox.color = Color.green;
    } 
}
