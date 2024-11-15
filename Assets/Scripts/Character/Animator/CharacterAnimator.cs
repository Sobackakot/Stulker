
using System; 
using UnityEngine;

public class CharacterAnimator : MonoBehaviour
{ 
    private Animator animatorCharacter;  

    [SerializeField] private float speedWalkAnimation = 0.5f;
    [SerializeField] private float speedRunAnimation = 0.8f;
    [SerializeField] private float speedSprint = 1f;
    private float speedAnimation;
    private bool isShooting;
    private int layerShooting;
     
    private void Awake()
    {     
        animatorCharacter = GetComponent<Animator>();
        layerShooting = animatorCharacter.GetLayerIndex("Shooting");
    }
    public void MovAnimation(Vector3 inputAxis)
    {
        if (inputAxis.sqrMagnitude > 0.2f)
        {
            animatorCharacter.SetLayerWeight(layerShooting, isShooting ? 1 : 0);
            animatorCharacter.SetFloat("X", inputAxis.x * speedAnimation, 0.2f, Time.deltaTime);
            animatorCharacter.SetFloat("Y", inputAxis.z * speedAnimation, 0.2f, Time.deltaTime);  
        }
        else
        {   
            animatorCharacter.SetFloat("Y", 0, 0.1f, Time.deltaTime);
            animatorCharacter.SetFloat("X", 0, 0.1f, Time.deltaTime);  
        } 
    }
 
    public void SwithAnimation(bool isRanning, bool isWalking, Vector3 inputAxis)
    {  
        if (inputAxis.z > 0)
        {
            speedAnimation = isWalking ? speedWalkAnimation : (isRanning ? speedSprint : speedRunAnimation);
        }
        else
        {
            speedAnimation = isWalking ? speedWalkAnimation :  speedRunAnimation;
        }  
    }
    public void JumpAnimation(bool isJumping)
    {
        if (isJumping)
            animatorCharacter.SetBool("isJumping", true);
        else
            animatorCharacter.SetBool("isJumping", false);
    } 
    public void ParkourUp(bool isParkour)
    {
        if (isParkour)
            animatorCharacter.SetBool("isParkourUp", true); 
    }    
    public void InputCharacter_OnActiveShooting(bool isShooting)
    {
        this.isShooting = isShooting;
    }
}
