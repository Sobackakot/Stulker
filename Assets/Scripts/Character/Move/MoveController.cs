
using System;
using Zenject;

public class MoveController : IInitializable, IDisposable
{
    public MoveController(CharacterMove character,
        CharacterState state, [Inject(Id = "inventoryBoxUI")]IInventoryUI inventoryUI)
    { 
        this.character = character; 
        this.state = state;
        this.inventoryUI = inventoryUI; 
    }
      
    private CharacterMove character;
    private CharacterState state;
    private IInventoryUI inventoryUI;
     
    public void Initialize()
    {
        state.OnMoving += character.CharacterState_OnAxisMove;
        state.OnJumping += character.CharacterState_OnJumping;
    }
    public void Dispose()
    {
        state.OnMoving -= character.CharacterState_OnAxisMove;
        state.OnJumping -= character.CharacterState_OnJumping;
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
