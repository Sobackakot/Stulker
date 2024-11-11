using System;
using UnityEngine;
using Zenject;

public class InventoryPersonGameObject : MonoBehaviour
{ 
    private InputCharacter input;  
    public event Action<bool> onExitInventoryBox;

    [Inject]
    private void Container(InputCharacter input)
    {
        this.input = input;
    } 
    private void Start()
    {
        gameObject.SetActive(false);
    }
    private void OnEnable()
    {
        input.onActiveInventory += Input_OnActivateInventory;
        input.onExitInventory += Input_OnExitInventory; 
    } 
    private void OnDestroy()
    {
        input.onActiveInventory -= Input_OnActivateInventory;
        input.onExitInventory -= Input_OnExitInventory; 
    }
    private void Input_OnActivateInventory(bool isActive)
    {
        gameObject.SetActive(isActive);
        onExitInventoryBox?.Invoke(false);
    }
    private void Input_OnExitInventory(bool isExit)
    { 
        gameObject.SetActive(isExit);
        onExitInventoryBox?.Invoke(isExit);
    } 
    public void SetActiveInventory(bool isActive)
    {
        gameObject.SetActive(isActive);
    }
}
