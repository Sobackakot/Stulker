 
using UnityEngine;
using Zenject;

public class InventoryBoxGameObject : MonoBehaviour
{
    private InventoryPersonGameObject inventoryPanel;

    public bool isActiveInventory { get; private set; }

    [Inject]
    private void Container(InventoryPersonGameObject inventoryPanel)
    {
        this.inventoryPanel = inventoryPanel;
    }
    private void Start()
    {
        gameObject.SetActive(false);
    }

    private void OnEnable()
    {
        isActiveInventory = true;
        inventoryPanel.gameObject.SetActive(true);
    }
    private void OnDisable()
    {
        isActiveInventory = false;
        inventoryPanel.gameObject.SetActive(false);
    }
}
