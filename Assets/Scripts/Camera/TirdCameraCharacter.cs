
using UnityEngine;
using Zenject;

public class TirdCameraCharacter : MonoBehaviour, ICameraCharacter
{
    [SerializeField] private Transform targetPointRightLook;
    [SerializeField] private Transform targetPointLeftLook;
    private Transform currentTargetLookPoint;

    [SerializeField] private Transform targetPointIKAim;
    [SerializeField] private Transform pointFromRaycast;

    [HideInInspector]public Transform transformCamera; 
    [SerializeField] private float sensitivityMouse = 45f;
    [SerializeField] private float scrollSpeed = 3f;

    
    private Vector3 offset;
    public float mouseAxisX;
    private float mouseAxisY;
    private float mouseZoom;

    private float minAngle = -60f;
    private float maxAngle = 60f;
    private float minZoom = 1f;
    private float maxZoom = 2f;

    private float limitAngle = 25f;

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
    private void Start()
    {
        currentTargetLookPoint = targetPointRightLook;
        offset = transformCamera.position - currentTargetLookPoint.position;
    }
   
    public void RotateCamera()
    { 
        mouseAxisY = Mathf.Clamp(mouseAxisY, minAngle, maxAngle);
        transformCamera.localEulerAngles = new Vector3(mouseAxisY, mouseAxisX, 0);
        Vector3 newPosition = transformCamera.localRotation * offset + currentTargetLookPoint.position;
        transformCamera.position = Vector3.Lerp(transformCamera.position, newPosition, Time.deltaTime);
    }
    public void ZoomCamera(bool isAiming)
    {
        mouseZoom = isAiming ? minZoom : maxZoom;
        transformCamera.position = currentTargetLookPoint.position - transformCamera.forward * mouseZoom; 
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
    public void InputCamera_OnScrollMouse(Vector2 scrollMouse)
    {
        if (state.isRotateCamera)
        {
            mouseZoom -= scrollMouse.y * scrollSpeed * Time.deltaTime;
        }
    }


    public void CheckCameraRotateAngle()
    {   
        Vector3 cameraZ = Vector3.ProjectOnPlane(transformCamera.forward, Vector3.up).normalized;
        Vector3 characterZ = Vector3.ProjectOnPlane(currentTargetLookPoint.forward, Vector3.up).normalized;
        float currentAngleCamera = Vector3.SignedAngle(cameraZ, characterZ, Vector3.up);
        state.SetAngleForCamera(currentAngleCamera);
        if (Mathf.Abs(state.currentAngleCamera) > limitAngle)
        {
            state.SetStateCameraAngle(true);
        }
        else state.SetStateCameraAngle(false);
    }
    public void SwitchLookPointCamera(bool isLeftPointLook, bool isCrouching)
    {
        float heightPoint = isCrouching ? 1f : 1.55f;
        if (isLeftPointLook)
            targetPointLeftLook.localPosition = new Vector3(-0.836f, heightPoint, 0);
        else targetPointRightLook.localPosition = new Vector3(0.836f, heightPoint, 0);
        Transform targetLookPoint = isLeftPointLook ? targetPointLeftLook : targetPointRightLook;
        targetLookPoint.position = Vector3.Lerp(currentTargetLookPoint.position, targetLookPoint.position, Time.deltaTime * 0.5f);
        currentTargetLookPoint = targetLookPoint;
    }

    public void SetTargetPoint(bool isAim)
    {   
        if (isAim) 
            targetPointIKAim.position = pointFromRaycast.position;
    }
}
