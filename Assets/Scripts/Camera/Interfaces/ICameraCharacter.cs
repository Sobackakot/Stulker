 
using UnityEngine;

public interface ICameraCharacter  
{
    void RotateCamera(bool isAim);
    void FollowCamera();
    void ZoomCamera(bool isAiming, bool isReload);
    void InputCamera_OnInputAxis(CameraInputEvent inputEvent);
    void InputCamera_OnScrollMouse(Vector2 scrollMouse);
    void CheckCameraRotateAngle(CharacterState state);
    void SwitchLookPointCamera(bool isLeftPointLook, bool isCrouching); 

}
