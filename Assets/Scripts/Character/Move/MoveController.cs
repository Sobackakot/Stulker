
using System;
using Zenject;
using Inventory_;
using StateGame;

public class MoveController : ITickable
{
    public MoveController(CharacterMove character,
        StateGameHandler handlerState, [Inject(Id = "inventoryBoxUI")]IInventoryUI inventoryUI)
    { 
        this.character = character; 
        this.handlerState = handlerState; 
        this.inventoryUI = inventoryUI;  
    }
      
    private CharacterMove character;
    private StateGameHandler handlerState; 
    private IInventoryUI inventoryUI;
     
    
    public void FixedTick_()
    {  
        character.Moving(handlerState.stateMove.isMove); 
        character.SwitchVelocityMove(); 
        character.Rotating(handlerState.stateMove.isMove);
    }

    public void LateTick_()
    {
        character.RotateWithCamera();
    }

    public void Tick()
    {
        handlerState.stateMove.UpdateIsDiagonalRunning();
        
        bool isActiveInventoryBox = inventoryUI.isActiveInventory;

        if (isActiveInventoryBox || handlerState.stateMove.isParcour)
        {
            character.StopingMoveCharacter(true);
        }
        else character.StopingMoveCharacter(false);
    }
}
