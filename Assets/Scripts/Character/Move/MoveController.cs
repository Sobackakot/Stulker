
using System;
using Zenject;

public class MoveController : IInitializable, IDisposable 
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
    public void FixedTick_()
    {  
        character.Moving();
        bool isActiveInventoryBox = inventoryUI.isActiveInventory;
        character.StopingMoveCharacter(isActiveInventoryBox);
        character.SwitchVelocityMove();
        character.Rotating();
    }

    public void LateTick_()
    {
        character.RotateWithCamera();
    }
}
