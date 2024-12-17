 
using UnityEngine;
using UnityEngine.Animations.Rigging;

public class CharacterIK : MonoBehaviour
{
    [SerializeField] private MultiAimConstraint twoBoneIKSpine;
    [SerializeField] private MultiAimConstraint twoBoneIKHead;
    [SerializeField] private MultiAimConstraint twoBoneIKRightHand;
    [SerializeField] private MultiAimConstraint twoBoneIKLeanRightBody; 
    [SerializeField] private MultiAimConstraint twoBoneIKLeanLeftBody; 

    [SerializeField] private TwoBoneIKConstraint LeftHandAim; 

    [SerializeField] private float offsetXSpineAim = -25f;
    [SerializeField] private float offsetXSpineLeanRight = -45f;
    [SerializeField] private float offsetXSpineLeanLeft = 45f;
    [SerializeField] private Vector3 offsetHead = new Vector3(-15f,-25f,15f);

       
    private float targetWeightAim;  
    private float targetWeightShoot;  
    private float targetWeightLeanRight;    
    private float targetWeightLeanLeft;    
    public void SetWeightIKAiming(bool isAiming)
    {
        targetWeightAim = isAiming ? 1 : 0;
        twoBoneIKSpine.weight = Mathf.Lerp(twoBoneIKSpine.weight, targetWeightAim, Time.deltaTime * 10f);
        twoBoneIKRightHand.weight = Mathf.Lerp(twoBoneIKRightHand.weight, targetWeightAim, Time.deltaTime * 10f);
        twoBoneIKHead.weight = Mathf.Lerp(twoBoneIKHead.weight, targetWeightAim, Time.deltaTime * 10f);
        if (isAiming)
        {
            var data = twoBoneIKHead.data;
            twoBoneIKHead.data.offset = Vector3.Lerp(data.offset, offsetHead, Time.deltaTime * 7.5f); 
        }
        else
        {
            var data = twoBoneIKHead.data;
            twoBoneIKHead.data.offset = Vector3.Lerp(data.offset, Vector3.zero, Time.deltaTime * 7.5f);
        }
    }
    public void SetWeightIKReadyForBattle(bool isReadyForBattle, bool isReloadWeapon)
    {
        targetWeightShoot = isReadyForBattle ? (isReloadWeapon ? 0 : 1) : 0;
        LeftHandAim.weight = Mathf.Lerp(LeftHandAim.weight, targetWeightShoot, Time.deltaTime * 10f);
        if(isReadyForBattle)
        {
            Vector3 offsetRotate = new Vector3(offsetXSpineAim, 0,0);
            var data = twoBoneIKSpine.data; 
            twoBoneIKSpine.data.offset = Vector3.Lerp(data.offset, offsetRotate, Time.deltaTime * 7.5f);
        }
        else
        {
            var data = twoBoneIKSpine.data;
            twoBoneIKSpine.data.offset = Vector3.Lerp(data.offset, Vector3.zero, Time.deltaTime * 7.5f);
        }
    } 
    public void SetWeightIKLeanRight(bool isLeanRight, bool isAim)
    { 
        targetWeightLeanRight = isLeanRight ? 1 : 0;  
        twoBoneIKLeanRightBody.weight = Mathf.Lerp(twoBoneIKLeanRightBody.weight, targetWeightLeanRight, Time.deltaTime * 7.5f);
        if (isAim && isLeanRight)
        {
            // Adjust MultiAimConstraint rotation offset
            Vector3 offsetRotation = new Vector3(offsetXSpineLeanRight, 0, 0);
            var data = twoBoneIKLeanRightBody.data; 
            twoBoneIKLeanRightBody.data.offset = Vector3.Lerp(data.offset, offsetRotation, Time.deltaTime * 7.5f);
        }
        else
        {
            var data = twoBoneIKLeanRightBody.data;
            twoBoneIKLeanRightBody.data.offset = Vector3.Lerp(data.offset, Vector3.zero, Time.deltaTime * 7.5f);
        } 
    }
    public void SetWeightIKLeanLeft(bool isLeanLeft, bool isAim)
    {
        targetWeightLeanLeft = isLeanLeft ? 1 : 0;
        twoBoneIKLeanLeftBody.weight = Mathf.Lerp(twoBoneIKLeanLeftBody.weight, targetWeightLeanLeft, Time.deltaTime * 7.5f);
        if(isAim && isLeanLeft)
        {
            Vector3 offsetRotation = new Vector3(offsetXSpineLeanLeft, 0, 0);
            var data = twoBoneIKLeanLeftBody.data; 
            twoBoneIKLeanLeftBody.data.offset = Vector3.Lerp(data.offset, offsetRotation, Time.deltaTime * 7.5f);
        }
        else
        {
            var data = twoBoneIKLeanLeftBody.data;
            twoBoneIKLeanLeftBody.data.offset = Vector3.Lerp(data.offset, Vector3.zero, Time.deltaTime * 7.5f);
        }
    }

}
