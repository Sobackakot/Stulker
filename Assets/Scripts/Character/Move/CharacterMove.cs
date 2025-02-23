 
using UnityEngine;
using Zenject;
using StateGame;

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
    private FirstCameraCharacter cameraFerst;
    private Transform currentCamera;
    private Rigidbody rbCharacter;

    public Vector3 inputAxis { get; private set; }
    public Vector3 newDirection { get; private set; }
    public Vector3 cameraZ { get; private set; }
    public float speedMove { get; private set; }

    private StateGameHandler handlerState;

    [Inject]
    private void Construct(StateGameHandler handlerState)
    {
        this.handlerState = handlerState;
    }
    private void Awake()
    {
        rbCharacter = GetComponent<Rigidbody>();
        cameraCharacter = FindFirstObjectByType<TirdCameraCharacter>();
        cameraFerst = FindObjectOfType<FirstCameraCharacter>();
    }
    private void OnEnable()
    {
        handlerState.stateMove.OnMoving += InputCharacter_OnAxisMove;
        handlerState.stateMove.OnJumping += InputCharacter_OnJumping;
    }
    private void OnDisable()
    {
        handlerState.stateMove.OnMoving -= InputCharacter_OnAxisMove;
        handlerState.stateMove.OnJumping -= InputCharacter_OnJumping;
    }
    private void SetActiveCamera()
    {
        bool isActive = handlerState.stateCamera.isFerstCamera ? true : false;
        cameraFerst.enabled = isActive;
        cameraCharacter.enabled = !isActive;
        currentCamera = handlerState.stateCamera.isFerstCamera ? cameraFerst.transform : cameraCharacter.transform; 
    }
    public void RotateWithCamera()
    {
        SetActiveCamera();
        cameraZ = Vector3.ProjectOnPlane(currentCamera.forward, Vector3.up).normalized;
        Vector3 cameraX = Vector3.ProjectOnPlane(currentCamera.right, Vector3.up).normalized; 
        newDirection = (inputAxis.z * cameraZ) + (inputAxis.x * cameraX);
    }
    public void Rotating(bool isMove)
    {
        if (handlerState.stateWeapon.isAim | !handlerState.stateMove.isIdle && isMove)
        {
            Quaternion rot = Quaternion.LookRotation(cameraZ, Vector3.up);
            rbCharacter.MoveRotation(rot);
        }
        else if(handlerState.stateCamera.isMaxAngleCamera && handlerState.stateMove.isIdle && isMove) 
        {
            Quaternion direction = Quaternion.LookRotation(cameraZ, Vector3.up); 
            Quaternion rot = Quaternion.Lerp(rbCharacter.rotation, direction, Time.fixedDeltaTime * speedRotate);
            rbCharacter.MoveRotation(rot);
        } 
    }
    
    public void InputCharacter_OnAxisMove(Vector2 inputAxis)
    {
        this.inputAxis = new Vector3(inputAxis.x, 0, inputAxis.y);
    }
    public void InputCharacter_OnJumping()
    {
        if (handlerState.stateMove.isCollision)
        { 
            rbCharacter.AddForce(Vector3.up * jumpForce, ForceMode.Impulse); 
        }
    }
    public void Moving(bool isMove)
    {
        if (isMove)
        {
            rbCharacter.MovePosition(rbCharacter.position + newDirection * speedMove * Time.fixedDeltaTime);
        }
    }
    public void SwitchVelocityMove()
    {
        if (handlerState.stateMove.isWalck | handlerState.stateWeapon.isAim | handlerState.stateMove.isCrouch) speedMove = inputAxis.z < 0 ? speedWalkBack : speedWalkForward;
        else speedMove = inputAxis.z < 0 ? speedRunBack : (handlerState.stateMove.isSprint ? (inputAxis.z > 0 ? speedSprint : speedRunForward) : speedRunForward); 
    }
    public void StopingMoveCharacter(bool isActiveInventoryBox )
    {
        if (isActiveInventoryBox)    
        {
            handlerState.stateMove.SetStateMove(false);
        } 
        else handlerState.stateMove.SetStateMove(true);
    }
    
    private void OnCollisionEnter(Collision collision)
    {
        if (collision.gameObject.tag == OnCollisionTag)
        {
            handlerState.stateMove.SetCollision(true); 
        }
    }
    private void OnCollisionExit(Collision collision)
    {
        if (collision.gameObject.tag == OnCollisionTag)
        {
            handlerState.stateMove.SetCollision(false); 
        }
    }
}
