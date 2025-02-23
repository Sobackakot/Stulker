using System;
using UnityEngine;
using Zenject;
using StateGame;

public class InventoryObjectUI : MonoBehaviour
{  
    public event Action<bool> onExitInventoryBox;

    private StateGameHandler handlerState;

    [Inject]
    private void Construct(StateGameHandler handlerState)
    {
        this.handlerState = handlerState;
    }
    private void Start()
    {
        gameObject.SetActive(false);
    }
    private void OnEnable()
    {
        handlerState.stateInventory.OnActiveInventory += Input_OnActivateInventory;
        handlerState.stateInventory.OnExitInventory += Input_OnExitInventory;
    } 
    private void OnDestroy()
    {
        handlerState.stateInventory.OnActiveInventory -= Input_OnActivateInventory;
        handlerState.stateInventory.OnExitInventory -= Input_OnExitInventory;
    }
    private void Input_OnActivateInventory(bool isActive)
    {
        gameObject.SetActive(isActive);
        onExitInventoryBox?.Invoke(false);
    }
    private void Input_OnExitInventory()
    { 
        gameObject.SetActive(false);
        onExitInventoryBox?.Invoke(false);
    } 
    public void SetActiveInventory(bool isActive)
    {
        gameObject.SetActive(isActive);
    }
}
