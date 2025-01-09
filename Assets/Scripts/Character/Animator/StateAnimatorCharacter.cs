 
using UnityEngine;
using Zenject;

public class StateAnimatorCharacter : StateMachineBehaviour
{  
    public bool isJump { get; private set; }
    public bool isKinematic;
    public bool isClimbingStart;
    public bool isNextClimbing;
    public bool isFinishClimbing;

    public bool isParcureState;

    private CharacterState state;

    [Inject]
    private void Construct(CharacterState state)
    {
        this.state = state;
    }
     
    public override void OnStateEnter(Animator animator, AnimatorStateInfo stateInfo, int layerIndex)
    {
        ParkourStateEnter(stateInfo);
        JumpStateEnter(stateInfo);
        if(layerIndex ==  1)
            EquipWeaponEnter(stateInfo);
    }
    public override void OnStateExit(Animator animator, AnimatorStateInfo stateInfo, int layerIndex)
    {
        animator.SetBool("isParkourUp", false);
        animator.SetBool("isJumping", false);
        ParkourStateExit(stateInfo);
        JumpStateEnter(stateInfo);
        if (layerIndex == 1)
            EquipWeaponExit(stateInfo);
    }
    private void SprintStateEnter(AnimatorStateInfo stateInfo)
    {
        // Check if the animation is at the start
        if (stateInfo.normalizedTime < 0.1f)
        {
            // Compare the shortNameHash of the current state to a target animation
            if (stateInfo.shortNameHash == Animator.StringToHash("RunAnimation"))
            {
                Debug.Log("Run Animation Started!");
            }
        }
    }
    private void ParkourStateEnter(AnimatorStateInfo stateInfo)
    {
        isClimbingStart = stateInfo.IsName("StartClimbing");
        isNextClimbing = stateInfo.IsName("NextClimbing");
        isFinishClimbing = stateInfo.IsName("FinishClimbing");
        if (isClimbingStart || stateInfo.IsName("ClimbingUp") || stateInfo.IsName("ClimbingMini"))
        {
            isKinematic = true;
            isParcureState = true;
        } 
    }
    private void ParkourStateExit(AnimatorStateInfo stateInfo)
    {
        isClimbingStart = stateInfo.IsName("StartClimbing");
        isNextClimbing = stateInfo.IsName("NextClimbing");
        isFinishClimbing = stateInfo.IsName("FinishClimbing");
        if (isFinishClimbing || stateInfo.IsName("Climbing Down") || stateInfo.IsName("ClimbingMini"))
        {  
            isKinematic = false;
            isParcureState= false;
        } 
    }
    private void JumpStateEnter(AnimatorStateInfo stateInfo)
    {
        isJump = stateInfo.IsName("Jump_Run");
    }
    private void EquipWeaponEnter(AnimatorStateInfo stateInfo)
    {
        if (stateInfo.IsName("EquipWeapon"))
            state.SetEquipWeaponAnimationState(true);
    }
    private void EquipWeaponExit(AnimatorStateInfo stateInfo)
    {
        if(stateInfo.IsName("EquipWeapon"))
            state.SetEquipWeaponAnimationState(false);
    }
}
