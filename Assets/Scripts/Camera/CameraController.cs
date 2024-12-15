 
using Zenject;
using System;

public class CameraController: ILateTickable, IInitializable, IDisposable, IFixedTickable
{   
    public CameraController(InputCamera input, CameraCharacter camera, CharacterState state,
        WindowUI windowUI, RaycastCamera ray,
    [Inject(Id = "inventoryUI")]IInventoryUI inventoryUI)
    {
        this.input = input; 
        this.camera = camera;   
        this.state = state;
        this.inventoryUI = inventoryUI;
        this.windowUI = windowUI;
        this.ray = ray; 
    }
    private InputCamera input; 
    private CameraCharacter camera;
    private CharacterState state;
    private WindowUI windowUI;
    private RaycastCamera ray; 
    private IInventoryUI inventoryUI;


    public void Initialize()
    {
        input.onInputAxis += camera.GetInputAxisMouse; 
    }
    public void Dispose()
    {
        input.onInputAxis -= camera.GetInputAxisMouse; 
    }

    public void LateTick()
    {
        camera.RotateCamera();
        camera.ZoomCamera(state.isAim);
        camera.SwitchLookPointCamera(state.isLeftTargerPoint,state.isCrouch);

        bool isActive = inventoryUI.isActiveInventory;
        state.StoppingRotateCamera(isActive); 
        windowUI.ShowInteractText();
    }

    public void FixedTick()
    {
        ray.RayHitTakeItemInteract();
        if (state.isAim)
        {
            ray.GetPointRayAim();
            ray.Shooting(state.isFire); 
        }
        camera.CheckCameraRotateAngle();
    }
}
