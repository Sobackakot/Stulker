 
using UnityEngine;
using Zenject;

public class CharacterMove : MonoBehaviour
{
    [SerializeField] private float speedSprint = 5f;
    [SerializeField] private float speedRunForward = 3f;
    [SerializeField] private float speedRunBack = 2f;
    [SerializeField] private float speedWalkForward = 1.5f;
    [SerializeField] private float speedWalkBack = 0.5f;

    [SerializeField] private float jumpForce = 3f;
    [SerializeField] private float speedRotate = 45f;
    [SerializeField] private string OnCollisionTag ="Parkour";


    private TirdCameraCharacter cameraCharacter;
    private FerstCameraCharacter cameraFerst;
    private Transform currentCamera;
    private Rigidbody rbCharacter;
    private Transform transformCharacter;

    public Vector3 inputAxis { get; private set; }
    public Vector3 newDirection { get; private set; }
    public float speedMove { get; private set; }
     
    private CharacterState state;

    [Inject]
    private void Container(CharacterState state)
    {
        this.state = state;
    }
    private void Awake()
    {
        transformCharacter = GetComponent<Transform>();
        rbCharacter = GetComponent<Rigidbody>();
        cameraCharacter = FindFirstObjectByType<TirdCameraCharacter>();
        cameraFerst = FindObjectOfType<FerstCameraCharacter>();
    } 
    private void SetActiveCamera()
    {
        bool isActive = state.isFerstCamera ? true : false;
        cameraFerst.enabled = isActive;
        cameraCharacter.enabled = !isActive;
        currentCamera = state.isFerstCamera ? cameraFerst.transform : cameraCharacter.transform; 
    }
    public void RotateWithCamera()
    {
        SetActiveCamera();
        Vector3 cameraZ = Vector3.ProjectOnPlane(currentCamera.forward, Vector3.up).normalized;
        Vector3 cameraX = Vector3.ProjectOnPlane(currentCamera.right, Vector3.up).normalized;

        newDirection = (inputAxis.z * cameraZ) + (inputAxis.x * cameraX);
        Rotating(cameraZ);
    }
    public void Moving()
    { 
        rbCharacter.MovePosition(rbCharacter.position + newDirection * speedMove * Time.deltaTime);
    }
    public void InputCharacter_OnAxisMove(Vector2 axis)
    {
        if (state.isMov)
        {
            inputAxis = new Vector3(axis.x, 0, axis.y);
            state.SetInputAxisMove(axis);
        }    
    }
    public void InputCharacter_OnJumpingKeyDown()
    {
        if (state.isCollision)
        { 
            rbCharacter.AddForce(Vector3.up * jumpForce, ForceMode.Impulse); 
        }
    }  
    public void SwitchVelocityMove()
    {
        if (state.isWalk | state.isAim | state.isCrouch) speedMove = inputAxis.z < 0 ? speedWalkBack : speedWalkForward;
        else speedMove = inputAxis.z < 0 ? speedRunBack : (state.isRun ? (inputAxis.z > 0 ? speedSprint : speedRunForward) : speedRunForward); 
    }
    public void StopingMoveCharacter(bool isActiveInventoryBox)
    {
        if (isActiveInventoryBox)   
        {
            state.UpdateStateMove(false);
            inputAxis = Vector3.zero;
            newDirection = Vector3.zero;
        } 
        else state.UpdateStateMove(true);
    }
    private void Rotating(Vector3 cameraZ)
    { 
        if (state.isAim)
        { 
            transformCharacter.rotation = Quaternion.LookRotation(cameraZ, Vector3.up);
        } 
        else
        {
            Quaternion direction = Quaternion.LookRotation(cameraZ, Vector3.up);
            transformCharacter.rotation = Quaternion.Lerp(transformCharacter.rotation, direction,  Time.deltaTime * speedRotate);
        }  
    }
    private void OnCollisionEnter(Collision collision)
    {
        if (collision.gameObject.tag == OnCollisionTag)
        {
            state.SetCollision(true); 
        }
    }
    private void OnCollisionExit(Collision collision)
    {
        if (collision.gameObject.tag == OnCollisionTag)
        {
            state.SetCollision(false); 
        }
    }
}
