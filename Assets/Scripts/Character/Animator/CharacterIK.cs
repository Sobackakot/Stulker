 
using UnityEngine;
using UnityEngine.Animations.Rigging;

public class CharacterIK : MonoBehaviour
{
    [SerializeField] private MultiAimConstraint twoBoneIKSpine;
    [SerializeField] private MultiAimConstraint twoBoneIKRightHand;
    [SerializeField] private TwoBoneIKConstraint twoBoneIKLeftHand;
     
    [SerializeField] private Transform targetPointAim;
    [SerializeField] private Transform pointFromCamera;
    private float targetWeightAim;  
    private float targetWeightShoot;  
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
}
