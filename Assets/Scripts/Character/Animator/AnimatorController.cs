
using System;
using Zenject;

public class AnimatorController : ITickable, IInitializable, IDisposable, ILateTickable
{
    public AnimatorController(CharacterAnimator characterAnimator, 
        CharacterState state, CharacterIK characterIK, InputCharacter inputCharacter)
    {
        this.characterAnimator = characterAnimator; 
        this.state = state;
        this.characterIK = characterIK;
        this.inputCharacter = inputCharacter;
    }
    private CharacterState state;
    private InputCharacter inputCharacter;
    private CharacterAnimator characterAnimator; 
    private CharacterIK characterIK;

    public void Initialize()
    {
        inputCharacter.OnJumpInput += characterAnimator.InputCharacter_OnJump;
        inputCharacter.OnReadyForBattleToggle += characterAnimator.InputCharacter_OnReadyForButtle;
        inputCharacter.OnCrouchToggle += characterAnimator.InputCharacter_OnCrouch;
        inputCharacter.OnReloadWeaponInput += characterAnimator.InputCharacter_OnRecharde;
    }

    public void Dispose()
    {
        inputCharacter.OnJumpInput -= characterAnimator.InputCharacter_OnJump;
        inputCharacter.OnReadyForBattleToggle -= characterAnimator.InputCharacter_OnReadyForButtle;
        inputCharacter.OnCrouchToggle -= characterAnimator.InputCharacter_OnCrouch;
        inputCharacter.OnReloadWeaponInput -= characterAnimator.InputCharacter_OnRecharde;
    } 

    public void Tick()
    { 
        characterAnimator.SwitchAnimationTurn(state.currentAngleCamera, state.isStopingRotate);
        characterAnimator.TurnAnimation(state.inputAxisCamera, state.isStopingRotate, state.isMaxAngleCamera);
         
        characterAnimator.MovAnimation(state.inputAxisMove, state.isMov);
        characterAnimator.SwithAnimationMove(state.isRun, state.isWalk, state.isAim,state.inputAxisMove);
        characterAnimator.InputCharacter_OnAim(state.isAim);
        

    }  
    public void LateTick()
    {
        characterIK.SetWeightIKReadyForBattle(state.isReadyForButtle, state.isReloadWeapon);
        characterIK.SetWeightIKAiming(state.isAim);
    }
}
