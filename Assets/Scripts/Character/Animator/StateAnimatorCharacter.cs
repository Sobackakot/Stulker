 
using UnityEngine;
using Zenject;

public class StateAnimatorCharacter : StateMachineBehaviour
{
    public bool isKinematic { get; private set; }
    public bool isClimbing { get; private set; }
    public bool isClimbUp { get; private set; }
    public bool isParkour { get; private set; }
    public bool isJump { get; private set; }

    private CharacterState state;

    [Inject]
    private void Construct(CharacterState state)
    {
        this.state = state;
    }

    private void OnEnable()
    {
        isKinematic = false;
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
    private void ParkourStateEnter(AnimatorStateInfo stateInfo)
    {
        if (stateInfo.IsName("Parkour_Up"))
        {
            isParkour = true;
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
            isClimbing = false;
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
