 
using UnityEngine;

[CreateAssetMenu(fileName = "new Obstacle", menuName = "Obstacle")]
public class ObstacleData : ScriptableObject
{  
    public float maxHeight;
    public float minHeight;   
    public string nameStateAnim = ""; 
    public bool CheckHeightObstacle(RaycastHit hit, Transform charTrans)
    {
        float height = hit.point.y - charTrans.position.y;
        if (height > maxHeight || height < minHeight) return false;
        else return true;
    }
}
 
