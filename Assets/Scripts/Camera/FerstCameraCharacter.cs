 
using UnityEngine;
using Zenject;

public class FerstCameraCharacter : MonoBehaviour, ICameraCharacter
{
    [SerializeField] private Transform targetLookPoint;
    [HideInInspector] public Transform transformCamera;
      
    [SerializeField] private float sensitivityMouse = 6f;
    [SerializeField] private float speedCamera = 45f;
     
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
        transformCamera.position = Vector3.Lerp(transformCamera.position, newPosition, Time.deltaTime * speedCamera); 
    } 

    public void ZoomCamera(bool isAiming)
    {
        mouseZoom = isAiming ? minZoom : maxZoom;
        transformCamera.position = targetLookPoint.position - transformCamera.forward * mouseZoom;
    }

    public void InputCamera_OnInputAxis(Vector2 inputAxis)
    {
        if (state.isStopingRotate)
        {
            mouseAxisX += inputAxis.x * sensitivityMouse * Time.deltaTime;
            mouseAxisY -= inputAxis.y * sensitivityMouse * Time.deltaTime;
            state.SetInputAxisCamera(inputAxis); 
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
