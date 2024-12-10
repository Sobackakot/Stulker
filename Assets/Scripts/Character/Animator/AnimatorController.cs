
using System;
using Zenject;

public class AnimatorController :IFixedTickable, ILateTickable
{
    public AnimatorController(CharacterAnimator characterAnimator, CameraCharacter camera, 
        CharacterState state, CharacterIK characterIK)
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
        bool isLimitAngle = camera.CheckCameraRotateAngle(state.isKeyDownMouseRight);
        characterAnimator.SwitchAnimationTurn(camera.currentAngle, camera.isRotateCamera);
        characterAnimator.TurnAnimation(camera.inputAxisMouse, camera.isRotateCamera, isLimitAngle);
        if (state.isCollision)
            characterAnimator.JumpAnimation(state.isJumping);
        characterAnimator.MovAnimation(state.inputAxis, state.isMoving);
        characterAnimator.SwithAnimationMove(state.isRunningSprint, state.isWalking, state.isKeyDownMouseRight,state.inputAxis);
        characterAnimator.AimingMove(state.isKeyDownMouseRight);
        characterAnimator.ActiveShooting(state.isActiveShooting);
        characterAnimator.CrouchingMove(state.isCrouching);
        characterAnimator.CrouchingMoveReady(state.isCrouchingReady);
        characterAnimator.WeaponEquip(state.isActiveShooting, state.isEquipGun);

        characterIK.SetWeightIKShooter(state.isActiveShooting);
        characterIK.SetWeightIKAiming(state.isKeyDownMouseRight);
        characterIK.SetWeightIKTiltRight(state.isTiltRight); 
        characterIK.SetWeightIKTiltLeft(state.isTiltLeft); 
    }
}
