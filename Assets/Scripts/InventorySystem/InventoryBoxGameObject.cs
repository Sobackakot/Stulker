 
using UnityEngine;

public class InventoryBoxGameObject : MonoBehaviour
{
    private InventoryPersonGameObject inventoryPerson;
    public bool isActiveInventoryBox { get; private set; }
    private void Awake()
    {
        inventoryPerson = FindObjectOfType<InventoryPersonGameObject>();
    }
    private void Start()
    {
        gameObject.SetActive(false);
    }
    private void OnEnable()
    {
        isActiveInventoryBox = true;
        inventoryPerson.onExitInventoryBox += InventoryPerson_OnExitInventoryBox;

    } 
    private void OnDisable()
    {
        isActiveInventoryBox = false; 
    }
    private void OnDestroy()
    {
        inventoryPerson.onExitInventoryBox -= InventoryPerson_OnExitInventoryBox;
    }
    private void InventoryPerson_OnExitInventoryBox(bool isExit)
    {
        gameObject.SetActive(isExit); 
    }
}
