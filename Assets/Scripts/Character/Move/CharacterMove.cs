 
using UnityEngine;

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
    public Vector3 inputAxis{get; private set;}
    private Vector3 newDirection;
    public float speedMove { get; private set; }
    public bool isJumping { get; private set; }
    public bool isRunningSprint { get; private set; }
    public bool isWalking { get; private set; }
    public bool isDiagonal {  get; private set; }
    public bool isCollision { get; private set; } 

    private void Awake()
    {
        transformCharacter = GetComponent<Transform>();
        rbCharacter = GetComponent<Rigidbody>();
        cameraCharacter = FindFirstObjectByType<CameraCharacter>();
    } 
    public void UpdateDirectionMove()
    {
        
    }
    public void Moving()
    {
        Vector3 cameraZ = Vector3.ProjectOnPlane(cameraCharacter.transform.forward, Vector3.up).normalized;
        Vector3 cameraX = Vector3.ProjectOnPlane(cameraCharacter.transform.right, Vector3.up).normalized;
        
        newDirection = (inputAxis.z * cameraZ) + (inputAxis.x * cameraX);
        if (newDirection.sqrMagnitude > 0.2f)
        {
            Quaternion direction = Quaternion.LookRotation(cameraZ, Vector3.up);
            transformCharacter.rotation = Quaternion.Lerp(transformCharacter.rotation, direction, speedMove * Time.deltaTime);
            rbCharacter.MovePosition(rbCharacter.position + newDirection * speedMove * Time.deltaTime);
        } 
    }
     
    public void Jumping()
    {
        if (isJumping && isCollision)
        { 
            rbCharacter.AddForce(Vector3.up * jumpForce, ForceMode.Impulse);  
        }
    }  
    public void SwitchVelocityMove()
    {   
        if(inputAxis.z < 0)
        {
           
            speedMove = isWalking ? speedWalkBack : speedRunBack;
        }
        else if (inputAxis.z > 0) 
        {   
            speedMove = isWalking ? speedWalkForward : (isRunningSprint ? speedSprint : speedRunForward); 
        }
        else
        {
            speedMove = isWalking ? speedWalkForward : speedRunForward;
        }
    }
    public void InputCharacter_OnAxisMove(Vector2 axis)
    {
        inputAxis = new Vector3(axis.x, 0, axis.y); 
    }
    public void InputCharacter_OnKeyDownJump(bool isKeyDown)
    {
        isJumping = isKeyDown;
    }
    public void InputCharacter_OnKeyRun(bool isKeyRun)
    {
        isRunningSprint = isKeyRun;
    }
     
    public void InputCharacter_OnKeyWalk(bool isKeyWalk)
    {
        isWalking = isKeyWalk;  
    } 
    
    private void OnCollisionEnter(Collision collision)
    {
        if (collision.gameObject.tag == OnCollisionTag)
        {
            isCollision = true; 
        }
    }
    private void OnCollisionExit(Collision collision)
    {
        if (collision.gameObject.tag == OnCollisionTag)
        {
            isCollision = false; 
        }
    }
}
