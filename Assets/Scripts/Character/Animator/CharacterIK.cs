 
using UnityEngine;
using UnityEngine.Animations.Rigging;

public class CharacterIK : MonoBehaviour
{
    [SerializeField] private MultiAimConstraint twoBoneIKSpine;
    [SerializeField] private MultiAimConstraint twoBoneIKRightHand;
    [SerializeField] private MultiAimConstraint twoBoneIKTiltRightBody; 
    [SerializeField] private MultiAimConstraint twoBoneIKTiltLeftBody; 
    [SerializeField] private TwoBoneIKConstraint twoBoneIKLeftHand;
      
    [SerializeField] private Transform targetPointAim;
    [SerializeField] private Transform pointFromCamera;
     

    private float targetWeightAim;  
    private float targetWeightShoot;  
    private float targetWeightTiltRight;    
    private float targetWeightTiltLeft;    
    public void SetWeightIKAiming(bool isAiming)
    {
        twoBoneIKSpine.weight = Mathf.Lerp(twoBoneIKSpine.weight, targetWeightAim, Time.deltaTime * 10f);
        twoBoneIKRightHand.weight = Mathf.Lerp(twoBoneIKRightHand.weight, targetWeightAim, Time.deltaTime * 10f); 
        targetWeightAim = isAiming ? 1 : 0;
        targetPointAim.position = pointFromCamera.position;
    }
    public void SetWeightIKShooter(bool isShooter)
    {
        targetWeightShoot = isShooter ? 1 : 0;
        twoBoneIKLeftHand.weight = Mathf.Lerp(twoBoneIKLeftHand.weight, targetWeightShoot, Time.deltaTime * 10f);
    }
    public void SetWeightIKTiltRight(bool isTiltRight)
    {
        targetWeightTiltRight = isTiltRight ? 1 : 0;  
        twoBoneIKTiltRightBody.weight = Mathf.Lerp(twoBoneIKTiltRightBody.weight, targetWeightTiltRight, Time.deltaTime * 10f);
    }
    public void SetWeightIKTiltLeft(bool isisTiltLeft)
    {
        targetWeightTiltLeft = isisTiltLeft ? 1 : 0;
        twoBoneIKTiltLeftBody.weight = Mathf.Lerp(twoBoneIKTiltLeftBody.weight, targetWeightTiltLeft, Time.deltaTime * 10f);
    }
}
