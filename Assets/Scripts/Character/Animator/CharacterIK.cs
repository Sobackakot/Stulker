 
using UnityEngine;
using UnityEngine.Animations.Rigging;

public class CharacterIK : MonoBehaviour
{
    [SerializeField] private Rig aimBody;
    [SerializeField] private Rig readyForButtleParent;  
    [SerializeField] private Rig aimWeaponParent;
    [SerializeField] private Rig handsIK; 
     
    [SerializeField] private MultiAimConstraint twoBoneIKSpine;
    [SerializeField] private MultiAimConstraint twoBoneIKLeanRightBody;
    [SerializeField] private MultiAimConstraint twoBoneIKLeanLeftBody;
 
    [SerializeField] private float offsetXSpineLeanRight = -45f;
    [SerializeField] private float offsetXSpineLeanLeft = 45f; 
    [SerializeField] private float factor = 45f;
    private float weightAim;  
    private float weightReady;

    private float targetWeightLeanRight;
    private float targetWeightLeanLeft;
    public void SetWeightIKAiming(bool isAiming)
    {
        weightAim = isAiming ? 1 : 0; 
        aimWeaponParent.weight = Mathf.Lerp(aimWeaponParent.weight, weightAim, Time.deltaTime * factor);
        aimBody.weight = Mathf.Lerp(aimBody.weight, weightAim, Time.deltaTime * factor);  
    }
    public void SetWeightIKReadyForBattle(bool isReadyForBattle, bool isReloadWeapon)
    {
        weightReady = isReadyForBattle ? (isReloadWeapon ? 0 : 1) : 0;
        readyForButtleParent.weight = Mathf.Lerp(readyForButtleParent.weight, weightReady, Time.deltaTime * factor);
        handsIK.weight = Mathf.Lerp(handsIK.weight, weightReady, Time.deltaTime * factor);
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
        if (isAim && isLeanLeft)
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
