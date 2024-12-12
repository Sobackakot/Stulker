 
using UnityEngine;
using UnityEngine.Animations.Rigging;

public class CharacterIK : MonoBehaviour
{
    [SerializeField] private MultiAimConstraint twoBoneIKSpine;
    [SerializeField] private MultiAimConstraint twoBoneIKRightHand;
    [SerializeField] private MultiAimConstraint twoBoneIKLeanRightBody; 
    [SerializeField] private MultiAimConstraint twoBoneIKLeanLeftBody; 
    [SerializeField] private TwoBoneIKConstraint twoBoneIKLeftHand;
      
    [SerializeField] private Transform targetPointAim;
    [SerializeField] private Transform pointFromCamera;
     

    private float targetWeightAim;  
    private float targetWeightShoot;  
    private float targetWeightLeanRight;    
    private float targetWeightLeanLeft;    
    public void SetWeightIKAiming(bool isAiming)
    {
        twoBoneIKSpine.weight = Mathf.Lerp(twoBoneIKSpine.weight, targetWeightAim, Time.deltaTime * 10f);
        twoBoneIKRightHand.weight = Mathf.Lerp(twoBoneIKRightHand.weight, targetWeightAim, Time.deltaTime * 10f); 
        targetWeightAim = isAiming ? 1 : 0;
        targetPointAim.position = pointFromCamera.position;
    }
    public void SetWeightIKReadyForBattle(bool isReadyForBattle, bool isReloadWeapon)
    {
        targetWeightShoot = isReadyForBattle ? (isReloadWeapon ? 0 : 1) : 0;
        twoBoneIKLeftHand.weight = Mathf.Lerp(twoBoneIKLeftHand.weight, targetWeightShoot, Time.deltaTime * 10f);
    }
    public void SetWeightIKLeanRight(bool isLeanRight, bool isAim)
    { 
        targetWeightLeanRight = isLeanRight ? 1 : 0;  
        twoBoneIKLeanRightBody.weight = Mathf.Lerp(twoBoneIKLeanRightBody.weight, targetWeightLeanRight, Time.deltaTime * 7.5f);
        if (isAim && isLeanRight)
        {
            // Adjust MultiAimConstraint rotation offset
            Vector3 offsetRotation = new Vector3(-45f, 0, 0);
            var data = twoBoneIKLeanRightBody.data;
            data.offset = Vector3.Lerp(data.offset, offsetRotation, Time.deltaTime * 7.5f);
            twoBoneIKLeanRightBody.data = data;
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
            Vector3 offsetRotation = new Vector3(45f, 0, 0);
            var data = twoBoneIKLeanLeftBody.data;
            data.offset = Vector3.Lerp(data.offset, offsetRotation, Time.deltaTime * 7.5f);
            twoBoneIKLeanLeftBody.data = data;
        }
        else
        {
            var data = twoBoneIKLeanLeftBody.data;
            twoBoneIKLeanLeftBody.data.offset = Vector3.Lerp(data.offset, Vector3.zero, Time.deltaTime * 7.5f);
        }
    }

}
