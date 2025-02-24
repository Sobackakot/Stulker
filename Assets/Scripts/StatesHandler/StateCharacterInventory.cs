 
using StateGame;
using System;

public class StateCharacterInventory : StateGameBase
{
    public StateCharacterInventory(StateGameHandler stateGameHandler) : base(stateGameHandler) { }
    

    public override void EnterState()
    { 
        EventBus.Subscribe<InventoryExitEvent>(InputCharacter_OnExitInventory);
        EventBus.Subscribe<InventoryBoxObjectUIToggleEvent>(InputCharacter_OnSearcheInventoryBox);
        EventBus.Subscribe<InventoryObjectUIToggleEvent>(InputCharacter_OnOppenInventory);  
    }

    public override void ExitState()
    { 
        EventBus.Unsubscribe<InventoryExitEvent>(InputCharacter_OnExitInventory);
        EventBus.Unsubscribe<InventoryBoxObjectUIToggleEvent>(InputCharacter_OnSearcheInventoryBox);
        EventBus.Unsubscribe<InventoryObjectUIToggleEvent>(InputCharacter_OnOppenInventory);  
    }

    public override void UpdatState()
    { 
    } 
          

    public event Action<bool> OnSearcheInventoryBox;   
    public event Action<bool> OnActiveInventory;
    public event Action OnExitInventory;

    public bool isActive { get; private set; }
    public bool isRayHitToInventoryBox { get; private set; }
    public void SetActiveInventory(bool isActive)
    {
        this.isActive = isActive;
    }
    public void SetStateHitToInventory(bool isHit)
    {
        isRayHitToInventoryBox = isHit;
    }
    public void InputCharacter_OnExitInventory(InventoryExitEvent exitEvent)
    {
        isActive = false;
        OnExitInventory?.Invoke();
    }
    public void InputCharacter_OnSearcheInventoryBox(InventoryBoxObjectUIToggleEvent activeEvent)
    {
        if (isRayHitToInventoryBox)
        {
            isActive = !isActive;
            activeEvent.IsActive = isActive;
            OnSearcheInventoryBox?.Invoke(activeEvent.IsActive);
        }
    }
    public void InputCharacter_OnOppenInventory(InventoryObjectUIToggleEvent oppenEvent)
    {
        isActive = !isActive;
        oppenEvent.IsActive = isActive;
        OnActiveInventory?.Invoke(isActive);
    }
   
}
