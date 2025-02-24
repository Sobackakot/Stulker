 
using UnityEngine;
using Zenject;
using StateGame;

public class FirstCameraCharacter : MonoBehaviour, ICameraCharacter
{
    [SerializeField] private Transform targetLookPoint;
    [HideInInspector] public Transform transformCamera;
      
    [SerializeField] private float sensitivityMouse = 6f; 
    [SerializeField] private float transitionSpeed = 9f;
     
    private Vector3 offset;
    private float mouseAxisX;
    private float mouseAxisY;

    private float minAngle = -90f;
    private float maxAngle = 90f;   
    private float mouseZoom;
      
    private float minZoom = 0f;
    private float maxZoom = 0f;

    private StateGameHandler handlerState;

    [Inject]
    private void Construct(StateGameHandler handlerState)
    {
        this.handlerState = handlerState;
    }
    private void Awake()
    {
        transformCamera = GetComponent<Transform>();
    }
    private void OnEnable()
    {
        EventBus.Subscribe<CameraInputEvent>(InputCamera_OnInputAxis);
    }
    private void OnDisable()
    {
        EventBus.Unsubscribe<CameraInputEvent>(InputCamera_OnInputAxis);
    }
    void Start()
    { 
        offset = transformCamera.position - targetLookPoint.position;
    }
    public void FollowCamera()
    { 
        Vector3 newPosition = transformCamera.localRotation * offset + targetLookPoint.position;
        transformCamera.position = Vector3.Lerp(transformCamera.position, newPosition, Time.deltaTime * transitionSpeed);
    }
    public void RotateCamera(bool isAim)
    {
        transitionSpeed = isAim ? 15 : 9;
        mouseAxisY = Mathf.Clamp(mouseAxisY, minAngle, maxAngle);   
        Quaternion newRot = Quaternion.Euler(mouseAxisY, mouseAxisX, 0);
        transformCamera.rotation = Quaternion.Slerp(transformCamera.rotation, newRot, Time.smoothDeltaTime * transitionSpeed);
    } 

    public void ZoomCamera(bool isAiming, bool isReloadWeapon)
    {
        mouseZoom = isAiming ? (isReloadWeapon ?  maxZoom : minZoom) : maxZoom;
        transformCamera.position = targetLookPoint.position - transformCamera.forward * mouseZoom;
    }

    public void InputCamera_OnInputAxis(CameraInputEvent inputEvent)
    {
        if (handlerState.Camera.isStopingRotate)
        {
            mouseAxisX += inputEvent.InputAxis.x * sensitivityMouse * Time.deltaTime;
            mouseAxisY -= inputEvent.InputAxis.y * sensitivityMouse * Time.deltaTime;
            handlerState.Camera.SetInputAxisCamera(inputEvent.InputAxis); 
        }
    }
    public void InputCamera_OnScrollMouse(Vector2 scrollMouse)
    {
         
    }

    public void CheckCameraRotateAngle()
    { 
    }

    public void SwitchLookPointCamera(bool isLeftPointLook, bool isCrouching)
    { 
    } 
}
