using System;
using UnityEngine;
using Zenject;
using Zenject.SpaceFighter;

public class InventoryObjectUI : MonoBehaviour
{ 
    private CharacterState state;  
    public event Action<bool> onExitInventoryBox;

    [Inject]
    private void Container(CharacterState state)
    {
        this.state = state;
    } 
    private void Start()
    {
        gameObject.SetActive(false);
    }
    private void OnEnable()
    {
        state.OnActiveInventory += Input_OnActivateInventory;
        state.OnExitInventory += Input_OnExitInventory;
    } 
    private void OnDestroy()
    {
        state.OnActiveInventory -= Input_OnActivateInventory;
        state.OnExitInventory -= Input_OnExitInventory;
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
