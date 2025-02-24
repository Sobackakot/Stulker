
using StateGame;
using System; 
using Zenject;

public class AnimatorController  
{ 
    public AnimatorController(CharacterAnimator characterAnimator,
        StateGameHandler state, CharacterIK characterIK)
    {
        this.characterAnimator = characterAnimator; 
        this.state = state;
        this.characterIK = characterIK; 
    }
    private StateGameHandler state;
    private CharacterAnimator characterAnimator; 
    private CharacterIK characterIK;
     
    public void Tick_()
    { 
        characterAnimator.SwitchAnimationTurn(state.Camera.currentAngle, state.Camera.isStopingRotate);
        characterAnimator.TurnAnimation(state.Camera.inputAxis, state.Camera.isStopingRotate, state.Camera.isMaxAngle);
        characterAnimator.MovAnimation(state.Move.inputAxis, state.Move.isMove);
        characterAnimator.SwithAnimationMove(state.Move.isSprint, state.Move.isWalck, state.Weapon.isAim, state.Move.inputAxis);
        characterAnimator.AimingAnimation(state.Weapon.isAim); 
        characterAnimator.RunningDiagonal(state.Move.isRunDiagonal);
        characterAnimator.StoppingRunning(state.Move.isIdle, state.Move.isSprint);   
        characterAnimator.StartingRunning(state.Move.isIdle, state.Move.isSprint);   
    }  
    public void LateTick_()
    {
       
    }
    public void FixedTick_()
    {   
        characterIK.BodyLoockTargetIK(state.Move.isIdle, state.Weapon.isAim);
        characterIK.WeaponParentIK(state.Weapon.isReadyForBattle, state.Weapon.isEquipping);
        characterIK.AimWeaponParentIK(state.Weapon.isAim, state.Weapon.isReload);
        characterIK.EquipWeaponParentIK(state.Weapon.isReadyForBattle, state.Weapon.isAvailable);
    }

}
