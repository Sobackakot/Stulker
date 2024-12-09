
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

    private Vector3 offset;
    public Vector3 inputAxisMouse {  get; private set; }
    public float mouseAxisX {  get; private set; }
    private float mouseAxisY;
    private float mouseZoom;

    private float minAngle = -60f;
    private float maxAngle = 60f;
    private float minZoom = 2f;
    private float maxZoom = 15f;

    private float limitAngle = 40f;
    private float limitAngleAim = 5f;
    public float currentAngle {  get; private set; }

    public bool isRotateCamera {  get; private set; }
       
    private void Awake()
    {
        transformCamera = GetComponent<Transform>();
    }
    private void Start()
    {
        currentLookPoint = pointRightLook;
        offset = transformCamera.position - currentLookPoint.position;
    }
    public void SwitchLookPointCamera(bool isLeftPointLook)
    {
         currentLookPoint = isLeftPointLook  ? pointLeftLook : pointRightLook;
    }
    public void RotateCamera()
    { 
        mouseAxisY = Mathf.Clamp(mouseAxisY, minAngle, maxAngle);
        transformCamera.localEulerAngles = new Vector3(mouseAxisY, mouseAxisX, 0);
        Vector3 newPosition = transformCamera.localRotation * offset + currentLookPoint.position;
        transformCamera.position = Vector3.Lerp(transformCamera.position, newPosition, Time.deltaTime);
    }
    public void ZoomCamera()
    {
        mouseZoom = Mathf.Clamp(mouseZoom, Mathf.Abs(minZoom), Mathf.Abs(maxZoom));
        transformCamera.position = currentLookPoint.position - transformCamera.forward * mouseZoom;
    }

    public void GetInputAxisMouse(Vector2 inputAxis)
    {
        if (isRotateCamera)
        {
            mouseAxisX += inputAxis.x * sensitivityMouse * Time.deltaTime;
            mouseAxisY -= inputAxis.y * sensitivityMouse * Time.deltaTime;
            if (inputAxis.sqrMagnitude > 0.2f)
                inputAxisMouse = new Vector3(inputAxis.x, 0, inputAxis.y);
            else
                inputAxisMouse = Vector3.zero; 
        }   
    }
    public bool CheckCameraRotateAngle(bool isAiming)
    {   
        Vector3 cameraZ = Vector3.ProjectOnPlane(transformCamera.forward, Vector3.up).normalized;
        Vector3 characterZ = Vector3.ProjectOnPlane(currentLookPoint.forward, Vector3.up).normalized;
        currentAngle = Vector3.SignedAngle(cameraZ, characterZ, Vector3.up);
        if(isAiming && Mathf.Abs(currentAngle) > limitAngleAim)
        {
            return true;
        }
        else if (Mathf.Abs(currentAngle) > limitAngle)
        {
            return true;
        }
        else return false;
    }
    public void GetInputScrollMouse(Vector2 scrollMouse)
    {
        if (isRotateCamera)
        {
            //mouseZoom -= scrollMouse.y * scrollSpeed * Time.deltaTime;
        }    
    }
    
    public void StoppingRotateCameta(bool isRotate)
    {
        isRotateCamera = isRotate;
    }
}
