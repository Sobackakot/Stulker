
using System;
using UnityEngine;

public class CharacterState 
{
    //raycast 
    // inventory
    // character anim
    // character move
    // camera
    //weapon
    public CharacterState()
    {
        EventBus.Subscribe<CameraSwitchEvent>(InputCamera_OnSwitchCamera);
        EventBus.Subscribe<InventoryExitEvent>(InputCharacter_OnExitInventory);
        EventBus.Subscribe<InventoryBoxObjectUIToggleEvent>(InputCharacter_OnSearcheInventoryBox);
        EventBus.Subscribe<InventoryObjectUIToggleEvent>(InputCharacter_OnOppenInventory);
        EventBus.Subscribe<PickUpItemEvent>(InputCharacter_OnPickUpItem);

        EventBus.Subscribe<MoveInputEvent>(InputCharacter_OnMove);
        EventBus.Subscribe<JumpInputEvent>(InputCharacter_OnJamp);
        EventBus.Subscribe<RunInputEvent>(InputCharacter_OnRun);
        EventBus.Subscribe<WalkInputEvent>(InputCharacter_OnWalk);
        EventBus.Subscribe<CrouchToggleEvent>(InputCharacter_OnCrouch);
        EventBus.Subscribe<LeanRightInputEvent>(InputCharacter_OnLeanRight);
        EventBus.Subscribe<LeanLeftInputEvent>(InputCharacter_OnLeanLeft);

        EventBus.Subscribe<ReloadWeaponEvent>(InputCharacter_OnReloadWeapon);
        EventBus.Subscribe<AimInputEvent>(InputCharacter_OnAim);
        EventBus.Subscribe<FireInputEvent>(InputCharacter_OnFire);
        EventBus.Subscribe<EquipWeaponToggleEvent>(InputCharacter_OnEquipWeapon);
    }
    ~CharacterState()
    {
        EventBus.Unsubscribe<CameraSwitchEvent>(InputCamera_OnSwitchCamera);
        EventBus.Unsubscribe<InventoryExitEvent>(InputCharacter_OnExitInventory);
        EventBus.Unsubscribe<InventoryBoxObjectUIToggleEvent>(InputCharacter_OnSearcheInventoryBox);
        EventBus.Unsubscribe<InventoryObjectUIToggleEvent>(InputCharacter_OnOppenInventory);
        EventBus.Unsubscribe<PickUpItemEvent>(InputCharacter_OnPickUpItem);

        EventBus.Unsubscribe<MoveInputEvent>(InputCharacter_OnMove);
        EventBus.Unsubscribe<JumpInputEvent>(InputCharacter_OnJamp);
        EventBus.Unsubscribe<RunInputEvent>(InputCharacter_OnRun);
        EventBus.Unsubscribe<WalkInputEvent>(InputCharacter_OnWalk);
        EventBus.Unsubscribe<CrouchToggleEvent>(InputCharacter_OnCrouch);
        EventBus.Unsubscribe<LeanRightInputEvent>(InputCharacter_OnLeanRight);
        EventBus.Unsubscribe<LeanLeftInputEvent>(InputCharacter_OnLeanLeft);

        EventBus.Unsubscribe<ReloadWeaponEvent>(InputCharacter_OnReloadWeapon);
        EventBus.Unsubscribe<AimInputEvent>(InputCharacter_OnAim);
        EventBus.Unsubscribe<FireInputEvent>(InputCharacter_OnFire);
        EventBus.Unsubscribe<EquipWeaponToggleEvent>(InputCharacter_OnEquipWeapon);
    }
    public event Action OnJumping;
    public event Action OnParcoure;
    public event Action<Vector2> OnMoving;
    public event Action OnReadyForBattleAnim;
    public event Action OnCrouchAnim;
    public event Action OnReloadWeapon;
    public event Action<bool> OnEquipWeaponAnim;

    public event Action<bool> OnSearcheInventoryBox;
    public event Func<bool> OnGetItemFromHitRay;
    public event Action OnPickUpItemAnim;

    public event Action<bool> OnActiveInventory;
    public event Action OnExitInventory;
   
    public bool isIdle { get; private set; }
    public bool isSprint { get; private set; }
    public bool isRun { get; private set; }
    public bool isWalck { get; private set; } 
    public bool isParcour {  get; private set; }
    public bool isRunDiagonal { get; private set; }
    public bool isCollision { get; private set; }
    public bool isAim { get; private set; } 
    public bool isFire { get; private set; } 
    public bool isMove { get; private set; }  
    public bool isReadyForBattle { get; private set; }
    public bool isLeanRight { get; private set; }
    public bool isLeanLeft { get; private set; }
    public bool isCrouch { get; private set; } 
    public bool isLeftTargerPoint {  get; private set; }   
    public bool isEquippingWeapon { get; private set; }
    public bool isAvailableWeapons { get; private set; }
    public bool isReloadWeapon { get; private set; }
    public Vector3 inputAxisMove { get; private set; } 
    public bool isRayHitToItem { get; private set; } 
    public bool isRayHitToInventoryBox { get; private set; }
    public bool isRayHitToObstacle { get; private set; }
     


    public Vector3 inputAxisCamera { get; private set; }
    public float currentAngleCamera { get; private set; }
    public bool isFerstCamera { get; set; }
    public bool isStopingRotate { get; private set; } 
    public bool isMaxAngleCamera { get; private set; }

    public bool isActiveInventory {  get; private set; }

     
    public void SetActiveInventory(bool isActive)
    {
        isActiveInventory = isActive;
    }
    public void SetInputAxisCamera(Vector2 inputAxis)
    { 
        inputAxisCamera = new Vector3(inputAxis.x, 0, inputAxis.y);  
    }
    public void SetAngleForCamera(float angle)
    {
        currentAngleCamera = angle;
    }
    public void SetStateCameraAngle(bool isAngleMax)
    {
        isMaxAngleCamera = isAngleMax;
    }
    public void SetStateRotateCamera(bool isRotate)
    {
        isStopingRotate = isRotate;
    }
    public void InputCamera_OnSwitchCamera(CameraSwitchEvent a)
    {
        isFerstCamera = !isFerstCamera;
        a.IsFirstPerson = isFerstCamera;
    }



    public void SetStateHitToInventory(bool isHit)
    { 
        isRayHitToInventoryBox = isHit;
    }
    public void SetStateHitToItem(bool isHit)
    {
        isRayHitToItem = isHit;
    }
    public void SetStateHitToObstacle(bool isHit)
    {
        isRayHitToObstacle = isHit;
    }
    public void SetStateParcour(bool isParcour)
    {
        this.isParcour = isParcour;
    }

    public void SetStateMove(bool isMoving)
    {
        this.isMove = isMoving;
        if(!isSprint | !isWalck && inputAxisMove.sqrMagnitude > 0.2f)
        {
            isRun = true;
            isIdle = false;
        }  
        else
        {
            isIdle = true;
            isRun = false;
        }
    } 
    public void InputCharacter_OnMove(MoveInputEvent moveEvent)
    {
         inputAxisMove = new Vector3(moveEvent.Point.x, 0, moveEvent.Point.y); 
        OnMoving?.Invoke(moveEvent.Point); 
    }
    public void InputCharacter_OnRun(RunInputEvent sprintEvent)
    { 
        if (inputAxisMove.sqrMagnitude > 0.2f && sprintEvent.IsRunning)
        {
            isSprint = true;
            isIdle = false;
            isWalck= false;
            isRun = false;
        } else isSprint = false;
    }
    public void UpdateIsDiagonalRunning()
    {
        bool isDiagonalMovement = Mathf.Abs(inputAxisMove.x) > 0.2f && Mathf.Abs(inputAxisMove.z) > 0.2f;
        isRunDiagonal = isSprint && isDiagonalMovement; 
    }
    public void InputCharacter_OnWalk(WalkInputEvent walckEvent)
    {
        if (inputAxisMove.sqrMagnitude > 0.2f && walckEvent.IsWalking)
        {
            isWalck = true;
            isIdle = false;
            isRun = false;
            isSprint = false;
        } else isWalck = false;
    }
   
    public void InputCharacter_OnJamp(JumpInputEvent jumpEvent)
    { 
       if (isCollision && !isAim)
       {
            if (!isRayHitToObstacle)
                OnJumping?.Invoke();
            OnParcoure?.Invoke(); 
       }
    }
     

    public void InputCharacter_OnLeanRight(LeanRightInputEvent leanEvent)
    {
        isLeanRight = leanEvent.IsLeaningRight;
        isLeftTargerPoint = false; 
    }
    public void InputCharacter_OnLeanLeft(LeanLeftInputEvent leanEvent)
    {
        isLeanLeft = leanEvent.IsLeaningLeft;
        isLeftTargerPoint = true; 
    }
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
        if(!isAim && isReadyForBattle && !isReloadWeapon && !isSprint)
        {
            OnReloadWeapon?.Invoke();
        } 
    } 
    public void InputCharacter_OnCrouch(CrouchToggleEvent crouchEvent)
    { 
        isCrouch = !isCrouch;
        crouchEvent.IsCrouching = isCrouch; 
        OnCrouchAnim?.Invoke();
    }
    public void InputCharacter_OnPickUpItem(PickUpItemEvent pickEvent)
    { 
        if (isRayHitToItem && !isReloadWeapon)
        { 
            OnPickUpItemAnim?.Invoke(); 
            if (OnGetItemFromHitRay != null && OnGetItemFromHitRay.Invoke())
            { 
                isAvailableWeapons = true;
            }    
        }
    }
    public void InputCharacter_OnExitInventory(InventoryExitEvent exitEvent)
    {
        isActiveInventory = false;
        OnExitInventory?.Invoke();
    }
    public void InputCharacter_OnSearcheInventoryBox(InventoryBoxObjectUIToggleEvent activeEvent)
    {
        if (isRayHitToInventoryBox)
        { 
            isActiveInventory = !isActiveInventory;
            activeEvent.IsActive = isActiveInventory;
            OnSearcheInventoryBox?.Invoke(activeEvent.IsActive);
        }
    }
    public void InputCharacter_OnOppenInventory(InventoryObjectUIToggleEvent oppenEvent)
    {
        isActiveInventory = !isActiveInventory;
        oppenEvent.IsActive = isActiveInventory;
        OnActiveInventory?.Invoke(isActiveInventory);
    }

    public void SetReloadWeaponAnimationState(bool isReload)
    { 
        isReloadWeapon = isReload; 
    }
    public void SetEquipWeaponAnimationState(bool isEquiping)
    {
        isEquippingWeapon = isEquiping;
    }
     
    public void SetCollision(bool isCollision)
    {
        this.isCollision = isCollision; 
    }  
}
