 
using UnityEngine;

public class CharacterAnimator : MonoBehaviour
{ 
    private Animator animatorCharacter;  

    [SerializeField] private float speedWalkAnimation = 0.5f;
    [SerializeField] private float speedRunAnimation = 0.8f;
    [SerializeField] private float speedSprint = 1f;
    private float angleTurn = 0.5f;
    private float angleMaxTurn = 1;
    private float switchAngleTurn;
    private float speedAnimation;

    private void Awake()
    {     
        animatorCharacter = GetComponent<Animator>();
        //layerShooting = animatorCharacter.GetLayerIndex("Shooting");
    }
    public void MovAnimation(Vector3 inputAxis,bool isMoving)
    {
        if (inputAxis.sqrMagnitude > 0.2f && isMoving)
        {
            //animatorCharacter.SetLayerWeight(layerShooting, isShooting ? 1 : 0);
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
    public void JumpAnimation(bool isJumping)
    {
        if (isJumping)
            animatorCharacter.SetBool("isJumping", true);
        else
            animatorCharacter.SetBool("isJumping", false);
    } 
    public void AimingMove(bool isAiming)
    {   
        animatorCharacter.SetBool("isAimForButtle", isAiming);
    }
    public void ParkourUp(bool isParkour)
    {
        if (isParkour)
            animatorCharacter.SetBool("isParkourUp", true); 
    }    
    public void ActiveShooting(bool isShooting)
    {
        animatorCharacter.SetBool("isReadyForButtle", isShooting);
    } 
}
