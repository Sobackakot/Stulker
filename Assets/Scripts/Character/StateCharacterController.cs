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
        input.onGetKeyDownJump += state.InputCharacter_OnKeyDownJump;
        input.onGetKeyRun += state.InputCharacter_OnKeyRun;
        input.onGetKeyWalk += state.InputCharacter_OnKeyWalk;
        input.onRightMouseButton += state.InputCharacter_OnRightMouseButton;
        input.onLeftMouseButton += state.InputCharacter_OnLeftMouseButton;
        input.onKeyShooting += state.InputCharacter_OnActiveShooting;
    }

    public void Dispose()
    {
        input.onGetKeyDownJump -= state.InputCharacter_OnKeyDownJump;
        input.onGetKeyRun -= state.InputCharacter_OnKeyRun;
        input.onGetKeyWalk -= state.InputCharacter_OnKeyWalk;
        input.onRightMouseButton -= state.InputCharacter_OnRightMouseButton;
        input.onLeftMouseButton -= state.InputCharacter_OnLeftMouseButton;
        input.onKeyShooting -= state.InputCharacter_OnActiveShooting;
    } 
}
