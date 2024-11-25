
using System;
using Zenject;

public class AnimatorController : ILateTickable
{
    public AnimatorController(CharacterAnimator characterAnimator, CameraCharacter camera, CharacterState state)
    {
        this.characterAnimator = characterAnimator;
        this.camera = camera;
        this.state = state;
    }
    private CharacterState state;
    private CharacterAnimator characterAnimator;
    private CameraCharacter camera;

     
    public void LateTick()
    {
        bool isLimitAngle = camera.CheckCameraRotateAngle(state.isAiming);
        characterAnimator.SwitchAnimationTurn(camera.currentAngle, camera.isRotateCamera);
        characterAnimator.TurnAnimation(camera.inputAxisMouse, camera.isRotateCamera, isLimitAngle);
        if (state.isCollision)
            characterAnimator.JumpAnimation(state.isJumping);
        characterAnimator.MovAnimation(state.inputAxis);
        characterAnimator.SwithAnimationMove(state.isRunningSprint, state.isWalking,state.isAiming, state.inputAxis);
        characterAnimator.AimingMove(state.isAiming); 
        characterAnimator.ActiveShooting(state.isShooting);
    } 
}
