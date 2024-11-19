
using System; 
using Zenject;

public class CameraController: ILateTickable, IInitializable, IDisposable
{   
    public CameraController(InputCamera input, CameraCharacter camera, CharacterAnimator characterAnimator, 
        WindowUI windowUI, RaycastCamera ray,
        [Inject(Id = "inventoryUI")]IInventoryUI inventoryUI)
    {
        this.input = input;
        this.camera = camera;   
        this.characterAnimator = characterAnimator;
        this.inventoryUI = inventoryUI;
        this.windowUI = windowUI;
        this.ray = ray;
    }
    private InputCamera input;
    private CameraCharacter camera;
    private CharacterAnimator characterAnimator;
    private WindowUI windowUI;
    private RaycastCamera ray;
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
         
        bool isLimitAngle = camera.CheckCameraRotateAngle();
        characterAnimator.SwitchAnimationTurn(camera.currentAngle, camera.isRotateCamera);
        characterAnimator.TurnAnimation(camera.inputAxisMouse,camera.isRotateCamera, isLimitAngle); 

        ray.RayHitTakeInteract();
        windowUI.ShowInteractText();
    }
   

}
