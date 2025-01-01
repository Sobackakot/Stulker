 
using UnityEngine;
using Zenject;

public class AnimWeaponState : StateMachineBehaviour
{
    private CharacterState state;

    [Inject]
    private void Construct(CharacterState state)
    {
        this.state = state;
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
