 
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

    private StateGameHandler state;

    [Inject]
    private void Construct(StateGameHandler state)
    {
        this.state = state;
    }
    private void Awake()
    {
        rbCharacter = GetComponent<Rigidbody>();
        cameraCharacter = FindFirstObjectByType<TirdCameraCharacter>();
        cameraFerst = FindObjectOfType<FirstCameraCharacter>();
    }
    private void OnEnable()
    {
        state.Move.OnMoving += InputCharacter_OnAxisMove;
        state.Move.OnJumping += InputCharacter_OnJumping;
    }
    private void OnDisable()
    {
        state.Move.OnMoving -= InputCharacter_OnAxisMove;
        state.Move.OnJumping -= InputCharacter_OnJumping;
    }
    private void SetActiveCamera()
    {
        bool isActive = state.Camera.isFerst ? true : false;
        cameraFerst.enabled = isActive;
        cameraCharacter.enabled = !isActive;
        currentCamera = state.Camera.isFerst ? cameraFerst.transform : cameraCharacter.transform; 
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
        if (state.Weapon.isAim | !state.Move.isIdle && isMove)
        {
            Quaternion rot = Quaternion.LookRotation(cameraZ, Vector3.up);
            rbCharacter.MoveRotation(rot);
        }
        else if(state.Camera.isMaxAngle && state.Move.isIdle && isMove) 
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
        if (state.Move.isCollision)
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
        if (state.Move.isWalck | state.Weapon.isAim | state.Move.isCrouch) speedMove = inputAxis.z < 0 ? speedWalkBack : speedWalkForward;
        else speedMove = inputAxis.z < 0 ? speedRunBack : (state.Move.isSprint ? (inputAxis.z > 0 ? speedSprint : speedRunForward) : speedRunForward); 
    }
    public void StopingMoveCharacter(bool isActiveInventoryBox )
    {
        if (isActiveInventoryBox)    
        {
            state.Move.SetStateMove(false);
        } 
        else state.Move.SetStateMove(true);
    }
    
    private void OnCollisionEnter(Collision collision)
    {
        if (collision.gameObject.tag == OnCollisionTag)
        {
            state.Move.SetCollision(true); 
        }
    }
    private void OnCollisionExit(Collision collision)
    {
        if (collision.gameObject.tag == OnCollisionTag)
        {
            state.Move.SetCollision(false); 
        }
    }
}
