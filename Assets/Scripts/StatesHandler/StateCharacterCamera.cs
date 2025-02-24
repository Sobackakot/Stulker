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
     
    public Vector3 inputAxis { get; private set; }
    public float currentAngle { get; private set; }
    public bool isFerst { get; set; }
    public bool isStopingRotate { get; private set; }
    public bool isMaxAngle { get; private set; }

    public void SetInputAxisCamera(Vector2 inputAxis)
    {
        this.inputAxis = new Vector3(inputAxis.x, 0, inputAxis.y);
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
