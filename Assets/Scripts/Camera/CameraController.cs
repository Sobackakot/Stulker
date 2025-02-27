 
using Zenject; 
using Inventory_;
using System.Collections.Generic;
using StateGame;

public class CameraController 
{ 
    public CameraController(StateGameHandler state, RaycastCamera ray, 
    [Inject(Id = "cameraTird")] ICameraCharacter cameraTird, [Inject(Id = "cameraFerst")] ICameraCharacter cameraFerst)
    { 
        this.ray = ray;
        this.state = state; 

        cameras = new Dictionary<bool, ICameraCharacter>
        {
            { true, cameraFerst },
            { false, cameraTird }
        };
        activeCamera = cameras[this.state.Camera.isFerst];

    }

    private StateGameHandler state;
    private RaycastCamera ray;  

    private ICameraCharacter activeCamera;
    private readonly Dictionary<bool, ICameraCharacter> cameras; 


    private void SwitchCamera()
    {
        activeCamera = cameras[state.Camera.isFerst];
    }
    public void Tick_Camera()
    {
        SwitchCamera();
        activeCamera.SwitchLookPointCamera(state.Move.isLeftTargerPoint, state.Move.isCrouch);
        state.Camera.SetStateRotateCamera(state.Invent.isActiveInvent);
        activeCamera.CheckCameraRotateAngle();
    }
    public void LateTick_Camera()
    {
        activeCamera.FollowCamera();     
        if (state.Camera.isStopingRotate)  
             activeCamera.RotateCamera(state.Weapon.isAim);
        activeCamera.ZoomCamera(state.Weapon.isAim, state.Weapon.isReload); 
    }
      
    public void FixedTick_Camera()
    { 
        ray.RayHitTakeItemInteract(); 
        if (state.Weapon.isAim)
        {
            ray.GetPointRayAim(); 
            ray.Shooting(state.Weapon.isFire); 
        } 
    }
}
