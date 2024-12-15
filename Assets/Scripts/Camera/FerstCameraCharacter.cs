 
using UnityEngine;

public class FerstCameraCharacter : MonoBehaviour
{
    [SerializeField] private Transform transformCharacter;
    [HideInInspector] public Transform transformCamera;

    [SerializeField] private float sensitivityMouse = 45f;

    public Vector3 inputAxisMouse { get; private set; }
    private Vector3 offset;
    private float mouseAxisX;
    private float mouseAxisY;

    private float minAngle = -90f;
    private float maxAngle = 90f;

    public bool isRotateCamera { get; private set; }

    private void Awake()
    {
        transformCamera = GetComponent<Transform>();
    }
    void Start()
    {
        // Lock the mouse cursor to the game screen.
        Cursor.lockState = CursorLockMode.Locked;
        offset = transformCamera.position - transformCharacter.position;
    } 
    public void RotateCamera()
    { 
        mouseAxisY = Mathf.Clamp(mouseAxisY, minAngle, maxAngle);
        transformCamera.localEulerAngles = new Vector3(mouseAxisY, mouseAxisX, 0);
        transformCamera.position = transformCamera.localRotation * offset + transformCharacter.position;
    }
    public void GetInputAxisMouse(Vector2 inputAxis)
    {
        mouseAxisX += inputAxis.x * sensitivityMouse * Time.deltaTime;
        mouseAxisY -= inputAxis.y * sensitivityMouse * Time.deltaTime;
        if (inputAxis.sqrMagnitude > 0.2f)
            inputAxisMouse = new Vector3(inputAxis.x, 0, inputAxis.y);
        else
            inputAxisMouse = Vector3.zero;
    }
}
