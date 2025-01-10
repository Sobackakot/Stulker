 
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
    private FirstCameraCharacter cameraFerst;
    private Transform currentCamera;
    private Rigidbody rbCharacter;

    public Vector3 inputAxis { get; private set; }
    public Vector3 newDirection { get; private set; }
    public Vector3 cameraZ { get; private set; }
    public float speedMove { get; private set; } 
     
    private CharacterState state;

    [Inject]
    private void Container(CharacterState state)
    {
        this.state = state;
    }
    private void Awake()
    {
        rbCharacter = GetComponent<Rigidbody>();
        cameraCharacter = FindFirstObjectByType<TirdCameraCharacter>();
        cameraFerst = FindObjectOfType<FirstCameraCharacter>();
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
        cameraZ = Vector3.ProjectOnPlane(currentCamera.forward, Vector3.up).normalized;
        Vector3 cameraX = Vector3.ProjectOnPlane(currentCamera.right, Vector3.up).normalized; 
        newDirection = (inputAxis.z * cameraZ) + (inputAxis.x * cameraX);
    }
    public void Rotating(bool isMove)
    {
        if (state.isAim | !state.isIdle && isMove)
        {
            Quaternion rot = Quaternion.LookRotation(cameraZ, Vector3.up);
            rbCharacter.MoveRotation(rot);
        }
        else if(state.isMaxAngleCamera && state.isIdle && isMove) 
        {
            Quaternion direction = Quaternion.LookRotation(cameraZ, Vector3.up); 
            Quaternion rot = Quaternion.Lerp(rbCharacter.rotation, direction, Time.fixedDeltaTime * speedRotate);
            rbCharacter.MoveRotation(rot);
        } 
    }
    public void Moving(bool isMove)
    { 
        if (isMove)
        {
            rbCharacter.MovePosition(rbCharacter.position + newDirection * speedMove * Time.fixedDeltaTime);
        } 
    }
    public void CharacterState_OnAxisMove(Vector2 axis)
    {
        inputAxis = new Vector3(axis.x, 0, axis.y);
    }
    public void CharacterState_OnJumping()
    {
        if (state.isCollision)
        { 
            rbCharacter.AddForce(Vector3.up * jumpForce, ForceMode.Impulse); 
        }
    }  
    public void SwitchVelocityMove(CharacterState state)
    {
        if (state.isWalck | state.isAim | state.isCrouch) speedMove = inputAxis.z < 0 ? speedWalkBack : speedWalkForward;
        else speedMove = inputAxis.z < 0 ? speedRunBack : (state.isSprint ? (inputAxis.z > 0 ? speedSprint : speedRunForward) : speedRunForward); 
    }
    public void StopingMoveCharacter(bool isActiveInventoryBox )
    {
        if (isActiveInventoryBox)    
        {
            state.SetStateMove(false);
        } 
        else state.SetStateMove(true);
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
