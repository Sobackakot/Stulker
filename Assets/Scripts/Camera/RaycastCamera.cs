 
using UnityEngine;
using Zenject;

public class RaycastCamera : MonoBehaviour
{
    private Transform point;
    private float maxRayDistance = 3f;
    public LayerMask layerMask;

    private InputCamera input;
    [Inject]
    private void Container(InputCamera input)
    {
        this.input = input;
    }
    private void Awake()
    {
        point = GetComponent<Transform>();
    }
    private void OnEnable()
    {
        input.onLeftMouseButton += OnLeftMouseButton;
    }
    private void OnDisable()
    {
        input.onLeftMouseButton -= OnLeftMouseButton;
    }
    private void OnLeftMouseButton()
    {
        Ray ray = new Ray(point.position, point.forward);
        RaycastHit hit;
        if (Physics.Raycast(ray, out hit, maxRayDistance, layerMask))
        {
            Debug.Log(hit.collider.gameObject.name); 
            hit.collider.transform.GetComponent<Interactable>().OnMouseDownCastom();
        }
    }
}
