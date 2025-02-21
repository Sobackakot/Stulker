
using System;
using Zenject;
using Inventory_;

public class MoveController : IInitializable, IDisposable , ITickable
{
    public MoveController(CharacterMove character,
        CharacterState state, CharacterParcure parcure, [Inject(Id = "inventoryBoxUI")]IInventoryUI inventoryUI)
    { 
        this.character = character; 
        this.state = state;
        this.parcoure = parcure;
        this.inventoryUI = inventoryUI;  
    }
      
    private CharacterMove character;
    private CharacterState state;
    private CharacterParcure parcoure;
    private IInventoryUI inventoryUI;
     
    public void Initialize()
    {
        state.OnMoving += character.CharacterState_OnAxisMove;
        state.OnJumping += character.CharacterState_OnJumping;
        state.OnParcoure += parcoure.CharacterState_OnParcoure;
    }
    public void Dispose()
    {
        state.OnMoving -= character.CharacterState_OnAxisMove;
        state.OnJumping -= character.CharacterState_OnJumping;
        state.OnParcoure -= parcoure.CharacterState_OnParcoure;
    } 
    public void FixedTick_()
    {  
        character.Moving(state.isMove); 
        character.SwitchVelocityMove(state); 
        character.Rotating(state.isMove);
    }

    public void LateTick_()
    {
        character.RotateWithCamera();
    }

    public void Tick()
    {
        state.UpdateIsDiagonalRunning();
        bool isParcoure = parcoure.UpdateParcour(); 
        state.SetStateParcour(isParcoure);
        bool isActiveInventoryBox = inventoryUI.isActiveInventory;

        if (isActiveInventoryBox || isParcoure)
        {
            character.StopingMoveCharacter(true);
        }
        else character.StopingMoveCharacter(false);
    }
}
