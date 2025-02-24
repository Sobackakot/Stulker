using StateGame;
using System;
using UnityEngine;

public class StateCharacterCamera : StateGameBase
{
    public StateCharacterCamera(StateGameHandler stateGameHandler) : base(stateGameHandler)
    {
    }

    public override void EnterState()
    {
        EventBus.Subscribe<CameraSwitchEvent>(InputCamera_OnSwitchCamera);
        EventBus.Subscribe<CameraInputEvent>(InputCamera_OnInputAxisCamera);

    }

    public override void ExitState()
    {
        EventBus.Unsubscribe<CameraSwitchEvent>(InputCamera_OnSwitchCamera);
        EventBus.Unsubscribe<CameraInputEvent>(InputCamera_OnInputAxisCamera);
    }

    public override void UpdatState()
    { 
    }
    public event Action<Vector2> OnInputAxis;
    public Vector3 inputAxis;
    public float currentAngle { get; private set; }
    public bool isFerst { get; set; }
    public bool isStopingRotate { get; private set; }
    public bool isMaxAngle { get; private set; }

    public void InputCamera_OnInputAxisCamera(CameraInputEvent inputAxis)
    {
        this.inputAxis = new Vector3(inputAxis.InputAxis.x, 0, inputAxis.InputAxis.y);
        OnInputAxis?.Invoke(inputAxis.InputAxis);
    }
    public void SetAngleForCamera(float angle)
    {
        currentAngle = angle;
    }
    public void SetStateCameraAngle(bool isAngleMax)
    {
        isMaxAngle = isAngleMax;
    }
    public void SetStateRotateCamera(bool isActiveInventory)
    { 
        isStopingRotate = isActiveInventory ? false : true;
    }
    public void InputCamera_OnSwitchCamera(CameraSwitchEvent a)
    {
        isFerst = !isFerst;
        a.IsFirstPerson = isFerst;
    }   
}
