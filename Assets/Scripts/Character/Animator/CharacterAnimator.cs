
using UnityEngine;
using Zenject;

public class CharacterAnimator : MonoBehaviour
{ 
    private Animator animator;   

    [SerializeField] private float speedWalkAnimation = 0.5f;
    [SerializeField] private float speedRunAnimation = 0.8f;
    [SerializeField] private float speedSprint = 1f;
    private float angleTurn = 0.5f;
    private float angleMaxTurn = 1;
    private float switchAngleTurn;
    private float speedAnimation;
    private int weaponEquipLayerIndex;
    private int weaponAimLayerIndex; 
     
    private void Awake()
    {     
        animator = GetComponent<Animator>();
        weaponEquipLayerIndex = animator.GetLayerIndex("WeaponEquip");
        weaponAimLayerIndex = animator.GetLayerIndex("Recharge"); 
    } 
   
    public void MovAnimation(Vector3 inputAxis,bool isMoving)
    {
        if (inputAxis.sqrMagnitude > 0.2f && isMoving)
        { 
            animator.SetFloat("X", inputAxis.x * speedAnimation, 0.2f, Time.deltaTime);
            animator.SetFloat("Y", inputAxis.z * speedAnimation, 0.2f, Time.deltaTime);  
        }
        else
        {   
            animator.SetFloat("Y", 0, 0.2f, Time.deltaTime);
            animator.SetFloat("X", 0, 0.2f, Time.deltaTime);  
        } 
    }
    public void TurnAnimation(Vector3 input, bool isRotate, bool isLimitAngle)
    {
        if (isRotate && isLimitAngle && Mathf.Abs(input.x) > 0.2f) 
            animator.SetFloat("DeltaMouse", input.x * switchAngleTurn, 0.2f, Time.deltaTime);
        else animator.SetFloat("DeltaMouse", 0, 0.1f, Time.deltaTime);
    }
 
    public void SwitchAnimationTurn(float angle,bool isRotate)
    {
        if (isRotate)
            switchAngleTurn = angle >= 125 ? angleMaxTurn : angleTurn; 
    }
    public void SwithAnimationMove(bool isRanning, bool isWalking,bool isAiming, Vector3 inputAxis)
    {
        if (isWalking | isAiming) speedAnimation = speedWalkAnimation;
        else speedAnimation = isRanning ? (inputAxis.z > 0 ? speedSprint : speedRunAnimation) : speedRunAnimation;
    }
    public void CharacterState_OnJump()
    {
        animator.SetTrigger("isJumping"); 
    } 
    public void AimingAnimation(bool isAiming)
    {
        animator.SetLayerWeight(weaponAimLayerIndex, 1);
        animator.SetBool("isAiming", isAiming);
    }
    public void CharacterState_OnRecharde()
    {
        animator.SetLayerWeight(weaponAimLayerIndex, 1);
        animator.SetTrigger("Recharge");
    }
    public void CharacterState_OnCrouch()
    {
        animator.SetTrigger("isCrouching");
    }  
    public void CharacterState_OnReadyForButtle()
    {
        animator.SetTrigger("isReadyForButtle");
    }
    private void WeaponEquip(bool isReadyForButtle)
    {
        animator.SetLayerWeight(weaponEquipLayerIndex, 1);
        if (isReadyForButtle)
            animator.SetTrigger("PullOut");
        else animator.SetTrigger("PutAway");
    }
    public void ParkourUp(bool isParkour)
    {
        if (isParkour)
            animator.SetBool("isParkourUp", true);
    }
}
