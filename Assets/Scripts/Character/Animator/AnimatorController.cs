
using System;
using Zenject;

public class AnimatorController :IInitializable, IDisposable
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

    public void Initialize()
    {
        state.OnJumping += characterAnimator.CharacterState_OnJump;
        state.OnReadyForBattle += characterAnimator.CharacterState_OnReadyForBattle;
        state.OnCrouch += characterAnimator.CharacterState_OnCrouch;
        state.OnReloadWeapon += characterAnimator.CharacterState_OnRecharde;
        state.OnPickUpItem += characterAnimator.CharacterState_OnPickUpItem;
    }

    public void Dispose()
    {
        state.OnJumping -= characterAnimator.CharacterState_OnJump;
        state.OnReadyForBattle -= characterAnimator.CharacterState_OnReadyForBattle;
        state.OnCrouch -= characterAnimator.CharacterState_OnCrouch;
        state.OnReloadWeapon -= characterAnimator.CharacterState_OnRecharde;
        state.OnPickUpItem -= characterAnimator.CharacterState_OnPickUpItem;
    } 

    public void Tick_()
    { 
        characterAnimator.SwitchAnimationTurn(state.currentAngleCamera, state.isStopingRotate);
        characterAnimator.TurnAnimation(state.inputAxisCamera, state.isStopingRotate, state.isMaxAngleCamera);
         
        characterAnimator.MovAnimation(state.inputAxisMove, state.isMove);
        characterAnimator.SwithAnimationMove(state.isRun, state.isWalk, state.isAim,state.inputAxisMove);
        characterAnimator.AimingAnimation(state.isAim); 
    }  
    public void LateTick_()
    {
       
    }
    public void FixedTick_()
    {
        characterIK.SetWeightIKReadyForBattle(state.isReadyForBattle);
        characterIK.SetWeightIKAiming(state.isAim);
    }

}
