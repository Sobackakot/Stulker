using StateGame;
using UnityEngine;

public class StateCharacterCamera : StateGameBase
{
    public StateCharacterCamera(StateGameHandler stateGameHandler) : base(stateGameHandler)
    {
    }

    public override void EnterState()
    {
        EventBus.Subscribe<CameraSwitchEvent>(InputCamera_OnSwitchCamera); 
    }

    public override void ExitState()
    {
        EventBus.Unsubscribe<CameraSwitchEvent>(InputCamera_OnSwitchCamera); 
    }

    public override void UpdatState()
    { 
    }   
     
    public Vector3 inputAxisCamera { get; private set; }
    public float currentAngleCamera { get; private set; }
    public bool isFerstCamera { get; set; }
    public bool isStopingRotate { get; private set; }
    public bool isMaxAngleCamera { get; private set; }

    public void SetInputAxisCamera(Vector2 inputAxis)
    {
        inputAxisCamera = new Vector3(inputAxis.x, 0, inputAxis.y);
    }
    public void SetAngleForCamera(float angle)
    {
        currentAngleCamera = angle;
    }
    public void SetStateCameraAngle(bool isAngleMax)
    {
        isMaxAngleCamera = isAngleMax;
    }
    public void SetStateRotateCamera(bool isRotate)
    {
        isStopingRotate = isRotate;
    }
    public void InputCamera_OnSwitchCamera(CameraSwitchEvent a)
    {
        isFerstCamera = !isFerstCamera;
        a.IsFirstPerson = isFerstCamera;
    }   
}
