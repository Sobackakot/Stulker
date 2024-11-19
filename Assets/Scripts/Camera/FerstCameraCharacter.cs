using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class FerstCameraCharacter : MonoBehaviour
{
    [SerializeField] private Transform transformCharacter;
    [HideInInspector] public Transform transformCamera;

    [SerializeField] private float sensitivityMouse = 45f;

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
    private void LateUpdate()
    {
        GetInputAxisMouse();
        RotateCamera();
    }
    public virtual void RotateCamera()
    { 
        mouseAxisY = Mathf.Clamp(mouseAxisY, minAngle, maxAngle);
        transformCamera.localEulerAngles = new Vector3(mouseAxisY, mouseAxisX, 0);
        transformCamera.position = transformCamera.localRotation * offset + transformCharacter.position;
    }
    public virtual void GetInputAxisMouse()
    {
        mouseAxisX += Input.GetAxis("Mouse X") * sensitivityMouse * Time.deltaTime;
        mouseAxisY -= Input.GetAxis("Mouse Y") * sensitivityMouse * Time.deltaTime;
    }
}
