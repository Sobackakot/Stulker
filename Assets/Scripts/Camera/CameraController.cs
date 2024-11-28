 
using Zenject;
using System;

public class CameraController: ILateTickable, IInitializable, IDisposable, IFixedTickable
{   
    public CameraController(InputCamera input, CameraCharacter camera, CharacterState state,
        WindowUI windowUI, RaycastCamera ray, WeaponAim weaponAim,
    [Inject(Id = "inventoryUI")]IInventoryUI inventoryUI)
    {
        this.input = input;
        this.camera = camera;   
        this.state = state;
        this.inventoryUI = inventoryUI;
        this.windowUI = windowUI;
        this.ray = ray;
        this.weaponAim = weaponAim; 
    }
    private InputCamera input;
    private CameraCharacter camera;
    private CharacterState state;
    private WindowUI windowUI;
    private RaycastCamera ray;
    private WeaponAim weaponAim;
    private IInventoryUI inventoryUI;


    public void Initialize()
    {
        input.onInputAxis += camera.GetInputAxisMouse;
        input.onScrollZoom += camera.GetInputScrollMouse; 
    }
    public void Dispose()
    {
        input.onInputAxis -= camera.GetInputAxisMouse;
        input.onScrollZoom -= camera.GetInputScrollMouse; 
    }

    public void LateTick()
    {
        camera.RotateCamera();
        camera.ZoomCamera();

        bool isActive = inventoryUI.isActiveInventory;
        camera.StoppingRotateCameta(isActive);
           
        
        windowUI.ShowInteractText();
       
    }

    public void FixedTick()
    {
        ray.RayHitTakeItemInteract();
        if (state.isAiming)
        {
            UnityEngine.Vector3 hitPoint = ray.GetPointRayAim();
            weaponAim.SetWeaponAim(hitPoint);
        }
    }
}
