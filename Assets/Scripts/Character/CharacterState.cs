
using System;
using UnityEngine;
using Zenject;

public class CharacterState  
{ 
    public bool isJumping { get; private set; }
    public bool isRunningSprint { get; private set; }
    public bool isWalking { get; private set; }
    public bool isCollision { get; private set; }
    public bool isAiming { get; private set; } 
    public bool isMoving { get; private set; } 
    public bool isRotate { get; private set; }
    public bool isShooting { get; private set; }
    public Vector3 inputAxis { get; private set; }
      
    public void UpdateStateMove(bool isMoving)
    {
        this.isMoving = isMoving;
    }
    public void InputCharacter_OnKeyDownJump(bool isKeyDown)
    {
        isJumping = isKeyDown; 
    }
    public void InputCharacter_OnKeyRun(bool isKeyRun)
    {
        isRunningSprint = isKeyRun;
    }

    public void InputCharacter_OnKeyWalk(bool isKeyWalk)
    {
        isWalking = isKeyWalk;
    }
    public void InputCharacter_OnRightMouseButton(bool isPressed)
    {
        if(isShooting) 
            isAiming = isPressed;
    }
    public void InputCharacter_OnActiveShooting(bool isShooting)
    {
        this.isShooting = isShooting;
    }

    public void SetInputAxisMove(Vector2 axis)
    {
        inputAxis = new Vector3(axis.x, 0, axis.y);
    }
    public void SetCollision(bool isCollision)
    {
        this.isCollision = isCollision; 
    } 
    public void SetRotateState(bool isRotate)
    {
        this.isRotate = isRotate;
    }
}
