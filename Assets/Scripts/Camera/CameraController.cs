 
using Zenject; 
using Inventory_;
using System.Collections.Generic;

public class CameraController 
{ 
    public CameraController(CharacterState state, RaycastCamera ray, [Inject(Id = "inventoryUI")]IInventoryUI inventoryUI , 
    [Inject(Id = "cameraTird")] ICameraCharacter cameraTird, [Inject(Id = "cameraFerst")] ICameraCharacter cameraFerst)
    { 
        this.ray = ray;
        this.state = state;
        this.inventoryUI = inventoryUI;

        cameras = new Dictionary<bool, ICameraCharacter>
        {
            { true, cameraFerst },
            { false, cameraTird }
        };
        activeCamera = cameras[state.isFerstCamera];

    }

    private CharacterState state;
    private RaycastCamera ray; 
    private IInventoryUI inventoryUI; 

    private ICameraCharacter activeCamera;
    private readonly Dictionary<bool, ICameraCharacter> cameras; 


    private void SwitchCamera()
    {
        activeCamera = cameras[state.isFerstCamera];
    }
    public void Tick_Camera()
    {
        SwitchCamera();
        activeCamera.SwitchLookPointCamera(state.isLeftTargerPoint, state.isCrouch); 
        state.SetStateRotateCamera(inventoryUI.isActiveInventory);
        activeCamera.CheckCameraRotateAngle(state);
    }
    public void LateTick_Camera()
    {
        activeCamera.FollowCamera();     
        if (state.isStopingRotate)  
             activeCamera.RotateCamera(state.isAim);
        activeCamera.ZoomCamera(state.isAim, state.isReloadWeapon); 
    }
      
    public void FixedTick_Camera()
    { 
        ray.RayHitTakeItemInteract(); 
        if (state.isAim)
        {
            ray.GetPointRayAim(); 
            ray.Shooting(state.isFire); 
        } 
    }
}
