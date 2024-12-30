
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
     
    private CharacterState state;
    private InventoryPersonGameObject inventoryGameObject;
    private WindowUI windowUI;
    private bool isActiveInventoryBox;

    [Inject]
    private void Container(InputCharacter input, CharacterState state)
    { 
        this.state = state;
    }
    private void Awake()
    {
        point = GetComponent<Transform>();
        inventoryGameObject = FindObjectOfType<InventoryPersonGameObject>();
        windowUI = FindObjectOfType<WindowUI>(); 
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
    public void GetPointRayAim()
    { 
        ray = GetUpdateRay();
        if (Physics.Raycast(ray, out hit, maxRayAiming, ~ignorLayerMask))
            targetAiming.position = Vector3.Lerp(targetAiming.position, hit.point, Time.deltaTime * aimPointSpeed);
        else
            targetAiming.position = Vector3.Lerp(targetAiming.position, ray.GetPoint(1000), Time.deltaTime * aimPointSpeed);
    }
    public void RayHitTakeItemInteract()
    {
        ray = GetUpdateRay(); 
        if (Physics.Raycast(ray, out hit, maxRayInteract, layerMaskTake.value))
        {
            state.UpdateStateRayHitToItem(true);
            state.UpdateStateRayHitToInventory(false);
            windowUI.SetInteractText("Take (F)"); 
        }
        else RayHitInventoryBoxInteract();
    }
    private void RayHitInventoryBoxInteract()
    {
        ray = GetUpdateRay();
        if (Physics.Raycast(ray, out hit, maxRayInteract, layerMaskBox.value))
        {
            state.UpdateStateRayHitToItem(false);
            state.UpdateStateRayHitToInventory(true);
            windowUI.SetInteractText("Search (F)");
        }
        else
        {
            state.UpdateStateRayHitToItem(false);
            state.UpdateStateRayHitToInventory(false);
            windowUI.SetInteractText(" ");
        }
            
    } 
    public void CharacterState_OnSearcheInventoryBox(bool isActive)
    {
        ray = GetUpdateRay();
        isActiveInventoryBox = isActive;
        if (Physics.Raycast(ray, out hit, maxRayInteract))
        {
            InventoryBoxTrigger box = hit.collider.transform.GetComponent<InventoryBoxTrigger>();
            box?.OnActiveInventoryBox(isActiveInventoryBox);
            inventoryGameObject.SetActiveInventory(isActiveInventoryBox);
        } 
    }
    public void CharacterState_OnPickUpItem()
    {
        ray = GetUpdateRay(); 
        if (Physics.Raycast(ray, out hit, maxRayInteract))
        {
            Interactable interact = hit.collider.transform.GetComponent<Interactable>();
            interact?.Interaction();
        } 
    }
    
    private Ray GetUpdateRay()
    {
        return new Ray(point.position, point.forward);
    }
}
