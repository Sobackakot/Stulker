
using System;
using Zenject;

public class AnimatorController :IFixedTickable, ILateTickable
{
    public AnimatorController(CharacterAnimator characterAnimator, CameraCharacter camera, CharacterState state, CharacterIK characterIK)
    {
        this.characterAnimator = characterAnimator;
        this.camera = camera;
        this.state = state;
        this.characterIK = characterIK;
    }
    private CharacterState state;
    private CharacterAnimator characterAnimator;
    private CameraCharacter camera;
    private CharacterIK characterIK;

    public void FixedTick()
    {
       
    }

    public void LateTick()
    {
        bool isLimitAngle = camera.CheckCameraRotateAngle(state.isAiming);
        characterAnimator.SwitchAnimationTurn(camera.currentAngle, camera.isRotateCamera);
        characterAnimator.TurnAnimation(camera.inputAxisMouse, camera.isRotateCamera, isLimitAngle);
        if (state.isCollision)
            characterAnimator.JumpAnimation(state.isJumping);
        characterAnimator.MovAnimation(state.inputAxis, state.isMoving);
        characterAnimator.SwithAnimationMove(state.isRunningSprint, state.isWalking, state.isAiming, state.inputAxis);
        characterAnimator.AimingMove(state.isAiming);
        characterAnimator.ActiveShooting(state.isShooting);
        
        characterIK.SetWeightIKShooter(state.isShooting);
        characterIK.SetWeightIKAiming(state.isAiming);
    }
}
