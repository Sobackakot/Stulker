
using System;
using Zenject;
using Inventory_;
using StateGame;

public class MoveController : ITickable
{
    public MoveController(CharacterMove character, StateGameHandler state)
    { 
        this.character = character; 
        this.state = state;   
    }
      
    private CharacterMove character;
    private StateGameHandler state;  
     
    
    public void FixedTick_()
    {  
        character.Moving(state.Move.isMove); 
        character.SwitchVelocityMove(); 
        character.Rotating(state.Move.isMove);
    }

    public void LateTick_()
    {
        character.RotateWithCamera();
    }

    public void Tick()
    {
        state.Move.UpdateIsDiagonalRunning(); 
        if (state.Invent.isActive || state.Move.isParcour)
        {
            character.StopingMoveCharacter(true);
        }
        else character.StopingMoveCharacter(false);
    }
}
