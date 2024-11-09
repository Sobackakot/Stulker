
using System;
using UnityEngine;
using UnityEngine.InputSystem;
using Zenject;

public class InputCharacter : IInitializable, IDisposable
{
    public event Action<Vector2> onInputGetAxis;//This Event for  calss RaycastPointFollow  
    public event Action<bool> onGetKeyDownJump;
    public event Action<bool> onGetKeyRun;
    public event Action<bool> onActiveInventory;
    public event Action<bool> onActiveInventoryBox;
    public event Action<bool> onExitInventory;

    private InputActions inputActions;

    private bool isPressedKeyJump;
    private bool isPressedKeyRun;
    private bool isActiveInventory;
    public void Initialize()
    { 
        inputActions = new InputActions();
        inputActions.Enable();
        inputActions.ActionMaps.GetAxisDirectionMove.performed += ctx => OnInputGetAxisMove(ctx);
        inputActions.ActionMaps.GetAxisDirectionMove.canceled += ctx => OnInputGetAxisMove(ctx);

        inputActions.ActionMaps.GetKeyDownJump.performed += ctx => OnGetKeyDownJump(ctx);    
        inputActions.ActionMaps.GetKeyDownJump.canceled += ctx => OnGetKeyDownJump(ctx);    


        inputActions.ActionMaps.GetKeyRun.performed += ctx => OnGetKeyRun(ctx); 
        inputActions.ActionMaps.GetKeyRun.canceled += ctx => OnGetKeyRun(ctx);

        inputActions.ActionMaps.InventoryKey.performed += ctx => InventoryKey_performed(ctx);
        inputActions.ActionMaps.InventoryBoxKey.performed += ctx => InventoryBoxKey_performed(ctx);
        inputActions.ActionMaps.ExitInventoryKey.performed += ctx => ExitInventoryKey_performed(ctx);

    }

    public void Dispose()
    {
        inputActions.Dispose(); 
    }
    private void InventoryKey_performed(InputAction.CallbackContext context)
    {
        if (context.performed)
        {
            isActiveInventory = !isActiveInventory;
            onActiveInventory?.Invoke(isActiveInventory); //Switcher  activate  inventoryController person
        }
    }
    private void InventoryBoxKey_performed(InputAction.CallbackContext context)
    {
        if (context.performed)
        {
            isActiveInventory = !isActiveInventory;
            onActiveInventoryBox?.Invoke(isActiveInventory);
        }  
    }
    private void ExitInventoryKey_performed(InputAction.CallbackContext context)
    {
        if (context.performed && isActiveInventory)
        {
            isActiveInventory = false;
            onExitInventory?.Invoke(isActiveInventory); 
        }
    }
    private void OnInputGetAxisMove(InputAction.CallbackContext context)
    {
        if (context.performed)
            onInputGetAxis?.Invoke(context.ReadValue<Vector2>());
        else
            onInputGetAxis?.Invoke(Vector2.zero);

    }
    private void OnGetKeyDownJump(InputAction.CallbackContext context)
    {   
        isPressedKeyJump = context.performed;
        onGetKeyDownJump?.Invoke(isPressedKeyJump);
    }

    private void OnGetKeyRun(InputAction.CallbackContext context)
    {   
        isPressedKeyRun = context.performed;
        onGetKeyRun?.Invoke(isPressedKeyRun);
    }

}
