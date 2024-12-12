
using System;
using Zenject;

public class MoveController : IInitializable, IDisposable, IFixedTickable, ILateTickable
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
        inputCharacter.OnMoveInput += character.InputCharacter_OnAxisMove;
        inputCharacter.OnJumpInput += character.InputCharacter_OnJumpingKeyDown;
    }
    public void Dispose()
    {
        inputCharacter.OnMoveInput -= character.InputCharacter_OnAxisMove;
        inputCharacter.OnJumpInput -= character.InputCharacter_OnJumpingKeyDown;
    }
    public void LateTick()
    {
        character.RotateWithCamera();
    }
    public void FixedTick()
    { 
        character.Moving();
        bool isActiveInventoryBox = inventoryUI.isActiveInventory;
        character.StopingMoveCharacter(isActiveInventoryBox);
        character.SwitchVelocityMove();
    } 
}
