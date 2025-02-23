 
using UnityEngine;
using Zenject;
using StateGame;

public class StateAnimatorCharacter : StateMachineBehaviour
{  
    public bool isJump { get; private set; }
    public bool isKinematic;

    public bool isStartClimbing;
    public bool isNextClimbing;
    public bool isFinishClimbing;

    public bool isJumpOn;  
    public bool isStepUp; 
    public bool isJumpingObstacle;

    public bool isParcoureState;

    private StateGameHandler handlerState;

    [Inject]
    private void Construct(StateGameHandler handlerState)
    {
        this.handlerState = handlerState;
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
            // Compare the shortNameHash of the current handlerState to a target animation
            if (stateInfo.shortNameHash == Animator.StringToHash("RunAnimation"))
            {
                Debug.Log("Run Animation Started!");
            }
        }
    }
    private void ParkourStateEnter(AnimatorStateInfo stateInfo)
    {
        isStartClimbing = stateInfo.IsName("StartClimbing");
        isNextClimbing = stateInfo.IsName("NextClimbing");
        isFinishClimbing = stateInfo.IsName("FinishClimbing");

        isStepUp = stateInfo.IsName("StepUp");
        isJumpingObstacle = stateInfo.IsName("JumpingObstacle");
        isJumpOn = stateInfo.IsName("JumpOn"); 

        if (isStartClimbing || isStepUp || isJumpOn || isJumpingObstacle)
        {
            isKinematic = true;
            isParcoureState = true;
        } 
    }
    private void ParkourStateExit(AnimatorStateInfo stateInfo)
    {
        isStartClimbing = stateInfo.IsName("StartClimbing");
        isNextClimbing = stateInfo.IsName("NextClimbing");
        isFinishClimbing = stateInfo.IsName("FinishClimbing");

        isStepUp = stateInfo.IsName("StepUp");
        isJumpingObstacle = stateInfo.IsName("JumpingObstacle");
        isJumpOn = stateInfo.IsName("JumpOn"); 

        if (isFinishClimbing || isJumpingObstacle || isJumpOn || isStepUp)
        {  
            isKinematic = false;
            isParcoureState= false;
        } 
    }
    private void JumpStateEnter(AnimatorStateInfo stateInfo)
    {
        isJump = stateInfo.IsName("Jump_Run");
    }
    private void EquipWeaponEnter(AnimatorStateInfo stateInfo)
    {
        if (stateInfo.IsName("EquipWeapon"))
            handlerState.stateWeapon.SetEquipWeaponAnimationState(true);
    }
    private void EquipWeaponExit(AnimatorStateInfo stateInfo)
    {
        if(stateInfo.IsName("EquipWeapon"))
            handlerState.stateWeapon.SetEquipWeaponAnimationState(false);
    }
}
