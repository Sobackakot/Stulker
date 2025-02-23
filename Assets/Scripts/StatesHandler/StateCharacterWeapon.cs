using System; 
using UnityEngine;
using StateGame;

public class StateCharacterWeapon : StateGameBase
{
    public StateCharacterWeapon(StateGameHandler stateGameHandler) : base(stateGameHandler) { }
    public override void EnterState()
    {  
        EventBus.Subscribe<ReloadWeaponEvent>(InputCharacter_OnReloadWeapon);
        EventBus.Subscribe<AimInputEvent>(InputCharacter_OnAim);
        EventBus.Subscribe<FireInputEvent>(InputCharacter_OnFire);
        EventBus.Subscribe<EquipWeaponToggleEvent>(InputCharacter_OnEquipWeapon);
    }

    public override void ExitState()
    {  
        EventBus.Unsubscribe<ReloadWeaponEvent>(InputCharacter_OnReloadWeapon);
        EventBus.Unsubscribe<AimInputEvent>(InputCharacter_OnAim);
        EventBus.Unsubscribe<FireInputEvent>(InputCharacter_OnFire);
        EventBus.Unsubscribe<EquipWeaponToggleEvent>(InputCharacter_OnEquipWeapon);
    }

    public override void UpdatState()
    { 
    }   
    public event Action OnReadyForBattleAnim; 
    public event Action OnReloadWeapon;
    public event Action<bool> OnEquipWeaponAnim;
     

    public bool isAim { get; private set; }
    public bool isFire { get; private set; } 
    public bool isReadyForBattle { get; private set; }    
    public bool isEquippingWeapon { get; private set; }
    public bool isAvailableWeapons { get; private set; }
    public bool isReloadWeapon { get; private set; }      

     
    public void InputCharacter_OnEquipWeapon(EquipWeaponToggleEvent equipEvent)
    {
        if (!isAim && !isReloadWeapon && isAvailableWeapons)
        {
            isReadyForBattle = !isReadyForBattle;
            OnEquipWeaponAnim?.Invoke(isReadyForBattle);
            OnReadyForBattleAnim?.Invoke();
        }
    }
    public void InputCharacter_OnAim(AimInputEvent aimEvent)
    {
        if (isReadyForBattle && !isReloadWeapon && !isEquippingWeapon)
            isAim = aimEvent.IsAiming;
    }
    public void InputCharacter_OnFire(FireInputEvent fireEvent)
    {
        if (isReadyForBattle && isAim)
            isFire = fireEvent.IsFiring;
    }
    public void InputCharacter_OnReloadWeapon(ReloadWeaponEvent reloadEvent)
    {
        if (!isAim && isReadyForBattle && !isReloadWeapon && !stateGameHandler.stateMove.isSprint)
        {
            OnReloadWeapon?.Invoke();
        }
    } 

    public void SetAvailableWeapon(bool isAvailableWeapons)
    {
        this.isAvailableWeapons = isAvailableWeapons;
    }
    public void SetReloadWeaponAnimationState(bool isReload)
    {
        isReloadWeapon = isReload;
    }
    public void SetEquipWeaponAnimationState(bool isEquiping)
    {
        isEquippingWeapon = isEquiping;
    } 
}
