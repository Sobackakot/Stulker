 
using UnityEngine;
using Zenject;

public class CharacterAnimator : MonoBehaviour
{
    //[SerializeField] private Animator animatorWeapon; 
    private Animator anim;   
    private Rigidbody rb;
    private Transform tr;

    [SerializeField] private float speedWalkAnimation = 0.5f;
    [SerializeField] private float speedRunAnimation = 0.8f;
    [SerializeField] private float speedSprint = 1f;
    private float angleTurn = 45f;
    private float angleMaxTurn = 90f;
    private float switchAngleTurn;
    private float speedAnimation;
    private int pickUpItemLayer;
    private int reloadWeaponLayer;
    private int equipWeaponLayer;
    private int runningLayer;
     
     
    private void Awake()
    {     
        anim = GetComponent<Animator>();
        rb = GetComponent<Rigidbody>();
        tr = GetComponent<Transform>();
        pickUpItemLayer = anim.GetLayerIndex("PickUpItem_Layer");
        reloadWeaponLayer = anim.GetLayerIndex("ReloadWeapon_Layer");
        equipWeaponLayer = anim.GetLayerIndex("Take_Weapon_Layer");
        runningLayer = anim.GetLayerIndex("Running_Layer"); 
    }
    private void OnAnimatorMove()
    {
        Vector3 newRot = new Vector3(
            tr.eulerAngles.x + anim.deltaRotation.eulerAngles.x,
            tr.eulerAngles.y + anim.deltaRotation.eulerAngles.y,
            tr.eulerAngles.z + anim.deltaRotation.eulerAngles.z);
        rb.MoveRotation(Quaternion.Euler(newRot)); 
    }
    public void MovAnimation(Vector3 inputAxis,bool isMoving)
    {
        if (inputAxis.sqrMagnitude > 0.2f && isMoving)
        { 
            anim.SetFloat("X", inputAxis.x * speedAnimation, 0.2f, Time.smoothDeltaTime);
            anim.SetFloat("Y", inputAxis.z * speedAnimation, 0.2f, Time.smoothDeltaTime);  
        }
        else
        {   
            anim.SetFloat("Y", 0, 0.2f, Time.smoothDeltaTime);
            anim.SetFloat("X", 0, 0.2f, Time.smoothDeltaTime);  
        } 
    } 
    public void TurnAnimation(Vector3 input, bool isRotate, bool isLimitAngle, bool isRun, float eulerAngle)
    {
        float currentDeltaMouse = anim.GetFloat("DeltaMouse");
        float smoothDeltaMouse = Mathf.Lerp(currentDeltaMouse, input.x * switchAngleTurn, 0.1f);
        if (isRotate && eulerAngle > 0 && isLimitAngle)
            anim.SetFloat("DeltaMouse", smoothDeltaMouse, 0.1f, Time.smoothDeltaTime);
        else if (Mathf.Abs(input.x) > 0.4f && isRun) 
            anim.SetFloat("DeltaMouse", smoothDeltaMouse, 0.1f, Time.smoothDeltaTime); 
        else anim.SetFloat("DeltaMouse", 0, 0.1f, Time.smoothDeltaTime); 
    } 
 
    public void SwitchAnimationTurn(float angle,bool isRotate)
    {
        if (isRotate)
            switchAngleTurn = angle >= 80 ? angleMaxTurn : angleTurn; 
    }
    public void SwithAnimationMove(bool isRanning, bool isWalking,bool isAiming, Vector3 inputAxis)
    {
        if (isWalking | isAiming) speedAnimation = speedWalkAnimation;
        else speedAnimation = isRanning ? (inputAxis.z > 0 ? speedSprint : speedRunAnimation) : speedRunAnimation;
    }
    public void RunningDiagonal(bool isRunDiagonal)
    {
        if (isRunDiagonal)
        {
            anim.SetLayerWeight(runningLayer, 1);
            anim.SetBool("isDiagonalRunning", true); 
        }
        else
        {
            anim.SetBool("isDiagonalRunning", false);
            anim.SetLayerWeight(runningLayer, 0); 
        }
    }
    public void CharacterState_OnJump()
    {
        anim.SetTrigger("isJumping"); 
    } 
    public void AimingAnimation(bool isAiming)
    {
        anim.SetBool("isAiming", isAiming);
    }
    public void CharacterState_OnRecharde()
    { 
        //animatorWeapon.SetTrigger("Reload"); 
    }
    public void CharacterState_OnCrouch()
    {
        anim.SetTrigger("isCrouching");
    }  
    public void CharacterState_OnReadyForBattle()
    {
        anim.SetTrigger("isReadyForBattle");
    }
    public void CharacterState_OnPickUpItem()
    {
        anim.SetLayerWeight(pickUpItemLayer, 1);
        anim.SetTrigger("PickUpItem_Trigger"); 
    }
    public void CharacterState_WeaponEquip(bool isEquipWeapon)
    {
        anim.SetLayerWeight(equipWeaponLayer, 1); 
        if (isEquipWeapon)
            anim.SetTrigger("EquipWeapon");
        else  anim.SetTrigger("UnquipWeapon");
    }
    public void ParkourUp(bool isParkour)
    {
        if (isParkour)
            anim.SetBool("isParkourUp", true);
    }
}
