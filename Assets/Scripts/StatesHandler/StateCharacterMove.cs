 
using StateGame;
using UnityEngine;
using System;
using System.Security.Claims;


public class StateCharacterMove : StateGameBase
{
    public StateCharacterMove(StateGameHandler stateGameHandler) : base(stateGameHandler)
    {
    }

    public override void EnterState()
    {
        EventBus.Subscribe<MoveInputEvent>(InputCharacter_OnMove);
        EventBus.Subscribe<JumpInputEvent>(InputCharacter_OnJamp);
        EventBus.Subscribe<RunInputEvent>(InputCharacter_OnRun);
        EventBus.Subscribe<WalkInputEvent>(InputCharacter_OnWalk);
        EventBus.Subscribe<CrouchToggleEvent>(InputCharacter_OnCrouch);
        EventBus.Subscribe<LeanRightInputEvent>(InputCharacter_OnLeanRight);
        EventBus.Subscribe<LeanLeftInputEvent>(InputCharacter_OnLeanLeft);
    }

    public override void ExitState()
    {
        EventBus.Unsubscribe<MoveInputEvent>(InputCharacter_OnMove);
        EventBus.Unsubscribe<JumpInputEvent>(InputCharacter_OnJamp);
        EventBus.Unsubscribe<RunInputEvent>(InputCharacter_OnRun);
        EventBus.Unsubscribe<WalkInputEvent>(InputCharacter_OnWalk);
        EventBus.Unsubscribe<CrouchToggleEvent>(InputCharacter_OnCrouch);
        EventBus.Unsubscribe<LeanRightInputEvent>(InputCharacter_OnLeanRight);
        EventBus.Unsubscribe<LeanLeftInputEvent>(InputCharacter_OnLeanLeft);
    }

    public override void UpdatState()
    { 
    } 
    public event Action OnJumping;
    public event Action OnParcoure;
    public event Action<Vector2> OnMoving;
    public event Action OnCrouchAnim;


    public bool isIdle { get; private set; }
    public bool isSprint { get; private set; }
    public bool isRun { get; private set; }
    public bool isWalck { get; private set; }
    public bool isParcour { get; private set; }
    public bool isRunDiagonal { get; private set; }
    public bool isCollision { get; private set; }
    public bool isMove { get; private set; }
    public bool isLeanRight { get; private set; }
    public bool isLeanLeft { get; private set; }
    public bool isCrouch { get; private set; }
    public bool isLeftTargerPoint { get; private set; }
    public Vector3 inputAxisMove { get; private set; }

    
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
            isWalck = false;
            isRun = false;
        }
        else isSprint = false;
    }
    public void InputCharacter_OnWalk(WalkInputEvent walckEvent)
    {
        if (inputAxisMove.sqrMagnitude > 0.2f && walckEvent.IsWalking)
        {
            isWalck = true;
            isIdle = false;
            isRun = false;
            isSprint = false;
        }
        else isWalck = false;
    }
    public void InputCharacter_OnJamp(JumpInputEvent jumpEvent)
    {
        if (isCollision && !stateGameHandler.stateWeapon.isAim)
        {
            if (!stateGameHandler.stateRaycast.isRayHitToObstacle)
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
    public void InputCharacter_OnCrouch(CrouchToggleEvent crouchEvent)
    {
        isCrouch = !isCrouch;
        crouchEvent.IsCrouching = isCrouch;
        OnCrouchAnim?.Invoke();
    }
    public void UpdateIsDiagonalRunning()
    {
        bool isDiagonalMovement = Mathf.Abs(inputAxisMove.x) > 0.2f && Mathf.Abs(inputAxisMove.z) > 0.2f;
        isRunDiagonal = isSprint && isDiagonalMovement;
    }
     
    public void SetCollision(bool isCollision)
    {
        this.isCollision = isCollision;
    }
    public void SetStateParcour(bool isParcour)
    {
        this.isParcour = isParcour;
    }
    public void SetStateMove(bool isMoving)
    {
        this.isMove = isMoving;
        if (!isSprint | !isWalck && inputAxisMove.sqrMagnitude > 0.2f)
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
}
