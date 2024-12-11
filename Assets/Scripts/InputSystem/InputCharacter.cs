
using System;
using UnityEngine;
using UnityEngine.InputSystem;
using Zenject;

public class InputCharacter : IInitializable, IDisposable
{   
    public event Action<Vector2> onInputGetAxis;

    public event Action<bool> onGetKeyDownEquipGun;
    public event Action onKeyDownJump;
    public event Action<bool> onGetKeyRun;
    public event Action<bool> onGetKeyWalk; 
    public event Action<bool> onGetKeyCrouch;

    
    public event Action onKeyShootingState; 
    public event Action onKeyCrouching;
    public event Action onKeyReloadingGun;

    public event Action<bool> onRightMouseButton;
    public event Action<bool> onLeftMouseButton;
    public event Action<bool> onTiltRightButton;
    public event Action<bool> onTiltLeftButton;

    public event Action<bool> onActiveInventory;
    public event Action<bool> onActiveInventoryBox;
    public event Action<bool> onExitInventory;

    private InputActions inputActions;

    private bool isActiveInventory; 
    
    public void Initialize()
    { 
        inputActions = new InputActions();
        inputActions.Enable();
        inputActions.ActionMaps.GetAxisDirectionMove.performed += ctx => OnInputGetAxisMove(ctx);
        inputActions.ActionMaps.GetAxisDirectionMove.canceled += ctx => OnInputGetAxisMove(ctx);

        inputActions.ActionMaps.GetKeyDownJump.performed += ctx => OnGetKeyDownJump(ctx);     
        inputActions.ActionMaps.GetKeyDownJump.canceled += ctx => OnGetKeyDownJump(ctx);

        inputActions.ActionMaps.ReloadingGunKey.performed += ctx => OnKeyReloadingGun(ctx); 

        inputActions.ActionMaps.GetKeyRun.performed += ctx => OnGetKeyRun(ctx); 
        inputActions.ActionMaps.GetKeyRun.canceled += ctx => OnGetKeyRun(ctx);

        inputActions.ActionMaps.GetKeyWalk.performed += ctx => OnGetKeyWalk(ctx);
        inputActions.ActionMaps.GetKeyWalk.canceled += ctx => OnGetKeyWalk(ctx);

        inputActions.ActionMaps.InventoryKey.performed += ctx => InventoryKey_performed(ctx);
        inputActions.ActionMaps.InventoryBoxKey.performed += ctx => InventoryBoxKey_performed(ctx);
        inputActions.ActionMaps.ExitInventoryKey.performed += ctx => ExitInventoryKey_performed(ctx);

        inputActions.ActionMaps.ShootingKey.performed += ctx => OnGetKeyDownEquipGun(ctx);
        inputActions.ActionMaps.ShootingKey.canceled += ctx => OnGetKeyDownEquipGun(ctx);

        inputActions.ActionMaps.ShootingKey.performed += ctx => ShootingKey_performed(ctx);
        inputActions.ActionMaps.CrouchingKey.performed += ctx => CrouchingKey_performed(ctx);

        inputActions.ActionMaps.RightMouseButton.started += ctx => RightMouseButton_performed(ctx);
        inputActions.ActionMaps.RightMouseButton.canceled += ctx => RightMouseButton_performed(ctx);

        inputActions.ActionMaps.LeftMouseButton.started += ctx => LeftMouseButton_performed(ctx);
        inputActions.ActionMaps.LeftMouseButton.canceled += ctx => LeftMouseButton_performed(ctx);

        inputActions.ActionMaps.TiltRightKey.started += ctx => TiltRightButton_performed(ctx);
        inputActions.ActionMaps.TiltRightKey.canceled += ctx => TiltRightButton_performed(ctx);

        inputActions.ActionMaps.TiltLeftKey.started += ctx => TiltLeftButton_performed(ctx);
        inputActions.ActionMaps.TiltLeftKey.canceled += ctx => TiltLeftButton_performed(ctx);

    }

    public void Dispose()
    {
        inputActions.Dispose(); 
    }
    private void TiltRightButton_performed(InputAction.CallbackContext context)
    {
        if (context.started)
            onTiltRightButton?.Invoke(true);
        else if (context.canceled) onTiltRightButton?.Invoke(false);
    }
    private void TiltLeftButton_performed(InputAction.CallbackContext context)
    {
        if (context.started)
            onTiltLeftButton?.Invoke(true);
        else if (context.canceled) onTiltLeftButton?.Invoke(false);
    }
    private void RightMouseButton_performed(InputAction.CallbackContext context)
    {
        if (context.started)
            onRightMouseButton?.Invoke(true);
        else if (context.canceled) onRightMouseButton?.Invoke(false);
    }
    private void LeftMouseButton_performed(InputAction.CallbackContext context)
    {
        if (context.started)
            onLeftMouseButton?.Invoke(true);
        else if (context.canceled) onLeftMouseButton?.Invoke(false);
    }
    private void OnGetKeyDownEquipGun(InputAction.CallbackContext context)
    {
        if (context.performed)
            onGetKeyDownEquipGun?.Invoke(true);
        else if (context.canceled)
            onGetKeyDownEquipGun?.Invoke(false);
    }
    private void OnKeyReloadingGun(InputAction.CallbackContext context)
    {
        if (context.performed)
            onKeyReloadingGun?.Invoke(); 
    }
    private void ShootingKey_performed(InputAction.CallbackContext context)
    {
        if (context.performed)
        {
            onKeyShootingState?.Invoke();
        }
    }
    private void CrouchingKey_performed(InputAction.CallbackContext context)
    {
        if (context.performed)
        { 
            onKeyCrouching?.Invoke();
        }
    }
    private void InventoryKey_performed(InputAction.CallbackContext context)
    {
        if (context.performed)
        {
            isActiveInventory = !isActiveInventory;
            onActiveInventory?.Invoke(isActiveInventory); 
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
        if(context.performed)
            onKeyDownJump?.Invoke();
    }
     
    private void OnGetKeyRun(InputAction.CallbackContext context)
    {    
        onGetKeyRun?.Invoke(context.performed);
    }
    private void OnGetKeyWalk(InputAction.CallbackContext context)
    { 
        onGetKeyWalk?.Invoke(context.performed);
    }

}
