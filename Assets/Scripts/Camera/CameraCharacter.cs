
using UnityEngine;
using Zenject;

public class CameraCharacter : MonoBehaviour
{
    [SerializeField] private Transform pointRightLook;
    [SerializeField] private Transform pointLeftLook;
    private Transform currentLookPoint;
    [HideInInspector]public Transform transformCamera; 
    [SerializeField] private float sensitivityMouse = 45f;
    [SerializeField] private float scrollSpeed = 3f;

    private CharacterState state;
    private Vector3 offset;
    public float mouseAxisX;
    private float mouseAxisY;
    private float mouseZoom;

    private float minAngle = -60f;
    private float maxAngle = 60f;
    private float minZoom = 1f;
    private float maxZoom = 2f;

    private float limitAngle = 25f; 


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
        currentLookPoint = pointRightLook;
        offset = transformCamera.position - currentLookPoint.position;
    }
    public void SwitchLookPointCamera(bool isLeftPointLook, bool isCrouching)
    {
        float heightPoint = isCrouching ? 1f : 1.55f;
        if (isLeftPointLook)
            pointLeftLook.localPosition = new Vector3(-0.836f, heightPoint, 0);
        else pointRightLook.localPosition = new Vector3(0.836f, heightPoint, 0);
        Transform targetLookPoint = isLeftPointLook  ? pointLeftLook : pointRightLook;
        targetLookPoint.position = Vector3.Lerp(currentLookPoint.position, targetLookPoint.position, Time.deltaTime * 0.5f);
        currentLookPoint = targetLookPoint;
    }
    public void RotateCamera()
    { 
        mouseAxisY = Mathf.Clamp(mouseAxisY, minAngle, maxAngle);
        transformCamera.localEulerAngles = new Vector3(mouseAxisY, mouseAxisX, 0);
        Vector3 newPosition = transformCamera.localRotation * offset + currentLookPoint.position;
        transformCamera.position = Vector3.Lerp(transformCamera.position, newPosition, Time.deltaTime);
    }
    public void ZoomCamera(bool isAiming)
    {
        mouseZoom = isAiming ? minZoom : maxZoom;
        transformCamera.position = currentLookPoint.position - transformCamera.forward * mouseZoom; 
    }

    public void GetInputAxisMouse(Vector2 inputAxis)
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
    public void CheckCameraRotateAngle()
    {   
        Vector3 cameraZ = Vector3.ProjectOnPlane(transformCamera.forward, Vector3.up).normalized;
        Vector3 characterZ = Vector3.ProjectOnPlane(currentLookPoint.forward, Vector3.up).normalized;
        float currentAngleCamera = Vector3.SignedAngle(cameraZ, characterZ, Vector3.up);
        state.SetAngleForCamera(currentAngleCamera);
        if (Mathf.Abs(state.currentAngleCamera) > limitAngle)
        {
            state.SetStateCameraAngle(true);
        }
        else state.SetStateCameraAngle(false);
    }
    public void GetInputScrollMouse(Vector2 scrollMouse)
    {
        if (state.isRotateCamera)
        {
            mouseZoom -= scrollMouse.y * scrollSpeed * Time.deltaTime;
        }    
    }
}
