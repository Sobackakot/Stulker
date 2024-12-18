 
using UnityEngine;

public interface ICameraCharacter  
{
    void RotateCamera();
    void ZoomCamera(bool isAiming);
    void InputCamera_OnInputAxis(Vector2 inputAxis);
    void InputCamera_OnScrollMouse(Vector2 scrollMouse);
    void CheckCameraRotateAngle();
    void SwitchLookPointCamera(bool isLeftPointLook, bool isCrouching);
    void SetTargetPointAim(bool isAim);

}
