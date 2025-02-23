 
using Zenject; 
using Inventory_;
using System.Collections.Generic;
using StateGame;

public class CameraController 
{ 
    public CameraController(StateGameHandler handlerState, RaycastCamera ray, [Inject(Id = "inventoryUI")]IInventoryUI inventoryUI , 
    [Inject(Id = "cameraTird")] ICameraCharacter cameraTird, [Inject(Id = "cameraFerst")] ICameraCharacter cameraFerst)
    { 
        this.ray = ray;
        this.handlerState = handlerState;
        this.inventoryUI = inventoryUI;

        cameras = new Dictionary<bool, ICameraCharacter>
        {
            { true, cameraFerst },
            { false, cameraTird }
        };
        activeCamera = cameras[this.handlerState.stateCamera.isFerstCamera];

    }

    private StateGameHandler handlerState;
    private RaycastCamera ray; 
    private IInventoryUI inventoryUI; 

    private ICameraCharacter activeCamera;
    private readonly Dictionary<bool, ICameraCharacter> cameras; 


    private void SwitchCamera()
    {
        activeCamera = cameras[handlerState.stateCamera.isFerstCamera];
    }
    public void Tick_Camera()
    {
        SwitchCamera();
        activeCamera.SwitchLookPointCamera(handlerState.stateMove.isLeftTargerPoint, handlerState.stateMove.isCrouch);
        handlerState.stateCamera.SetStateRotateCamera(inventoryUI.isActiveInventory);
        activeCamera.CheckCameraRotateAngle();
    }
    public void LateTick_Camera()
    {
        activeCamera.FollowCamera();     
        if (handlerState.stateCamera.isStopingRotate)  
             activeCamera.RotateCamera(handlerState.stateWeapon.isAim);
        activeCamera.ZoomCamera(handlerState.stateWeapon.isAim, handlerState.stateWeapon.isReloadWeapon); 
    }
      
    public void FixedTick_Camera()
    { 
        ray.RayHitTakeItemInteract(); 
        if (handlerState.stateWeapon.isAim)
        {
            ray.GetPointRayAim(); 
            ray.Shooting(handlerState.stateWeapon.isFire); 
        } 
    }
}
