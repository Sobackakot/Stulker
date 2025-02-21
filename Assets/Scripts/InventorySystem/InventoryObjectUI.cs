using System;
using UnityEngine;
using Zenject;

public class InventoryObjectUI : MonoBehaviour
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
        input.OnInventoryToggle += Input_OnActivateInventory;
        input.OnInventoryExitInput += Input_OnExitInventory; 
    } 
    private void OnDestroy()
    {
        input.OnInventoryToggle -= Input_OnActivateInventory;
        input.OnInventoryExitInput -= Input_OnExitInventory; 
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
