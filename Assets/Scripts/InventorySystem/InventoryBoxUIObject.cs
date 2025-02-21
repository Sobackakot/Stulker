 
using UnityEngine;
using Zenject;

public class InventoryBoxObjectUI : MonoBehaviour
{
    private InventoryObjectUI inventoryPerson;
    private CharacterState state;

    [Inject]
    private void Construct(CharacterState state)
    {
        this.state = state;
    }
    private void Awake()
    {
        inventoryPerson = FindObjectOfType<InventoryObjectUI>();
    }
    private void Start()
    {
        gameObject.SetActive(false);
    }
    private void OnEnable()
    {
        state.SetActiveInventory(true);
        inventoryPerson.onExitInventoryBox += InventoryPerson_OnExitInventoryBox;

    } 
    private void OnDisable()
    {
        state.SetActiveInventory(false);
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
