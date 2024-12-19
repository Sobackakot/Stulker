
using System;
using UnityEngine;
using Zenject;

public class RaycastCamera : MonoBehaviour
{
    [SerializeField] private Transform targetAiming;
    [SerializeField] private float  aimPointSpeed = 45f;

    private Transform point;
    private float maxRayInteract = 5f;
    private float maxRayAiming = 1000f;
     
    public LayerMask layerMaskBox;
    public LayerMask layerMaskTake;
    public LayerMask ignorLayerMask;

    private Ray ray;
    private RaycastHit hit;

    private InputCharacter input;
    private InventoryPersonGameObject inventoryGameObject;
    private WindowUI windowUI;
    private bool isActiveInventoryBox;

    [Inject]
    private void Container(InputCharacter input)
    {
        this.input = input; 
    }
    private void Awake()
    {
        point = GetComponent<Transform>();
        inventoryGameObject = FindObjectOfType<InventoryPersonGameObject>();
        windowUI = FindObjectOfType<WindowUI>(); 
    } 
    private void OnEnable()
    {
        input.OnInventoryBoxToggle += OnInteractButton;
    }
    private void OnDisable()
    {
        input.OnInventoryBoxToggle -= OnInteractButton; 
    } 
   
    public void Shooting(bool isLeftButtonDown)
    {
        if (isLeftButtonDown )
        {
           
            ray = GetUpdateRay();
            if (Physics.Raycast(ray, out hit, maxRayAiming))
            {
                hit.rigidbody?.AddForce(-hit.normal * 1f, ForceMode.Impulse);
            }
        }  
    }
    public Vector3 GetPointRayAim()
    { 
        ray = GetUpdateRay();
        if (Physics.Raycast(ray, out hit, maxRayAiming, ~ignorLayerMask))
            return targetAiming.position = Vector3.Lerp(targetAiming.position, hit.point, Time.deltaTime * aimPointSpeed);
        else
            return targetAiming.position = Vector3.Lerp(targetAiming.position, ray.GetPoint(1000), Time.deltaTime * aimPointSpeed);
    }
    public void RayHitTakeItemInteract()
    {
        ray = GetUpdateRay(); 
        if (Physics.Raycast(ray, out hit, maxRayInteract, layerMaskTake.value))
        {
            windowUI.SetInteractText("Take (F)");
        }
        else RayHitInventoryBoxInteract();
    }
    private void RayHitInventoryBoxInteract()
    {
        ray = GetUpdateRay();
        if (Physics.Raycast(ray, out hit, maxRayInteract, layerMaskBox.value))
        {
            windowUI.SetInteractText("Search (F)");
        }
        else
        {
            windowUI.SetInteractText(" ");
        }
    }
    private void OnInteractButton(bool isActive)
    {
        ray = GetUpdateRay();
        isActiveInventoryBox = isActive;     
        if (Physics.Raycast(ray, out hit, maxRayInteract))
        {
            SearcheInventoryBox(hit);
            PickUpItem(hit); 
        }
    } 
    private void SearcheInventoryBox(RaycastHit hit)
    {   
        if((layerMaskBox.value & (1 << hit.collider.gameObject.layer)) != 0)
        { 
            InventoryBoxTrigger box = hit.collider.transform.GetComponent<InventoryBoxTrigger>();
            if (box != null)
            {
                box.OnActiveInventoryBox(isActiveInventoryBox);
                inventoryGameObject.SetActiveInventory(isActiveInventoryBox);
            } 
        } 
    }
    private void PickUpItem(RaycastHit hit)
    {
        if ((layerMaskTake.value & (1 << hit.collider.gameObject.layer)) != 0)
        {
            Interactable interact = hit.collider.transform.GetComponent<Interactable>();
            if (interact != null)
            {
                interact.Interaction(); 
            } 
        }      
    }
    
    private Ray GetUpdateRay()
    {
        return new Ray(point.position, point.forward);
    }
}
