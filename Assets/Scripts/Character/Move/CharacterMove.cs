 
using UnityEngine;
using Zenject;

public class CharacterMove : MonoBehaviour
{
    [SerializeField] private float speedSprint = 5f;
    [SerializeField] private float speedRunForward = 3f;
    [SerializeField] private float speedRunBack = 2f;
    [SerializeField] private float speedWalkForward = 1.5f;
    [SerializeField] private float speedWalkBack = 1f;

    [SerializeField] private float jumpForce = 3f;
    [SerializeField] private string OnCollisionTag ="Parkour";


    private CameraCharacter cameraCharacter;
    private Rigidbody rbCharacter;
    private Transform transformCharacter;

    public Vector3 inputAxis { get; private set; }
    public Vector3 newDirection { get; private set; }
    public float speedMove { get; private set; }
    public float speedRotate { get; private set; }

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
        cameraCharacter = FindFirstObjectByType<CameraCharacter>();
    } 
    
    public void Moving()
    {
        Vector3 cameraZ = Vector3.ProjectOnPlane(cameraCharacter.transform.forward, Vector3.up).normalized;
        Vector3 cameraX = Vector3.ProjectOnPlane(cameraCharacter.transform.right, Vector3.up).normalized;
        
        newDirection = (inputAxis.z * cameraZ) + (inputAxis.x * cameraX);
        if (newDirection.sqrMagnitude > 0.2f | state.isAiming)
        {
            Rotating(cameraZ);
            rbCharacter.MovePosition(rbCharacter.position + newDirection * speedMove * Time.deltaTime);
        } 
    }
    public void InputCharacter_OnAxisMove(Vector2 axis)
    {
        if (state.isMoving)
        {
            inputAxis = new Vector3(axis.x, 0, axis.y);
            state.SetInputAxisMove(axis);
        }    
    }
    public void Jumping()
    {
        if (state.isJumping && state.isCollision)
        { 
            rbCharacter.AddForce(Vector3.up * jumpForce, ForceMode.Impulse); 
        }
    }  
    public void SwitchVelocityMove()
    {
        if (state.isWalking | state.isAiming) speedMove = inputAxis.z < 0 ? speedWalkBack : speedWalkForward;
        else speedMove = inputAxis.z < 0 ? speedRunBack : (state.isRunningSprint ? (inputAxis.z > 0 ? speedSprint : speedRunForward) : speedRunForward); 
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
        speedRotate = state.isAiming ? 8f : 3f;
        Quaternion direction = Quaternion.LookRotation(cameraZ, Vector3.up);
        transformCharacter.rotation = Quaternion.Lerp(transformCharacter.rotation, direction, speedRotate * Time.deltaTime); 
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
