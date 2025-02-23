 
using UnityEngine;
using Zenject;
using StateGame;

public class InventoryBoxObjectUI : MonoBehaviour
{
    private InventoryObjectUI inventoryPerson;
    private StateGameHandler handlerState;

    [Inject]
    private void Construct(StateGameHandler handlerState)
    {
        this.handlerState = handlerState;
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
        handlerState.stateInventory.SetActiveInventory(true);
        inventoryPerson.onExitInventoryBox += InventoryPerson_OnExitInventoryBox;

    } 
    private void OnDisable()
    {
        handlerState.stateInventory.SetActiveInventory(false);
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
