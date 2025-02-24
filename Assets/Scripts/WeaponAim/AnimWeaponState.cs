 
using UnityEngine;
using Zenject;
using StateGame;

public class AnimWeaponState : StateMachineBehaviour
{
    private StateGameHandler handlerState;

    [Inject]
    private void Construct(StateGameHandler handlerState)
    {
        this.handlerState = handlerState;
    }

    public override void OnStateEnter(Animator animator, AnimatorStateInfo stateInfo, int layerIndex)
    {  
    }
    public override void OnStateExit(Animator animator, AnimatorStateInfo stateInfo, int layerIndex)
    {  
    }

    private void ReloadWeaponStateEnter(AnimatorStateInfo stateInfo)
    { 
        if (stateInfo.IsName("ReloadWeapon"))
        {
            //state.SetReloadWeaponAnimationState(true); 
        }

    }
    private void ReloadWeaponStateExit(AnimatorStateInfo stateInfo)
    { 
        if (stateInfo.IsName("ReloadWeapon"))
        {
            //state.SetReloadWeaponAnimationState(false); 
        }
    }
}
