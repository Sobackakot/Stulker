 
using UnityEngine;
using Zenject;

public class FerstCameraCharacter : MonoBehaviour, ICameraCharacter
{
    [SerializeField] private Transform targetLookPoint;
    [HideInInspector] public Transform transformCamera;

    [SerializeField] private Transform targetPointIKAim;
    [SerializeField] private Transform pointFromRaycast;

    [SerializeField] private float sensitivityMouse = 6f;
     
    private Vector3 offset;
    private float mouseAxisX;
    private float mouseAxisY;

    private float minAngle = -90f;
    private float maxAngle = 90f;   
    private float mouseZoom;
      
    private float minZoom = 0f;
    private float maxZoom = 0f;

    private CharacterState state;
    [Inject]
    private void Construct(CharacterState state)
    {
        this.state = state;
    }
    private void Awake()
    {
        transformCamera = GetComponent<Transform>();
    }
    void Start()
    { 
        offset = transformCamera.position - targetLookPoint.position;
    } 
    public void RotateCamera()
    { 
        mouseAxisY = Mathf.Clamp(mouseAxisY, minAngle, maxAngle);
        transformCamera.localEulerAngles = new Vector3(mouseAxisY, mouseAxisX, 0);
        Vector3 newPosition = transformCamera.localRotation * offset + targetLookPoint.position;
        transformCamera.position = Vector3.Lerp(transformCamera.position, newPosition, Time.deltaTime);
    } 

    public void ZoomCamera(bool isAiming)
    {
        mouseZoom = isAiming ? minZoom : maxZoom;
        transformCamera.position = targetLookPoint.position - transformCamera.forward * mouseZoom;
    }

    public void InputCamera_OnInputAxis(Vector2 inputAxis)
    {
        if (state.isRotateCamera)
        {
            mouseAxisX += inputAxis.x * sensitivityMouse * Time.deltaTime;
            mouseAxisY -= inputAxis.y * sensitivityMouse * Time.deltaTime;
            if (inputAxis.sqrMagnitude > 0.2f)
                state.SetInputAxisCamera(inputAxis);
            else
                state.SetInputAxisCamera(Vector2.zero);
        }
    }
    public void SetTargetPointAim(bool isAim)
    {
        if (isAim)
            targetPointIKAim.position = pointFromRaycast.position;
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
