using StateGame;
using UnityEngine;
using Zenject;

public class CharacterAnimator : MonoBehaviour
{
    //[SerializeField] private Animator animatorWeapon; 
    private Animator anim;    
    private Transform tr;

    [SerializeField] private float speedWalkAnimation = 0.5f;
    [SerializeField] private float speedRunAnimation = 0.8f;
    [SerializeField] private float speedSprint = 1f;

    public Vector3 newAngleRotateCharacter { get; private set; }  
    private float angleTurn = 45f;
    private float angleMaxTurn = 90f;
    private float switchAngleTurn;
    private float speedAnimation;
     

    private int pickUpItemLayer;
    private int reloadWeaponLayer;
    private int equipWeaponLayer;
    private int runningLayer;


    bool fersCheck;
    bool secondCheck;
    bool thirdCheck;
    bool fourthCheck; 

    private StateGameHandler state;

    [Inject]
    private void Construct(StateGameHandler state)
    {
        this.state = state;
    }
    private void Awake()
    {     
        anim = GetComponent<Animator>(); 
        tr = GetComponent<Transform>();
        pickUpItemLayer = anim.GetLayerIndex("PickUpItem_Layer");
        reloadWeaponLayer = anim.GetLayerIndex("ReloadWeapon_Layer");
        equipWeaponLayer = anim.GetLayerIndex("Take_Weapon_Layer");
        runningLayer = anim.GetLayerIndex("Running_Layer"); 
    }
    private void OnEnable()
    {
        state.Move.OnJumping += InputCharacter_OnJump;
        state.Weapon.OnReadyForBattleAnim += CharacterState_OnReadyForBattle;
        state.Move.OnCrouchAnim += CharacterState_OnCrouch;
        //state.Weapon.OnReloadWeapon += CharacterState_OnRecharde;
        state.Item.OnPickUpItemAnim += CharacterState_OnPickUpItem;
        state.Weapon.OnEquipWeaponAnim += CharacterState_WeaponEquip;
    }
    private void OnDisable()
    {
        state.Move.OnJumping -= InputCharacter_OnJump;
        state.Weapon.OnReadyForBattleAnim -= CharacterState_OnReadyForBattle;
        state.Move.OnCrouchAnim -= CharacterState_OnCrouch;
        //state.Weapon.OnReloadWeapon -= CharacterState_OnRecharde;
        state.Item.OnPickUpItemAnim -= CharacterState_OnPickUpItem;
        state.Weapon.OnEquipWeaponAnim -= CharacterState_WeaponEquip;
    }
    public void StartingRunning(bool isIdle, bool isSprint)
    {
        if (isIdle) fersCheck = true;
        else if (!fersCheck) return;
        if (isSprint ) secondCheck = true;
        if (fersCheck && secondCheck)
        {
            anim.SetLayerWeight(runningLayer, 1);
            anim.SetTrigger("StartingRun");
            fersCheck = false;
            secondCheck = false;
        }
    }
     public void StoppingRunning(bool isIdle,bool isSprint)
     {
        if (isSprint) thirdCheck = true; 
        else if (!thirdCheck) return ;
        if(isIdle) fourthCheck = true;
        if(thirdCheck && fourthCheck)
        {
            anim.SetLayerWeight(runningLayer, 1);
            anim.SetTrigger("StoppingRun");
            thirdCheck = false;
            fourthCheck = false;
        } 
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
    public void TurnAnimation(Vector3 input, bool isRotate, bool isLimitAngle)
    {
        
        if (isRotate && isLimitAngle && Mathf.Abs(input.x) > 0.1f)
        {
            float currentDeltaMouse = anim.GetFloat("DeltaMouse");
            float smoothDeltaMouse = Mathf.Lerp(currentDeltaMouse, input.x * switchAngleTurn, 0.1f);
            anim.SetFloat("DeltaMouse", smoothDeltaMouse, 0.1f, Time.smoothDeltaTime);
        } else anim.SetFloat("DeltaMouse", 0, 0.1f, Time.smoothDeltaTime); 
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
    public void InputCharacter_OnJump()
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
    public void StartParcoureAnim(bool isParkour, string nameAnim)
    {
        if (isParkour)
        {
            anim.CrossFade(nameAnim, 0.2f); 
        }    
    } 
}
