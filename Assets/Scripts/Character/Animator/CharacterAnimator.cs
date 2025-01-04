 
using UnityEngine;
using Zenject;

public class CharacterAnimator : MonoBehaviour
{
    //[SerializeField] private Animator animatorWeapon; 
    private Animator animatorCharacter;   

    [SerializeField] private float speedWalkAnimation = 0.5f;
    [SerializeField] private float speedRunAnimation = 0.8f;
    [SerializeField] private float speedSprint = 1f;
    private float angleTurn = 0.5f;
    private float angleMaxTurn = 1;
    private float switchAngleTurn;
    private float speedAnimation;
    private int pickUpItemLayer;
    private int reloadWeaponLayer;
    private int equipWeaponLayer;
    private int runningLayer;
     
     
    private void Awake()
    {     
        animatorCharacter = GetComponent<Animator>();
        pickUpItemLayer = animatorCharacter.GetLayerIndex("PickUpItem_Layer");
        reloadWeaponLayer = animatorCharacter.GetLayerIndex("ReloadWeapon_Layer");
        equipWeaponLayer = animatorCharacter.GetLayerIndex("Take_Weapon_Layer");
        runningLayer = animatorCharacter.GetLayerIndex("Running_Layer"); 
    } 
    public void MovAnimation(Vector3 inputAxis,bool isMoving)
    {
        if (inputAxis.sqrMagnitude > 0.2f && isMoving)
        { 
            animatorCharacter.SetFloat("X", inputAxis.x * speedAnimation, 0.2f, Time.deltaTime);
            animatorCharacter.SetFloat("Y", inputAxis.z * speedAnimation, 0.2f, Time.deltaTime);  
        }
        else
        {   
            animatorCharacter.SetFloat("Y", 0, 0.2f, Time.deltaTime);
            animatorCharacter.SetFloat("X", 0, 0.2f, Time.deltaTime);  
        } 
    } 
    public void TurnAnimation(Vector3 input, bool isRotate, bool isLimitAngle)
    {
        if (isRotate && isLimitAngle && Mathf.Abs(input.x) > 0.2f) 
            animatorCharacter.SetFloat("DeltaMouse", input.x * switchAngleTurn, 0.2f, Time.deltaTime);
        else animatorCharacter.SetFloat("DeltaMouse", 0, 0.1f, Time.deltaTime);
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
    public void RunningDiagonal(bool isRunDiagonal)
    {
        if (isRunDiagonal)
        {
            animatorCharacter.SetLayerWeight(runningLayer, 1);
            animatorCharacter.SetBool("isDiagonalRunning", true); 
        }
        else
        {
            animatorCharacter.SetBool("isDiagonalRunning", false);
            animatorCharacter.SetLayerWeight(runningLayer, 0); 
        }
    }
    public void CharacterState_OnJump()
    {
        animatorCharacter.SetTrigger("isJumping"); 
    } 
    public void AimingAnimation(bool isAiming)
    {
        animatorCharacter.SetBool("isAiming", isAiming);
    }
    public void CharacterState_OnRecharde()
    { 
        //animatorWeapon.SetTrigger("Reload"); 
    }
    public void CharacterState_OnCrouch()
    {
        animatorCharacter.SetTrigger("isCrouching");
    }  
    public void CharacterState_OnReadyForBattle()
    {
        animatorCharacter.SetTrigger("isReadyForBattle");
    }
    public void CharacterState_OnPickUpItem()
    {
        animatorCharacter.SetLayerWeight(pickUpItemLayer, 1);
        animatorCharacter.SetTrigger("PickUpItem_Trigger"); 
    }
    public void CharacterState_WeaponEquip(bool isEquipWeapon)
    {
        animatorCharacter.SetLayerWeight(equipWeaponLayer, 1); 
        if (isEquipWeapon)
            animatorCharacter.SetTrigger("EquipWeapon");
        else  animatorCharacter.SetTrigger("UnquipWeapon");
    }
    public void ParkourUp(bool isParkour)
    {
        if (isParkour)
            animatorCharacter.SetBool("isParkourUp", true);
    }
}
