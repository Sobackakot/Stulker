
using System;
using Zenject;

public class AnimatorController :ITickable, IInitializable, IDisposable, ILateTickable
{
    public AnimatorController(CharacterAnimator characterAnimator, CameraCharacter camera, 
        CharacterState state, CharacterIK characterIK, InputCharacter inputCharacter)
    {
        this.characterAnimator = characterAnimator;
        this.camera = camera;
        this.state = state;
        this.characterIK = characterIK;
        this.inputCharacter = inputCharacter;
    }
    private CharacterState state;
    private InputCharacter inputCharacter;
    private CharacterAnimator characterAnimator;
    private CameraCharacter camera;
    private CharacterIK characterIK;

    private bool isLimitAngle;
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
        characterAnimator.SwitchAnimationTurn(camera.currentAngle, camera.isRotateCamera);
        characterAnimator.TurnAnimation(camera.inputAxisMouse, camera.isRotateCamera, isLimitAngle);
         
        characterAnimator.MovAnimation(state.inputAxis, state.isMov);
        characterAnimator.SwithAnimationMove(state.isRun, state.isWalk, state.isAim,state.inputAxis);
        characterAnimator.InputCharacter_OnAim(state.isAim);
         

        characterIK.SetWeightIKReadyForBattle(state.isReadyForButtle, state.isReloadWeapon);
        characterIK.SetWeightIKAiming(state.isAim);
        characterIK.SetWeightIKLeanRight(state.isLeanRight, state.isAim); 
        characterIK.SetWeightIKLeanLeft(state.isLeanLeft, state.isAim); 
    }

    public void LateTick()
    {
        isLimitAngle = camera.CheckCameraRotateAngle(state.isAim);
    }
}
