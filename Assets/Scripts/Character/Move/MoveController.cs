
using System;
using Zenject;
using Inventory_;

public class MoveController : ITickable
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
        
        bool isActiveInventoryBox = inventoryUI.isActiveInventory;

        if (isActiveInventoryBox || state.isParcour)
        {
            character.StopingMoveCharacter(true);
        }
        else character.StopingMoveCharacter(false);
    }
}
