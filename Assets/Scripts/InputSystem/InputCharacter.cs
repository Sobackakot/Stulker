
using System;
using UnityEngine;
using UnityEngine.InputSystem;
using Zenject;

public class InputCharacter : IInitializable, IDisposable
{   
    public event Action<Vector2> OnMoveInput;
    public event Action OnJumpInput;
    public event Action<bool> OnRunInput;
    public event Action<bool> OnWalkInput;
    public event Action OnReloadWeaponInput;
    public event Action<bool> OnAimInput;
    public event Action<bool> OnFireInput;
    public event Action<bool> OnLeanRightInput;
    public event Action<bool> OnLeanLeftInput;
    public event Action OnInventoryExitInput;

    public event Action OnEquipWeaponToggle;
    public event Action OnCrouchToggle; 
    public event Action OnReadyForBattleToggle;  
    public event Action<bool> OnInventoryToggle;
    public event Action<bool> OnInventoryBoxToggle;
    

    private InputActions inputActions;

    private bool isInventoryActive; 
    
    public void Initialize()
    { 
        inputActions = new InputActions();
        inputActions.Enable();
        

        inputActions.ActionMaps.Jump.performed += ctx => HandleJumpInput(ctx);      
        inputActions.ActionMaps.ReloadWeapon.performed += ctx => HandleReloadWeaponInput(ctx);
        inputActions.ActionMaps.ToggleEquipWeapon.performed += ctx => HandleEquipWeaponToggle(ctx); 
        inputActions.ActionMaps.ToggleEquipWeapon.performed += ctx => HandleReadyForBattleToggle(ctx);
        inputActions.ActionMaps.Crouch.performed += ctx => HandleCrouchToggle(ctx); 
        inputActions.ActionMaps.ToggleInventory.performed += ctx => HandleInventoryToggle(ctx);
        inputActions.ActionMaps.ToggleInventoryBox.performed += ctx => HandleInventoryBoxToggle(ctx);
        inputActions.ActionMaps.ExitInventory.performed += ctx => HandleInventoryExitInput(ctx);

        inputActions.ActionMaps.Move.performed += ctx => HandleMoveInput(ctx);
        inputActions.ActionMaps.Move.canceled += ctx => HandleMoveInput(ctx);

        inputActions.ActionMaps.Run.performed += ctx => HandleRunInput(ctx); 
        inputActions.ActionMaps.Run.canceled += ctx => HandleRunInput(ctx);

        inputActions.ActionMaps.Walk.performed += ctx => HandleWalkInput(ctx);
        inputActions.ActionMaps.Walk.canceled += ctx => HandleWalkInput(ctx);
         

        inputActions.ActionMaps.Aim.started += ctx => HandleAimInput(ctx);
        inputActions.ActionMaps.Aim.canceled += ctx => HandleAimInput(ctx);

        inputActions.ActionMaps.Fire.started += ctx => HandleFireInput(ctx);
        inputActions.ActionMaps.Fire.canceled += ctx => HandleFireInput(ctx);

        inputActions.ActionMaps.LeanRight.started += ctx => HandleLeanRightInput(ctx);
        inputActions.ActionMaps.LeanRight.canceled += ctx => HandleLeanRightInput(ctx);

        inputActions.ActionMaps.LeanLeft.started += ctx => HandleLeanLeftInput(ctx);
        inputActions.ActionMaps.LeanLeft.canceled += ctx => HandleLeanLeftInput(ctx);

    }

    public void Dispose()
    {
        inputActions.Dispose(); 
    }
    private void HandleLeanRightInput(InputAction.CallbackContext context)
    {
        if (context.started)
            OnLeanRightInput?.Invoke(true);
        else if (context.canceled) OnLeanRightInput?.Invoke(false);
    }
    private void HandleLeanLeftInput(InputAction.CallbackContext context)
    {
        if (context.started)
            OnLeanLeftInput?.Invoke(true);
        else if (context.canceled) OnLeanLeftInput?.Invoke(false);
    }
    private void HandleAimInput(InputAction.CallbackContext context)
    {
        if (context.started)
            OnAimInput?.Invoke(true);
        else if (context.canceled) OnAimInput?.Invoke(false);
    }
    private void HandleFireInput(InputAction.CallbackContext context)
    {
        if (context.started)
            OnFireInput?.Invoke(true);
        else if (context.canceled) OnFireInput?.Invoke(false);
    }
    private void HandleEquipWeaponToggle(InputAction.CallbackContext context)
    {
        if (context.performed)
            OnEquipWeaponToggle?.Invoke();
    }
    private void HandleReloadWeaponInput(InputAction.CallbackContext context)
    {
        if (context.performed)
            OnReloadWeaponInput?.Invoke(); 
    }
    private void HandleReadyForBattleToggle(InputAction.CallbackContext context)
    {
        if (context.performed)
        {
            OnReadyForBattleToggle?.Invoke();
        }
    }
    private void HandleCrouchToggle(InputAction.CallbackContext context)
    {
        if (context.performed)
        { 
            OnCrouchToggle?.Invoke();
        }
    }
    private void HandleInventoryToggle(InputAction.CallbackContext context)
    {
        if (context.performed)
        {
            isInventoryActive = !isInventoryActive;
            OnInventoryToggle?.Invoke(isInventoryActive); 
        }
    }
    private void HandleInventoryBoxToggle(InputAction.CallbackContext context)
    {
        if (context.performed)
        {
            isInventoryActive = !isInventoryActive;
            OnInventoryBoxToggle?.Invoke(isInventoryActive);
        }  
    }
    private void HandleInventoryExitInput(InputAction.CallbackContext context)
    {
        if (context.performed && isInventoryActive)
        {
            isInventoryActive = false;
            OnInventoryExitInput?.Invoke(); 
        }
    }
    private void HandleMoveInput(InputAction.CallbackContext context)
    {
        if (context.performed)
            OnMoveInput?.Invoke(context.ReadValue<Vector2>());
        else
            OnMoveInput?.Invoke(Vector2.zero);

    }
    private void HandleJumpInput(InputAction.CallbackContext context)
    {   
        if(context.performed)
            OnJumpInput?.Invoke();
    }
     
    private void HandleRunInput(InputAction.CallbackContext context)
    {    
        OnRunInput?.Invoke(context.performed);
    }
    private void HandleWalkInput(InputAction.CallbackContext context)
    { 
        OnWalkInput?.Invoke(context.performed);
    }

}
