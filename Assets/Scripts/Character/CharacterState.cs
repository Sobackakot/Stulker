
using System; 
using UnityEngine; 

public class CharacterState  
{
    public event Action OnJumping;
    public event Action<Vector2> OnMoving;
    public event Action OnReadyForBattleAnim;
    public event Action OnCrouchAnim;
    public event Action OnReloadWeapon;
    public event Action<bool> OnEquipWeaponAnim;

    public event Action<bool> OnSearcheInventoryBox;
    public event Func<bool> OnPickUpItem;
    public event Action OnPickUpItemAnim;
   
    public bool isIdle { get; private set; }
    public bool isSprint { get; private set; }
    public bool isRun { get; private set; }
    public bool isWalk { get; private set; } 
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

    public Vector3 inputAxisCamera { get; private set; }
    public float currentAngleCamera { get; private set; }
    public bool isFerstCamera { get; private set; }
    public bool isStopingRotate { get; private set; } 
    public bool isMaxAngleCamera { get; private set; }
      
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
    public void StoppingRotateCamera(bool isRotate)
    {
        isStopingRotate = isRotate;
    }
    public void InputCamera_OnSwitchCamera()
    {
        isFerstCamera = !isFerstCamera;
    }



    public void UpdateStateRayHitToInventory(bool isHit)
    { 
        isRayHitToInventoryBox = isHit;
    }
    public void UpdateStateRayHitToItem(bool isHit)
    {
        isRayHitToItem = isHit;
    }

    public void UpdateStateMove(bool isMoving)
    {
        this.isMove = isMoving;
        if(!isSprint | !isWalk && inputAxisMove.sqrMagnitude > 0.2f)
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

    public void InputCharacter_OnMove(Vector2 inputAxis)
    {
        inputAxisMove = new Vector3(inputAxis.x, 0, inputAxis.y); 
        OnMoving.Invoke(inputAxis); 
    }
    public void InputCharacter_OnRun(bool isKeySprint)
    {
        isSprint = isKeySprint;
        isIdle = false;
    }
    public void UpdateIsDiagonalRunning()
    {
        bool isDiagonalMovement = Mathf.Abs(inputAxisMove.x) > 0.2f && Mathf.Abs(inputAxisMove.z) > 0.2f;
        isRunDiagonal = isSprint && isDiagonalMovement; 
    }
    public void InputCharacter_OnWalk(bool isKeyWalk)
    {
        isWalk = isKeyWalk;
    } 
    public void InputCharacter_OnJamp()
    {
        if (isCollision && !isAim)
        {
            OnJumping?.Invoke();
        } 
    }
    
      

    public void InputCharacter_OnLeanRight(bool isTiltRight)
    {
        this.isLeanRight = isTiltRight;
        isLeftTargerPoint = false; 
    }
    public void InputCharacter_OnLeanLeft(bool isTiltLeft)
    {
        this.isLeanLeft = isTiltLeft; 
        isLeftTargerPoint = true; 
    }
    public void InputCharacter_OnEquipWeapon()
    {
        if (!isAim && !isReloadWeapon && isAvailableWeapons)
        {
            isReadyForBattle = !isReadyForBattle;
            OnEquipWeaponAnim?.Invoke(isReadyForBattle);
            OnReadyForBattleAnim?.Invoke();  
        }   
    }
    public void InputCharacter_OnAim(bool isPressed)
    {
        if (isReadyForBattle && !isReloadWeapon && !isEquippingWeapon)
            isAim = isPressed;
    }
    public void InputCharacter_OnFire(bool isPressed)
    {
        if (isReadyForBattle && isAim)
            isFire = isPressed;
    }
    public void InputCharacter_OnReloadWeapon()
    {
        if(!isAim && isReadyForBattle && !isReloadWeapon && !isSprint)
        {
            OnReloadWeapon?.Invoke();
        } 
    } 
    public void InputCharacter_OnCrouch()
    { 
        isCrouch = !isCrouch;
        OnCrouchAnim?.Invoke();
    }
    public void InputCharacter_OnPickUpItem()
    {
        if (isRayHitToItem && !isReloadWeapon)
        {
            OnPickUpItemAnim?.Invoke();    
            if (OnPickUpItem.Invoke())
                isAvailableWeapons = true; 
        }
    }
    public void InputCharacter_OnSearcheInventoryBox(bool isActive)
    {
        if (isRayHitToInventoryBox)
        {
            OnSearcheInventoryBox?.Invoke(isActive);
        }
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
