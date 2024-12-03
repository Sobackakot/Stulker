 
using UnityEngine; 

public class Bullet : MonoBehaviour
{
    private Transform bulletTransform;
    private float speedMove;
    private float distanceMove;
    private Vector3 startPoint;
    private void Awake()
    {
        bulletTransform = GetComponent<Transform>();
        startPoint = transform.position;
    } 
    public bool MoveBullet()
    {
        bulletTransform.position += bulletTransform.forward * speedMove * Time.deltaTime;
        float distance = Vector3.Distance(startPoint, bulletTransform.position);
        if (distance >= distanceMove)
        {
            return true;
        }
        else return false;
    }
    public void InitializeBullet(float speedMove, float distanceMove)
    {
        this.speedMove = speedMove;
        this.distanceMove = distanceMove;
    }
}
