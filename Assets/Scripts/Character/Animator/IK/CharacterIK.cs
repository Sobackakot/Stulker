 
using UnityEngine;
using UnityEngine.Animations.Rigging;

public class CharacterIK : MonoBehaviour
{
    [SerializeField] private Rig loockBody;
    [SerializeField] private Rig aimBody;
    [SerializeField] private Rig weaponParent;  
    [SerializeField] private Rig aimWeaponParent;
    [SerializeField] private Rig handsIK;
    [SerializeField] private Rig weaponEquipParent;
   
      
    [SerializeField] private float factor = 45f;
    private float weightAimWeapon;  
    private float weightReadyWeapon;
    private float weightEquipWeapon;
    private float weightLoockTarget;
     
    public void AimWeaponParentIK(bool isAiming, bool isReloadWeapon)
    {
        weightAimWeapon = isAiming ? (isReloadWeapon ? 0 : 1) : 0;
        aimWeaponParent.weight = Mathf.Lerp(aimWeaponParent.weight, weightAimWeapon, Time.fixedDeltaTime * factor);
        aimBody.weight = Mathf.Lerp(aimBody.weight, weightAimWeapon, Time.fixedDeltaTime * factor);  
    }
    public void WeaponParentIK(bool isReadyForBattle, bool isEquipingWeapon)
    {
        weightReadyWeapon = isReadyForBattle ? (isEquipingWeapon ? 0 : 1) : 0; 
        weaponParent.weight = Mathf.Lerp(weaponParent.weight, weightReadyWeapon, Time.fixedDeltaTime * factor);
        handsIK.weight = Mathf.Lerp(handsIK.weight, weightReadyWeapon, Time.fixedDeltaTime * factor);
    } 
    public void EquipWeaponParentIK(bool isReadyForBattle,bool availableWeapons)
    {
        weightEquipWeapon = availableWeapons ? (isReadyForBattle ? 0 : 1) : 0; 
        weaponEquipParent.weight = Mathf.Lerp(weaponEquipParent.weight, weightEquipWeapon, Time.fixedDeltaTime * factor); 
    } 
    public void BodyLoockTargetIK(bool idle, bool isAiming)
    {
        weightLoockTarget = idle ? (isAiming ? 0 : 1) : 0;
        loockBody.weight = Mathf.Lerp(loockBody.weight, weightLoockTarget, Time.fixedDeltaTime * factor);
    }


}
