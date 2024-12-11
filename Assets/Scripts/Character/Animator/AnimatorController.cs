
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
        inputCharacter.onKeyDownJump += characterAnimator.InputCharacter_OnKeyDownJumpAnim;
    }

    public void Dispose()
    {
        inputCharacter.onKeyDownJump -= characterAnimator.InputCharacter_OnKeyDownJumpAnim;
    } 

    public void LateTick()
    {
        bool isLimitAngle = camera.CheckCameraRotateAngle(state.isKeyDownMouseRight);
        characterAnimator.SwitchAnimationTurn(camera.currentAngle, camera.isRotateCamera);
        characterAnimator.TurnAnimation(camera.inputAxisMouse, camera.isRotateCamera, isLimitAngle);
         
        characterAnimator.MovAnimation(state.inputAxis, state.isMoving);
        characterAnimator.SwithAnimationMove(state.isRunningSprint, state.isWalking, state.isKeyDownMouseRight,state.inputAxis);
        characterAnimator.AimingMove(state.isKeyDownMouseRight);
        characterAnimator.ActiveShooting(state.isActiveShooting);
        characterAnimator.CrouchingMove(state.isCrouching); 
        characterAnimator.WeaponEquip(state.isActiveShooting, state.isEquipGun);

        characterIK.SetWeightIKShooter(state.isActiveShooting);
        characterIK.SetWeightIKAiming(state.isKeyDownMouseRight);
        characterIK.SetWeightIKTiltRight(state.isTiltRight); 
        characterIK.SetWeightIKTiltLeft(state.isTiltLeft); 
    } 
}
