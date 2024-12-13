 
using UnityEngine;
using Zenject;

public class StateAnimatorCharacter : StateMachineBehaviour
{   
    private CharacterState state;
    public bool isMoving { get; private set; }
    public bool isKinematic { get; private set; } 
    public bool isClimbing { get; private set; }
    public bool isClimbUp {  get; private set; }
    public bool isParkour { get; private set; }
    public bool isJump {  get; private set; }  

    [Inject]
    private void Construct(CharacterState state)
    {
        this.state = state;
    }

    private void OnEnable()
    {
        isMoving = true;
        isKinematic = false;
    }
    public override void OnStateEnter(Animator animator, AnimatorStateInfo stateInfo, int layerIndex)
    { 
        ParkourStateEnter(stateInfo);
        JumpStateEnter(stateInfo);
        if(layerIndex == 2)
        {
            ReloadWeaponStateEnter(stateInfo); 
        }
            

    }
    public override void OnStateExit(Animator animator, AnimatorStateInfo stateInfo, int layerIndex)
    {   
        animator.SetBool("isParkourUp", false); 
        animator.SetBool("isJumping", false); 
        ParkourStateExit(stateInfo);
        JumpStateEnter(stateInfo);
        if (layerIndex == 2)
        {
            ReloadWeaponStateExit(stateInfo);
        }    
    } 
    private void ParkourStateEnter(AnimatorStateInfo stateInfo)
    {
        if (stateInfo.IsName("Parkour_Up"))
        {
            isParkour = true;
            isMoving = false;
            isKinematic = true;
        }
        isClimbUp = stateInfo.IsName("ClimbingUP");
        isClimbing = stateInfo.IsName("Freehang Climb");
    }
    private void ParkourStateExit(AnimatorStateInfo stateInfo)
    {
        isClimbUp = stateInfo.IsName("ClimbingUP");
        if (stateInfo.IsName("Freehang Climb"))
        {
            isParkour = false;
            isMoving = true;
            isKinematic = false; 
            isClimbing = false;
        } 
    }
    private void JumpStateEnter(AnimatorStateInfo stateInfo)
    {
        isJump = stateInfo.IsName("Jump_Run");
    }
    private void ReloadWeaponStateEnter(AnimatorStateInfo stateInfo)
    { 
        if (stateInfo.IsName("Recharge"))
        {
            state.SetReloadWeaponAnimationState(true); 
        }

    }
    private void ReloadWeaponStateExit(AnimatorStateInfo stateInfo)
    { 
        if (stateInfo.IsName("Recharge"))
        {
            state.SetReloadWeaponAnimationState(false); 
        }     
    }
}
