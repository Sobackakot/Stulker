 
using UnityEngine;

public class CharacterMove : MonoBehaviour
{
    [SerializeField] private float speedRunForward = 6f;
    [SerializeField] private float speedRunBack = 4.2f;
    [SerializeField] private float speedWalkForward = 2.5f;
    [SerializeField] private float speedWalkBack = 1.8f;

    [SerializeField] private float jumpForce = 3f;
    [SerializeField] private string OnCollisionTag ="Parkour";


    private CameraCharacter cameraCharacter;
    private Rigidbody rbCharacter;
    private Transform transformCharacter;
    public Vector3 inputAxis{get; private set;}
    private Vector3 newDirection;
    public float speedMove { get; private set; }
    public bool isJumping { get; private set; }
    public bool isRunning { get; private set; }
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
        Vector3 cameraZ = Vector3.ProjectOnPlane(cameraCharacter.transform.forward, Vector3.up);
        Vector3 cameraX = Vector3.ProjectOnPlane(cameraCharacter.transform.right, Vector3.up);
        newDirection = (inputAxis.z * cameraZ) + (inputAxis.x * cameraX);
        if (newDirection.sqrMagnitude > 0.2f)
        { 
            if(inputAxis.z <0)
            { 
                Quaternion direction = Quaternion.LookRotation(cameraZ, Vector3.up);
                transformCharacter.rotation = Quaternion.Lerp(transformCharacter.rotation, direction, speedMove * Time.deltaTime);
                rbCharacter.MovePosition(rbCharacter.position - cameraZ * speedMove * Time.deltaTime);
            }
            else
            {
                Quaternion direction = Quaternion.LookRotation(newDirection, Vector3.up);
                transformCharacter.rotation = Quaternion.Lerp(transformCharacter.rotation, direction, speedMove * Time.deltaTime);
                rbCharacter.MovePosition(rbCharacter.position + newDirection * speedMove * Time.deltaTime);
            }
        } 
    }
     
    public void Jumping()
    {
        if (isJumping && isCollision)
        { 
            rbCharacter.AddForce(Vector3.up * jumpForce, ForceMode.Impulse);  
        }
    } 
    public void SwitchMove()
    {   
        if(inputAxis.z < 0)
        {
            speedMove = isRunning ? speedRunBack : speedWalkBack;
        }
        else
        {
            speedMove = isRunning ? speedRunForward : speedWalkForward; 
        } 
    }

    public void GetAxisMove(Vector2 axis)
    {
        inputAxis = new Vector3(axis.x, 0, axis.y);
    }
    public void GetKeyDownJump(bool isKeyDown)
    {
        isJumping = isKeyDown;
    }
    public void GetKeyRun(bool isKey)
    {
        isRunning = isKey;
    }
     
    private void OnCollisionStay(Collision collision)
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
