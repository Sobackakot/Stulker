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
    public event Action OnReload;
    public event Action<bool> OnEquipAnim;
     

    public bool isAim { get; private set; }
    public bool isFire { get; private set; } 
    public bool isReadyForBattle { get; private set; }    
    public bool isEquipping { get; private set; }
    public bool isAvailable { get; private set; }
    public bool isReload { get; private set; }      

     
    public void InputCharacter_OnEquipWeapon(EquipWeaponToggleEvent equipEvent)
    {
        if (!isAim && !isReload && isAvailable)
        {
            isReadyForBattle = !isReadyForBattle;
            OnEquipAnim?.Invoke(isReadyForBattle);
            OnReadyForBattleAnim?.Invoke();
        }
    }
    public void InputCharacter_OnAim(AimInputEvent aimEvent)
    {
        if (isReadyForBattle && !isReload && !isEquipping)
            isAim = aimEvent.IsAiming;
    }
    public void InputCharacter_OnFire(FireInputEvent fireEvent)
    {
        if (isReadyForBattle && isAim)
            isFire = fireEvent.IsFiring;
    }
    public void InputCharacter_OnReloadWeapon(ReloadWeaponEvent reloadEvent)
    {
        if (!isAim && isReadyForBattle && !isReload && !stateGameHandler.Move.isSprint)
        {
            OnReload?.Invoke();
        }
    } 

    public void SetAvailableWeapon(bool isAvailableWeapons)
    {
        this.isAvailable = isAvailableWeapons;
    }
    public void SetReloadWeaponAnimationState(bool isReload)
    {
        this.isReload = isReload;
    }
    public void SetEquipWeaponAnimationState(bool isEquiping)
    {
        isEquipping = isEquiping;
    } 
}
