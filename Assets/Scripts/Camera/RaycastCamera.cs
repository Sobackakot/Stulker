
using System;
using UnityEngine;
using Zenject;

public class RaycastCamera : MonoBehaviour
{
    [SerializeField] private Transform targetAiming;
    [SerializeField] private AudioClip clip;
    [SerializeField] private AudioSource sorce;
    [SerializeField] private ParticleSystem fireEffect;
    [SerializeField] private ParticleSystem bulletEffect;
    private Transform point;
    private float maxRayInteract = 5f;
    private float maxRayAiming = 1000f;
    private float nexTime;
    private float intervalTime = 1;
    [SerializeField] private float divideTime;
     
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
        input.onActiveInventoryBox += OnInteractButton; 
    }
    private void OnDisable()
    {
        input.onActiveInventoryBox -= OnInteractButton; 
    } 
   
    public void Shooting(bool isKeyPressDown)
    {
        if (isKeyPressDown && Time.time > nexTime)
        {
            nexTime = Time.time + intervalTime / divideTime;
            sorce.PlayOneShot(clip);
            fireEffect.Play();
            bulletEffect.Play();
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
        {
            targetAiming.position = hit.point;
            return targetAiming.position;
        } 
        else
        {
            targetAiming.position = ray.GetPoint(1000);
            return targetAiming.position;
        }
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
