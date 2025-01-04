
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
        state.OnReadyForBattleAnim += characterAnimator.CharacterState_OnReadyForBattle;
        state.OnCrouchAnim += characterAnimator.CharacterState_OnCrouch;
        //state.OnReloadWeapon += characterAnimator.CharacterState_OnRecharde;
        state.OnPickUpItemAnim += characterAnimator.CharacterState_OnPickUpItem;
        state.OnEquipWeaponAnim += characterAnimator.CharacterState_WeaponEquip;
    }

    public void Dispose()
    {
        state.OnJumping -= characterAnimator.CharacterState_OnJump;
        state.OnReadyForBattleAnim -= characterAnimator.CharacterState_OnReadyForBattle;
        state.OnCrouchAnim -= characterAnimator.CharacterState_OnCrouch;
        //state.OnReloadWeapon -= characterAnimator.CharacterState_OnRecharde;
        state.OnPickUpItemAnim -= characterAnimator.CharacterState_OnPickUpItem;
        state.OnEquipWeaponAnim -= characterAnimator.CharacterState_WeaponEquip;
    } 

    public void Tick_()
    { 
        characterAnimator.SwitchAnimationTurn(state.currentAngleCamera, state.isStopingRotate);
        characterAnimator.TurnAnimation(state.inputAxisCamera, state.isStopingRotate, state.isMaxAngleCamera);
         
        characterAnimator.MovAnimation(state.inputAxisMove, state.isMove);
        characterAnimator.SwithAnimationMove(state.isSprint, state.isWalk, state.isAim,state.inputAxisMove);
        characterAnimator.AimingAnimation(state.isAim); 
        characterAnimator.RunningDiagonal(state.isRunDiagonal);
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
