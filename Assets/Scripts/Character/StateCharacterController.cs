using System;
using Zenject;

public class StateCharacterController : IInitializable, IDisposable, ITickable
{ 
    public StateCharacterController(CharacterState state, InputCharacter input, InputCamera inputCamera)
    {
        this.state = state;
        this.input = input;
        this.inputCamera = inputCamera;
    }
    private CharacterState state;
    private InputCharacter input;
    private InputCamera inputCamera;

    public void Initialize()
    {
        input.OnMoveInput += state.InputCharacter_OnMove;
        input.OnJumpInput += state.InputCharacter_OnJamp;
        input.OnRunInput += state.InputCharacter_OnRun;
        input.OnWalkInput += state.InputCharacter_OnWalk;
        input.OnAimInput += state.InputCharacter_OnAim;
        input.OnFireInput += state.InputCharacter_OnFire; 
        input.OnCrouchToggle += state.InputCharacter_OnCrouch;
        input.OnEquipWeaponToggle += state.InputCharacter_OnEquipWeapon;
        //input.OnReloadWeaponInput += state.InputCharacter_OnReloadWeapon;

        inputCamera.OnSwitchCamera += state.InputCamera_OnSwitchCamera;

        input.OnInventoryBoxToggle += state.InputCharacter_OnSearcheInventoryBox;
        input.OnPickUpItem += state.InputCharacter_OnPickUpItem;


        input.OnLeanRightInput += state.InputCharacter_OnLeanRight;
        input.OnLeanLeftInput += state.InputCharacter_OnLeanLeft;
    }

    public void Dispose()
    {
        input.OnMoveInput -= state.InputCharacter_OnMove;
        input.OnJumpInput -= state.InputCharacter_OnJamp;
        input.OnRunInput -= state.InputCharacter_OnRun;
        input.OnWalkInput -= state.InputCharacter_OnWalk;
        input.OnAimInput -= state.InputCharacter_OnAim;
        input.OnFireInput -= state.InputCharacter_OnFire; 
        input.OnCrouchToggle -= state.InputCharacter_OnCrouch;
        input.OnEquipWeaponToggle -= state.InputCharacter_OnEquipWeapon;
        //input.OnReloadWeaponInput -= state.InputCharacter_OnReloadWeapon;

        inputCamera.OnSwitchCamera -= state.InputCamera_OnSwitchCamera;

        input.OnInventoryBoxToggle -= state.InputCharacter_OnSearcheInventoryBox;
        input.OnPickUpItem -= state.InputCharacter_OnPickUpItem;

        input.OnLeanRightInput -= state.InputCharacter_OnLeanRight;
        input.OnLeanLeftInput -= state.InputCharacter_OnLeanLeft;
    }

    public void Tick()
    {
        state.UpdateIsDiagonalRunning();
    }
} 

