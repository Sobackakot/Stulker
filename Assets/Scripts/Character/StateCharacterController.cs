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
        input.onGetKeyRun += state.InputCharacter_OnKeyRun;
        input.onGetKeyWalk += state.InputCharacter_OnKeyWalk;
        input.onRightMouseButton += state.InputCharacter_OnRightMouseButton;
        input.onLeftMouseButton += state.InputCharacter_OnLeftMouseButton;
        input.onKeyShootingState += state.InputCharacter_OnActiveShooting;
        input.onKeyCrouching += state.InputCharacter_OnActiveCrouching;
        input.onGetKeyDownEquipGun += state.InputCharacter_OnKeyDownEquipGun;
        
        input.onTiltRightButton += state.InputCharacter_OnTiltRightButton;
        input.onTiltLeftButton += state.InputCharacter_OnTiltLeftButton;
    }

    public void Dispose()
    { 
        input.onGetKeyRun -= state.InputCharacter_OnKeyRun;
        input.onGetKeyWalk -= state.InputCharacter_OnKeyWalk;
        input.onRightMouseButton -= state.InputCharacter_OnRightMouseButton;
        input.onLeftMouseButton -= state.InputCharacter_OnLeftMouseButton;
        input.onKeyShootingState -= state.InputCharacter_OnActiveShooting;
        input.onKeyCrouching -= state.InputCharacter_OnActiveCrouching;
        input.onGetKeyDownEquipGun -= state.InputCharacter_OnKeyDownEquipGun;

        input.onTiltRightButton -= state.InputCharacter_OnTiltRightButton;
        input.onTiltLeftButton -= state.InputCharacter_OnTiltLeftButton;
    }
} 

