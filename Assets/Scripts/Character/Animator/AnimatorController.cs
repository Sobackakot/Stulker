
using System; 
using Zenject;

public class AnimatorController  
{
    public AnimatorController(CharacterAnimator characterAnimator, 
        CharacterState state, CharacterIK characterIK)
    {
        this.characterAnimator = characterAnimator; 
        this.state = state;
        this.characterIK = characterIK; 
    }
    private CharacterState state; 
    private CharacterAnimator characterAnimator; 
    private CharacterIK characterIK;
     
    public void Tick_()
    { 
        characterAnimator.SwitchAnimationTurn(state.currentAngleCamera, state.isStopingRotate);
        characterAnimator.TurnAnimation(state.inputAxisCamera, state.isStopingRotate, state.isMaxAngleCamera);
        characterAnimator.MovAnimation(state.inputAxisMove, state.isMove);
        characterAnimator.SwithAnimationMove(state.isSprint, state.isWalck, state.isAim,state.inputAxisMove);
        characterAnimator.AimingAnimation(state.isAim); 
        characterAnimator.RunningDiagonal(state.isRunDiagonal);
        characterAnimator.StoppingRunning(state.isIdle, state.isSprint);   
        characterAnimator.StartingRunning(state.isIdle, state.isSprint);   
    }  
    public void LateTick_()
    {
       
    }
    public void FixedTick_()
    {   
        characterIK.BodyLoockTargetIK(state.isIdle, state.isAim);
        characterIK.WeaponParentIK(state.isReadyForBattle, state.isEquippingWeapon);
        characterIK.AimWeaponParentIK(state.isAim, state.isReloadWeapon);
        characterIK.EquipWeaponParentIK(state.isReadyForBattle, state.isAvailableWeapons);
    }

}
