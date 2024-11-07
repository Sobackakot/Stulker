 
using UnityEngine;

public class RaycastCamera : MonoBehaviour
{
    private Transform point;
    private float maxRayDistance = 6f;
    public LayerMask layerMask;
    private void Awake()
    {
        point = GetComponent<Transform>();
    }
    private void Update()
    {
        UpdateRaycast();
    }
    public void UpdateRaycast()
    {
        Ray ray = new Ray(point.position, point.forward);
        RaycastHit hit;
        if(Physics.Raycast(ray, out hit, maxRayDistance, layerMask))
        {    
            Debug.Log(hit.collider.gameObject.name);
            float distance = Vector3.Distance(point.position, hit.point);
            Debug.DrawRay(point.position, point.forward * distance, Color.red, 3);
        } 
    } 
}
