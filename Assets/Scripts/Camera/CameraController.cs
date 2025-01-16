 
using Zenject;
using System;
using Inventory_;

public class CameraController: IInitializable, IDisposable 
{
    
    public CameraController(InputCamera input, CharacterState state, WindowUI windowUI, RaycastCamera ray, 
        [Inject(Id = "inventoryUI")]IInventoryUI inventoryUI , 
    [Inject(Id = "cameraTird")] ICameraCharacter cameraTird, [Inject(Id = "cameraFerst")] ICameraCharacter cameraFerst)
    {
        this.input = input;
        this.windowUI = windowUI;
        this.ray = ray;
        this.state = state;
        this.inventoryUI = inventoryUI;
        this.cameraTird = cameraTird;
        this.cameraFerst = cameraFerst; 
    } 
    private InputCamera input;  
    private CharacterState state;
    private WindowUI windowUI;
    private RaycastCamera ray; 
    private IInventoryUI inventoryUI;
    private ICameraCharacter cameraTird;
    private ICameraCharacter cameraFerst;
    private ICameraCharacter activeCamera;
     
    public void Initialize()
    {
        input.onInputAxis += cameraTird.InputCamera_OnInputAxis; 
        input.onInputAxis += cameraFerst.InputCamera_OnInputAxis;
        state.OnGetItemFromHitRay += ray.CharacterState_GetItemFromHitRay;
        state.OnSearcheInventoryBox += ray.CharacterState_OnSearcheInventoryBox;
    }
    public void Dispose()
    {
        input.onInputAxis -= cameraTird.InputCamera_OnInputAxis; 
        input.onInputAxis -= cameraFerst.InputCamera_OnInputAxis;
        state.OnGetItemFromHitRay -= ray.CharacterState_GetItemFromHitRay;
        state.OnSearcheInventoryBox -= ray.CharacterState_OnSearcheInventoryBox;
    }

    private void SwitchCamera()
    {
        activeCamera = state.isFerstCamera ? cameraFerst : cameraTird;
    }
    public void Tick_()
    {
        SwitchCamera();
        activeCamera.SwitchLookPointCamera(state.isLeftTargerPoint, state.isCrouch);
        bool isActive = inventoryUI.isActiveInventory; 
        state.SetStateRotateCamera(isActive);
        windowUI.ShowInteractText();
        activeCamera.CheckCameraRotateAngle(state);
    }
    public void LateTick_()
    {
        SwitchCamera(); 
        activeCamera.FollowCamera();     
        if (state.isStopingRotate)  
             activeCamera.RotateCamera(state.isAim);
        activeCamera.ZoomCamera(state.isAim, state.isReloadWeapon); 
    }
      
    public void FixedTick_()
    { 
        ray.RayHitTakeItemInteract(); 
        if (state.isAim)
        {
            ray.GetPointRayAim(); 
            ray.Shooting(state.isFire); 
        } 
    }
}
