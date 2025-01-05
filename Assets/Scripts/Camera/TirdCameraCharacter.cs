
using System.Security.Claims;
using UnityEngine;
using Zenject;

public class TirdCameraCharacter : MonoBehaviour, ICameraCharacter
{
    [SerializeField] private Transform targetLookPoint;  
      
    [HideInInspector]public Transform transformCamera; 
    [SerializeField] private float sensitivityMouse = 45f;
    [SerializeField] private float scrollSpeed = 3f;
    [SerializeField] private float transitionSpeed = 9f;
    [SerializeField] private float leftTarget = -0.500f;
    [SerializeField] private float rightTarget = 0.500f;

    
    private Vector3 offset;
    public float mouseAxisX;
    private float mouseAxisY;
    private float mouseZoom;

    private float minAngle = -90f;
    private float maxAngle = 90f;
    private float minZoom = 1f;
    private float maxZoom = 2f;

    private float limitAngle = 65f;
    private float limitAngleAim = 5f;
    private float newHeigth;

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
        offset = transformCamera.position - targetLookPoint.position;
    }
    public void FollowCamera()
    { 
        // Smoothly adjust the position to maintain the offset
        Vector3 newPosition = transformCamera.localRotation * offset + targetLookPoint.position;
        transformCamera.position = Vector3.Lerp(transformCamera.position, newPosition, Time.deltaTime * transitionSpeed);
    }
    public void RotateCamera(bool isAim)
    {
        // Clamp and smooth the rotation
        transitionSpeed = isAim ? 15 : 9;
        mouseAxisY = Mathf.Clamp(mouseAxisY, minAngle, maxAngle);  
        Quaternion newRot = Quaternion.Euler(mouseAxisY, mouseAxisX, 0);
        transformCamera.rotation = Quaternion.Slerp(transformCamera.rotation, newRot, Time.smoothDeltaTime * transitionSpeed);
    }
    public void ZoomCamera(bool isAiming, bool isReloadWeapon)
    {
        float targetZoom = isAiming ? (isReloadWeapon ? maxZoom : minZoom) : maxZoom;
        mouseZoom = Mathf.Lerp(mouseZoom, targetZoom, Time.deltaTime * transitionSpeed);
         
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
        if (state.isStopingRotate)
        {
            mouseZoom -= scrollMouse.y * scrollSpeed * Time.deltaTime;
        }
    }


    public void CheckCameraRotateAngle(CharacterState state)
    {   
        Vector3 cameraZ = Vector3.ProjectOnPlane(transformCamera.forward, Vector3.up).normalized;
        Vector3 characterZ = Vector3.ProjectOnPlane(targetLookPoint.forward, Vector3.up).normalized;
        float currentAngleCamera = Vector3.SignedAngle(cameraZ, characterZ, Vector3.up);
        state.SetAngleForCamera(currentAngleCamera);
        if (state.isAim && Mathf.Abs(state.currentAngleCamera) > limitAngleAim)
        {
            state.SetStateCameraAngle(true);
        }
        else if(Mathf.Abs(state.currentAngleCamera) > limitAngle)
        {
            state.SetStateCameraAngle(true);
        }
        else state.SetStateCameraAngle(false);
    }
    public void SwitchLookPointCamera(bool isLeftPointLook, bool isCrouching)
    {
        float heightPoint = isCrouching ? 1.2f : 1.6f;
        newHeigth = Mathf.Lerp(newHeigth, heightPoint, Time.deltaTime * transitionSpeed); 

        // Smoothly transition to the new height and look point position
        Vector3 targetPosition = new Vector3(isLeftPointLook ? leftTarget : rightTarget, newHeigth, 0);

        targetLookPoint.localPosition = Vector3.Lerp(targetLookPoint.localPosition, targetPosition, Time.deltaTime * transitionSpeed); 
    }
     
}
