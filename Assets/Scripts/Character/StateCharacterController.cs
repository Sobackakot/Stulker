using System;
using Zenject;

public class StateCharacterController : IInitializable, IDisposable
{ 
    public StateCharacterController(CharacterState state, InputCharacter input)
    {
        this.state = state;
        this.input = input;
    }
    private CharacterState state;
    private InputCharacter input;

    public void Initialize()
    { 
        input.OnRunInput += state.InputCharacter_OnRun;
        input.OnWalkInput += state.InputCharacter_OnWalk;
        input.OnAimInput += state.InputCharacter_OnAim;
        input.OnFireInput += state.InputCharacter_OnFire;
        input.OnReadyForBattleToggle += state.InputCharacter_OnReadyForBattle;
        input.OnCrouchToggle += state.InputCharacter_OnCrouch;
        input.OnEquipWeaponToggle += state.InputCharacter_OnEquipWeapon;
        
        input.OnLeanRightInput += state.InputCharacter_OnLeanRight;
        input.OnLeanLeftInput += state.InputCharacter_OnLeanLeft;
    }

    public void Dispose()
    { 
        input.OnRunInput -= state.InputCharacter_OnRun;
        input.OnWalkInput -= state.InputCharacter_OnWalk;
        input.OnAimInput -= state.InputCharacter_OnAim;
        input.OnFireInput -= state.InputCharacter_OnFire;
        input.OnReadyForBattleToggle -= state.InputCharacter_OnReadyForBattle;
        input.OnCrouchToggle -= state.InputCharacter_OnCrouch;
        input.OnEquipWeaponToggle -= state.InputCharacter_OnEquipWeapon;

        input.OnLeanRightInput -= state.InputCharacter_OnLeanRight;
        input.OnLeanLeftInput -= state.InputCharacter_OnLeanLeft;
    }
} 

