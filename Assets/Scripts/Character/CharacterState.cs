
using System;
using UnityEngine; 

public class CharacterState  
{ 
    public bool isJumping { get; private set; }
    public bool isRunningSprint { get; private set; }
    public bool isWalking { get; private set; }
    public bool isCollision { get; private set; }
    public bool isKeyDownMouseRight { get; private set; } 
    public bool isKeyDownMouseLeft { get; private set; } 
    public bool isMoving { get; private set; }  
    public bool isActiveShooting { get; private set; }
    public bool isTiltRight { get; private set; }
    public bool isTiltLeft { get; private set; }
    public bool isCrouching { get; private set; } 
    public bool isLeftPointLook {  get; private set; }  
    public bool isEquipGun { get; private set; }
    public Vector3 inputAxis { get; private set; }
      
    public void UpdateStateMove(bool isMoving)
    {
        this.isMoving = isMoving;
    }
    public void InputCharacter_OnKeyDownEquipGun(bool isKeyDownEquip)
    {
        if(!isKeyDownMouseRight)
            isEquipGun = isKeyDownEquip;
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
    public void InputCharacter_OnTiltRightButton(bool isTiltRight)
    {
        this.isTiltRight = isTiltRight;
        isLeftPointLook = false; 
    }
    public void InputCharacter_OnTiltLeftButton(bool isTiltLeft)
    {
        this.isTiltLeft = isTiltLeft; 
        isLeftPointLook = true; 
    }
    public void InputCharacter_OnRightMouseButton(bool isPressed)
    {
        if(isActiveShooting) 
            isKeyDownMouseRight = isPressed;
    }
    public void InputCharacter_OnLeftMouseButton(bool isPressed)
    {
        if (isActiveShooting)
            isKeyDownMouseLeft = isPressed;
    }
    public void InputCharacter_OnActiveShooting()
    {
        if (!isKeyDownMouseRight)
            isActiveShooting = !isActiveShooting;  
    }

    public void InputCharacter_OnActiveCrouching()
    {
        isCrouching = !isCrouching; 
    }

    public void SetInputAxisMove(Vector2 axis)
    {
        inputAxis = new Vector3(axis.x, 0, axis.y);
    }
    public void SetCollision(bool isCollision)
    {
        this.isCollision = isCollision; 
    }  
}
