
using System;
using UnityEngine;

public class RaycastCamera : MonoBehaviour
{
    private Transform point;
    private float maxRayDistance = 3f;
    public LayerMask layerMask;

    public event Action<string> onShowNameItem;
    public event Action onPickUpItem; 

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
            //onShowNameItem?.Invoke(hit.collider.gameObject.name);
            //if(Input.GetMouseButtonDown(0))
            //{
            //    onPickUpItem?.Invoke();
            //} 
        } 
    } 
}
