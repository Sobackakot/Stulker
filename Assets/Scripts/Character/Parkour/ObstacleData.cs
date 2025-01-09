 
using UnityEngine;

[CreateAssetMenu(fileName = "new Obstacle", menuName = "Obstacle")]
public class ObstacleData : ScriptableObject
{ 
    public AvatarTarget avatarTarget;
    public ClimbType climbType;

    public float startTime;
    public float targetTime;
    public float maxHeight = 2.6f;
    public float midleHeight = 2f;
    public float miniHeight = 1.0f;
    public string nameTriggerAnim = "";
    public string nameStateAnim = "";

    public bool GetHeightObstacle(float height)
    {
        if (height <= miniHeight)
        {
            climbType = ClimbType.miniClimb;
            nameTriggerAnim = "isClimbingMini";
            nameStateAnim = "ClimbingMini";
            avatarTarget = AvatarTarget.RightFoot;
            startTime = 0.50f;
            targetTime = 0.62f;
            return true; 
        }
        else if (height <= midleHeight)
        {
            climbType = ClimbType.midleClimb;
            nameTriggerAnim = "isClimbingMidle";
            nameStateAnim = "ClimbingMidle";
            avatarTarget = AvatarTarget.RightHand;
            startTime = 0.37f;
            targetTime = 0.64f;
            return true;
        }
        else if (height <= maxHeight)
        {
            climbType = ClimbType.maxClimb;
            nameTriggerAnim = "isClimbingFulle";
            nameStateAnim = "StartClimbing";
            avatarTarget = AvatarTarget.RightHand;
            startTime = 0.62f;
            targetTime = 0.74f;
            return true;
        }
        else return false;
    }
}
public enum ClimbType
{
    miniClimb,
    midleClimb,
    maxClimb
}
