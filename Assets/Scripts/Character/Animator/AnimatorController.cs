
using System;
using Zenject;

public class AnimatorController :ILateTickable, IInitializable, IDisposable
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
    public void Initialize()
    {
        inputCharacter.OnJumpInput += characterAnimator.InputCharacter_OnJump;
        inputCharacter.OnReadyForBattleToggle += characterAnimator.InputCharacter_OnReadyForButtle;
        inputCharacter.OnCrouchToggle += characterAnimator.InputCharacter_OnCrouch;
    }

    public void Dispose()
    {
        inputCharacter.OnJumpInput -= characterAnimator.InputCharacter_OnJump;
        inputCharacter.OnReadyForBattleToggle -= characterAnimator.InputCharacter_OnReadyForButtle;
        inputCharacter.OnCrouchToggle -= characterAnimator.InputCharacter_OnCrouch;
    } 

    public void LateTick()
    {
        bool isLimitAngle = camera.CheckCameraRotateAngle(state.isAim);
        characterAnimator.SwitchAnimationTurn(camera.currentAngle, camera.isRotateCamera);
        characterAnimator.TurnAnimation(camera.inputAxisMouse, camera.isRotateCamera, isLimitAngle);
         
        characterAnimator.MovAnimation(state.inputAxis, state.isMov);
        characterAnimator.SwithAnimationMove(state.isRun, state.isWalk, state.isAim,state.inputAxis);
        characterAnimator.InputCharacter_OnAim(state.isAim);
         

        characterIK.SetWeightIKShooter(state.isReadyForButtle);
        characterIK.SetWeightIKAiming(state.isAim);
        characterIK.SetWeightIKTiltRight(state.isLeanRight); 
        characterIK.SetWeightIKTiltLeft(state.isLeanLeft); 
    } 
}
