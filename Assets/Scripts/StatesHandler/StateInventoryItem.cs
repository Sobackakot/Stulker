using StateGame;
using System;

public class StateInventoryItem : StateGameBase
{
    public StateInventoryItem(StateGameHandler stateGameHandler) : base(stateGameHandler) { }

    public override void EnterState()
    {
        EventBus.Subscribe<PickUpItemEvent>(InputCharacter_OnPickUpItem);
    }

    public override void ExitState()
    {
        EventBus.Unsubscribe<PickUpItemEvent>(InputCharacter_OnPickUpItem);
    }

    public override void UpdatState()
    { 
    }


    public event Func<bool> OnGetItemFromHitRay;
    public event Action OnPickUpItemAnim;
    public bool isRayHitToItem { get; private set; }

    public void SetStateHitToItem(bool isHit)
    {
        isRayHitToItem = isHit;
    }
    public void InputCharacter_OnPickUpItem(PickUpItemEvent pickEvent)
    {
        if (isRayHitToItem && !stateGameHandler.Weapon.isReload)
        {
            OnPickUpItemAnim?.Invoke();
            if (OnGetItemFromHitRay != null && OnGetItemFromHitRay.Invoke())
            {
                stateGameHandler.Weapon.SetAvailableWeapon(true);
            }
        }
    }
}
