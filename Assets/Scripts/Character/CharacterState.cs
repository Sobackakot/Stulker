
using System;
using Unity.VisualScripting;
using UnityEngine; 

public class CharacterState  
{
    public bool isRun { get; private set; }
    public bool isWalk { get; private set; }
    public bool isCollision { get; private set; }
    public bool isAim { get; private set; } 
    public bool isFire { get; private set; } 
    public bool isMov { get; private set; }  
    public bool isReadyForButtle { get; private set; }
    public bool isLeanRight { get; private set; }
    public bool isLeanLeft { get; private set; }
    public bool isCrouch { get; private set; } 
    public bool isLeftTargerPoint {  get; private set; }  
    public bool isWeaponEquip { get; private set; }
    public bool isReloadWeapon { get; private set; }
    public Vector3 inputAxisMove { get; private set; }

    public Vector3 inputAxisCamera { get; private set; }
    public float currentAngleCamera { get; private set; }
    public bool isFerstCamera { get; private set; }
    public bool isStopingRotate { get; private set; }
    public bool isRotateCamera { get; private set; }
    public bool isMaxAngleCamera { get; private set; }
      
    public void SetInputAxisCamera(Vector2 inputAxis)
    {
        inputAxisCamera = new Vector3(inputAxis.x, 0, inputAxis.y); 
        if(inputAxisCamera.sqrMagnitude > 0.2f )
        { 
            isRotateCamera = true;
        }
         else isRotateCamera = false;
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



    public void InputCharacter_OnEquipWeapon()
    {
        if(!isAim)
            isWeaponEquip = !isWeaponEquip;
    }
    public void UpdateStateMove(bool isMoving)
    {
        this.isMov = isMoving;
    }
    public void InputCharacter_OnRun(bool isKeyRun)
    {
        isRun = isKeyRun;
    }

    public void InputCharacter_OnWalk(bool isKeyWalk)
    {
        isWalk = isKeyWalk;
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
    public void InputCharacter_OnAim(bool isPressed)
    {
        if (isReadyForButtle)
            isAim = isPressed;
    }
    public void InputCharacter_OnFire(bool isPressed)
    {
        if (isReadyForButtle)
            isFire = isPressed;
    }
    public void InputCharacter_OnReadyForBattle()
    {
        if (!isAim)
            isReadyForButtle = !isReadyForButtle;  
    }

    public void InputCharacter_OnCrouch()
    {
        isCrouch = !isCrouch; 
    }
    public void SetReloadWeaponAnimationState(bool isReload)
    {
        isReloadWeapon = isReload;
    }

    public void SetInputAxisMove(Vector2 axis)
    {
        inputAxisMove = new Vector3(axis.x, 0, axis.y);
    }
    public void SetCollision(bool isCollision)
    {
        this.isCollision = isCollision; 
    }  
}
