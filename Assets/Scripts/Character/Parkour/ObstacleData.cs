 
using UnityEngine;

[CreateAssetMenu(fileName = "new Obstacle", menuName = "Obstacle")]
public class ObstacleData : ScriptableObject
{ 
    public AvatarTarget avatarTarget;
    public ClimbType climbType;

    public float startTime;
    public float targetTime;
    
    public float maxHeight = 3f;
    public float midleHeight = 2f;
    public float miniHeight = 1.5f; 
    public float maxMiniHeight = 1f;
    public float miniWidth = 1f;

    public string nameTriggerAnim = "";
    public string nameStateAnim = "";

    public bool SetHeightObstacle(float height, float width, bool isRun)
    { 
        if(height <= miniHeight && height >= maxMiniHeight && width <= miniWidth && isRun)
        {
            climbType = ClimbType.JumpClimb;
            nameTriggerAnim = "isJumpOverClimb";
            nameStateAnim = "JumpOverClimb";
            avatarTarget = AvatarTarget.LeftHand;
            startTime = 0.20f;
            targetTime = 0.43f;
            return true;
        }
        else if (height <= miniHeight && height >= maxMiniHeight && width >= miniWidth)
        {
            climbType = ClimbType.MiniClimb;
            nameTriggerAnim = "isClimbingMini";
            nameStateAnim = "ClimbingMini";
            avatarTarget = AvatarTarget.RightFoot;
            startTime = 0.30f;
            targetTime = 0.70f; 
            return true; 
        }
        else if (height <= midleHeight && height > miniHeight && width >= miniWidth)
        {
            climbType = ClimbType.ClimbingUpDown;
            nameTriggerAnim = "isClimbingUpStand";
            nameStateAnim = "ClimbingUp";
            avatarTarget = AvatarTarget.RightHand;
            startTime = 0.29f;
            targetTime = 0.66f;
            return true;
        }
        else if (height <= maxHeight && height > midleHeight && width >= miniWidth)
        {
            climbType = ClimbType.MaxClimb;
            nameTriggerAnim = "isClimbingFulle";
            nameStateAnim = "StartClimbing";
            avatarTarget = AvatarTarget.RightHand;
            startTime = 0.3f;
            targetTime = 0.7f; 
            return true;
        }
        else return false;
    }
}
public enum ClimbType
{
    JumpClimb,
    MiniClimb,
    ClimbingUpDown,
    MaxClimb
}
