using UnityEngine;

namespace StateGame
{ 
    public interface IStateGame
    {
        abstract void EnterState();
        abstract void ExitState();
        abstract void UpdatState();
    }
}

