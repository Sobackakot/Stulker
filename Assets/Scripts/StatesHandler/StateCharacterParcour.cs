 
using StateGame;
using System;

public class StateCharacterParcour : StateGameBase
{
    public StateCharacterParcour(StateGameHandler stateGameHandler) : base(stateGameHandler) { }
    public override void EnterState()
    { 
    }

    public override void ExitState()
    { 
    }

    public override void UpdatState()
    { 
    }      
    public bool isRayHitToObstacle { get; private set; }
    
    public void SetStateHitToObstacle(bool isHit)
    {
        isRayHitToObstacle = isHit;
    }
}
