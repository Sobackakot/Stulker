 
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
    public float miniWidth = 0.5f;

    public string nameTriggerAnim = "";
    public string nameStateAnim = "";

    public bool GetHeightObstacle(float height, float width)
    { 
        if (height <= miniHeight && height >= maxMiniHeight && width >= miniWidth)
        {
            climbType = ClimbType.miniClimb;
            nameTriggerAnim = "isClimbingMini";
            nameStateAnim = "ClimbingMini";
            avatarTarget = AvatarTarget.RightFoot;
            startTime = 0.50f;
            targetTime = 0.62f;
            Input.GetAxis("Mouse X");
            return true; 
        }
        else if (height <= midleHeight && height > miniHeight && width < miniWidth)
        {
            climbType = ClimbType.climbingUpDown;
            nameTriggerAnim = "isClimbingUpDown";
            nameStateAnim = "ClimbingUp";
            avatarTarget = AvatarTarget.RightHand;
            startTime = 0.67f;
            targetTime = 0.78f;
            return true;
        }
        else if (height <= maxHeight && height > midleHeight && width >= miniWidth)
        {
            climbType = ClimbType.maxClimb;
            nameTriggerAnim = "isClimbingFulle";
            nameStateAnim = "StartClimbing";
            avatarTarget = AvatarTarget.RightHand;
            startTime = 0.29f;
            targetTime = 0.52f; 
            return true;
        }
        else return false;
    }
}
public enum ClimbType
{
    miniClimb,
    climbingUpDown,
    maxClimb
}
