 
using UnityEngine;
using Zenject;

public class StateAnimatorCharacter : StateMachineBehaviour
{ 
    public bool isClimbing { get; private set; }
    public bool isClimbUp { get; private set; }
    public bool isParkour { get; private set; }
    public bool isJump { get; private set; }
    public bool isKinematic;

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
        if (stateInfo.IsName("Parkour_Up"))
        {
            isKinematic = true;
            isParkour = true; 
        }
        isClimbUp = stateInfo.IsName("ClimbingUP");
        isClimbing = stateInfo.IsName("Freehang Climb");
    }
    private void ParkourStateExit(AnimatorStateInfo stateInfo)
    {
        isParkour = stateInfo.IsName("Parkour_Up");
        isClimbUp = stateInfo.IsName("ClimbingUP");
        if (stateInfo.IsName("Freehang Climb"))
        { 
            isClimbing = false; 
            isKinematic = false;
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
