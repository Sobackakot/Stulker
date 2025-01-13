 
using UnityEngine;

[CreateAssetMenu(fileName = "new Obstacle", menuName = "Obstacle")]
public class ObstacleData : ScriptableObject
{  
    public float maxHeight;
    public float minHeight;   
    public string nameStateAnim = "";
    public Quaternion targetRotate {  get; private set; } 
    public bool CheckHeightObstacle(RaycastHit hitForward,RaycastHit hitDown, Transform charTrans)
    {
        float height = hitDown.point.y - charTrans.position.y;
        if (height > maxHeight || height < minHeight) return false;
        else
        { 
            targetRotate = Quaternion.LookRotation(-hitForward.normal);
            return true;
        }
    }
}
 
