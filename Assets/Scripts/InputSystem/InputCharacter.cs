
using System;
using UnityEngine; 
using Zenject;

public class InputCharacter : IInitializable, IDisposable
{   
    private InputActions inputActions;

    public void Initialize()
    { 
        inputActions = new InputActions();
        inputActions.Enable();
         
        inputActions.ActionMaps.Jump.performed += ctx => EventBus.Publish(new JumpInputEvent());
        inputActions.ActionMaps.ReloadWeapon.performed += ctx => EventBus.Publish(new ReloadWeaponEvent()); 
        inputActions.ActionMaps.Crouch.performed += ctx => EventBus.Publish(new CrouchToggleEvent());

        inputActions.ActionMaps.ExitInventory.performed += ctx => EventBus.Publish(new InventoryExitEvent());
        inputActions.ActionMaps.ToggleInventory.performed += ctx => EventBus.Publish(new InventoryObjectUIToggleEvent()); 
        inputActions.ActionMaps.ToggleInventoryBox.performed += ctx => EventBus.Publish(new InventoryBoxObjectUIToggleEvent());
        inputActions.ActionMaps.PickUpItem.performed += ctx => EventBus.Publish(new PickUpItemEvent());
        inputActions.ActionMaps.ToggleEquipWeapon.performed += ctx => EventBus.Publish(new EquipWeaponToggleEvent());

        inputActions.ActionMaps.Move.performed += ctx => EventBus.Publish(new MoveInputEvent(ctx.ReadValue<Vector2>()));
        inputActions.ActionMaps.Move.canceled += ctx => EventBus.Publish(new MoveInputEvent(Vector2.zero));

        inputActions.ActionMaps.Run.performed += ctx => EventBus.Publish(new RunInputEvent(true));
        inputActions.ActionMaps.Run.canceled += ctx => EventBus.Publish(new RunInputEvent(false));

        inputActions.ActionMaps.Walk.performed += ctx => EventBus.Publish(new WalkInputEvent(true));
        inputActions.ActionMaps.Walk.canceled += ctx => EventBus.Publish(new WalkInputEvent(false));

        inputActions.ActionMaps.Aim.started += ctx => EventBus.Publish(new AimInputEvent(true));
        inputActions.ActionMaps.Aim.canceled += ctx => EventBus.Publish(new AimInputEvent(false));

        inputActions.ActionMaps.Fire.started += ctx => EventBus.Publish(new FireInputEvent(true));
        inputActions.ActionMaps.Fire.canceled += ctx => EventBus.Publish(new FireInputEvent(false));

        inputActions.ActionMaps.LeanRight.started += ctx => EventBus.Publish(new LeanRightInputEvent(true));
        inputActions.ActionMaps.LeanRight.canceled += ctx => EventBus.Publish(new LeanRightInputEvent(false));

        inputActions.ActionMaps.LeanLeft.started += ctx => EventBus.Publish(new LeanLeftInputEvent(true));
        inputActions.ActionMaps.LeanLeft.canceled += ctx => EventBus.Publish(new LeanLeftInputEvent(false));

    }

    public void Dispose()
    {
        inputActions.ActionMaps.Jump.performed -= ctx => EventBus.Publish(new JumpInputEvent());
        inputActions.ActionMaps.ReloadWeapon.performed -= ctx => EventBus.Publish(new ReloadWeaponEvent()); 
        inputActions.ActionMaps.Crouch.performed -= ctx => EventBus.Publish(new CrouchToggleEvent());

        inputActions.ActionMaps.ExitInventory.performed -= ctx => EventBus.Publish(new InventoryExitEvent());
        inputActions.ActionMaps.ToggleInventory.performed -= ctx => EventBus.Publish(new InventoryObjectUIToggleEvent());
        inputActions.ActionMaps.ToggleInventoryBox.performed -= ctx => EventBus.Publish(new InventoryBoxObjectUIToggleEvent());
        inputActions.ActionMaps.PickUpItem.performed -= ctx => EventBus.Publish(new PickUpItemEvent());
        inputActions.ActionMaps.ToggleEquipWeapon.performed -= ctx => EventBus.Publish(new EquipWeaponToggleEvent());

        inputActions.ActionMaps.Move.performed -= ctx => EventBus.Publish(new MoveInputEvent(ctx.ReadValue<Vector2>()));
        inputActions.ActionMaps.Move.canceled -= ctx => EventBus.Publish(new MoveInputEvent(Vector2.zero));

        inputActions.ActionMaps.Run.performed -= ctx => EventBus.Publish(new RunInputEvent(true));
        inputActions.ActionMaps.Run.canceled -= ctx => EventBus.Publish(new RunInputEvent(false));

        inputActions.ActionMaps.Walk.performed -= ctx => EventBus.Publish(new WalkInputEvent(true));
        inputActions.ActionMaps.Walk.canceled -= ctx => EventBus.Publish(new WalkInputEvent(false));

        inputActions.ActionMaps.Aim.started -= ctx => EventBus.Publish(new AimInputEvent(true));
        inputActions.ActionMaps.Aim.canceled -= ctx => EventBus.Publish(new AimInputEvent(false));

        inputActions.ActionMaps.Fire.started -= ctx => EventBus.Publish(new FireInputEvent(true));
        inputActions.ActionMaps.Fire.canceled -= ctx => EventBus.Publish(new FireInputEvent(false));

        inputActions.ActionMaps.LeanRight.started -= ctx => EventBus.Publish(new LeanRightInputEvent(true));
        inputActions.ActionMaps.LeanRight.canceled -= ctx => EventBus.Publish(new LeanRightInputEvent(false));

        inputActions.ActionMaps.LeanLeft.started -= ctx => EventBus.Publish(new LeanLeftInputEvent(true));
        inputActions.ActionMaps.LeanLeft.canceled -= ctx => EventBus.Publish(new LeanLeftInputEvent(false));
        inputActions.Dispose(); 
    }
}
public struct MoveInputEvent
{
    public Vector2 Point;
    public MoveInputEvent(Vector2 direction) => Point = direction;
}// char move

public struct JumpInputEvent { }// char move, char anim

public struct RunInputEvent
{
    public bool IsRunning;
    public RunInputEvent(bool isRunning) => IsRunning = isRunning;
} //char state

public struct WalkInputEvent
{
    public bool IsWalking;
    public WalkInputEvent(bool isWalking) => IsWalking = isWalking;
} // char state

public struct ReloadWeaponEvent { } // char state

public struct AimInputEvent
{
    public bool IsAiming;
    public AimInputEvent(bool isAiming) => IsAiming = isAiming;
} // char state

public struct FireInputEvent
{
    public bool IsFiring;
    public FireInputEvent(bool isFiring) => IsFiring = isFiring;
}  // char state

public struct EquipWeaponToggleEvent { } // char state

public struct LeanRightInputEvent
{
    public bool IsLeaningRight;
    public LeanRightInputEvent(bool isLeaningRight) => IsLeaningRight = isLeaningRight;
}      // char state

public struct LeanLeftInputEvent
{
    public bool IsLeaningLeft;
    public LeanLeftInputEvent(bool isLeaningLeft) => IsLeaningLeft = isLeaningLeft;
}  // char state
  
public struct CrouchToggleEvent 
{
    public bool IsCrouching;
}  // char state

public struct InventoryExitEvent { } // character state
public struct InventoryObjectUIToggleEvent
{
    public bool IsActive; 
}// charac state

public struct InventoryBoxObjectUIToggleEvent
{
    public bool IsActive; 
}// camera ray, char state

public struct PickUpItemEvent 
{
    public bool isPickUp;
} // char state