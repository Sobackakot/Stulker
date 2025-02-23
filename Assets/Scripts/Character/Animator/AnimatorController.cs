
using StateGame;
using System; 
using Zenject;

public class AnimatorController  
{ 
    public AnimatorController(CharacterAnimator characterAnimator,
        StateGameHandler handlerState, CharacterIK characterIK)
    {
        this.characterAnimator = characterAnimator; 
        this.handlerState = handlerState;
        this.characterIK = characterIK; 
    }
    private StateGameHandler handlerState;
    private CharacterAnimator characterAnimator; 
    private CharacterIK characterIK;
     
    public void Tick_()
    { 
        characterAnimator.SwitchAnimationTurn(handlerState.stateCamera.currentAngleCamera, handlerState.stateCamera.isStopingRotate);
        characterAnimator.TurnAnimation(handlerState.stateCamera.inputAxisCamera, handlerState.stateCamera.isStopingRotate, handlerState.stateCamera.isMaxAngleCamera);
        characterAnimator.MovAnimation(handlerState.stateMove.inputAxisMove, handlerState.stateMove.isMove);
        characterAnimator.SwithAnimationMove(handlerState.stateMove.isSprint, handlerState.stateMove.isWalck, handlerState.stateWeapon.isAim, handlerState.stateMove.inputAxisMove);
        characterAnimator.AimingAnimation(handlerState.stateWeapon.isAim); 
        characterAnimator.RunningDiagonal(handlerState.stateMove.isRunDiagonal);
        characterAnimator.StoppingRunning(handlerState.stateMove.isIdle, handlerState.stateMove.isSprint);   
        characterAnimator.StartingRunning(handlerState.stateMove.isIdle, handlerState.stateMove.isSprint);   
    }  
    public void LateTick_()
    {
       
    }
    public void FixedTick_()
    {   
        characterIK.BodyLoockTargetIK(handlerState.stateMove.isIdle, handlerState.stateWeapon.isAim);
        characterIK.WeaponParentIK(handlerState.stateWeapon.isReadyForBattle, handlerState.stateWeapon.isEquippingWeapon);
        characterIK.AimWeaponParentIK(handlerState.stateWeapon.isAim, handlerState.stateWeapon.isReloadWeapon);
        characterIK.EquipWeaponParentIK(handlerState.stateWeapon.isReadyForBattle, handlerState.stateWeapon.isAvailableWeapons);
    }

}
