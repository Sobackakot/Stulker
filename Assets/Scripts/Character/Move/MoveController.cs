
using System;
using Zenject;

public class MoveController : IInitializable, IDisposable, IFixedTickable
{
    public MoveController(InputCharacter inputCharacter, CharacterMove character, 
        [Inject(Id = "inventoryBoxUI")]IInventoryUI inventoryUI)
    {
        this.inputCharacter = inputCharacter;
        this.character = character; 
        this.inventoryUI = inventoryUI;
    }

    private InputCharacter inputCharacter;
    private CharacterMove character;
    private IInventoryUI inventoryUI;
     
    public void Initialize()
    { 
        inputCharacter.onInputGetAxis += character.InputCharacter_OnAxisMove;
        inputCharacter.onKeyDownJump += character.InputCharacter_OnJumpingKeyDown;
    }
    public void Dispose()
    {
        inputCharacter.onInputGetAxis -= character.InputCharacter_OnAxisMove;
        inputCharacter.onKeyDownJump -= character.InputCharacter_OnJumpingKeyDown;
    } 
    public void FixedTick()
    { 
        character.Moving();
        bool isActiveInventoryBox = inventoryUI.isActiveInventory;
        character.StopingMoveCharacter(isActiveInventoryBox);
        character.SwitchVelocityMove();
    } 
}
