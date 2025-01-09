 
using UnityEngine;
using Zenject;

public class RaycastCamera : MonoBehaviour
{
    [SerializeField] private Transform targetAiming;
    [SerializeField] private float  aimPointSpeed = 45f;

    private Transform pointRay;
    [SerializeField] private float maxRayInteract = 2f;
    private float maxRayAiming = 1000f;
     
    public LayerMask layerMaskBox;
    public LayerMask layerMaskTake;
    public LayerMask ignorLayerMask;
    public LayerMask climbLayerMask;

    private Ray ray;
    private RaycastHit hit;
     
   
    private InventoryPersonGameObject inventoryGameObject;
    private WeaponHandle weapon;
    private WindowUI windowUI;
    private bool isActiveInventoryBox;

    private CharacterState state;
    [Inject]
    private void Container(InputCharacter input, CharacterState state)
    { 
        this.state = state;
    }
    private void Awake()
    {
        pointRay = GetComponent<Transform>();
        inventoryGameObject = FindObjectOfType<InventoryPersonGameObject>();
        weapon = FindObjectOfType<WeaponHandle>();
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
    public bool CharacterState_OnPickUpItem()
    {
        ray = GetUpdateRay();
        if (Physics.Raycast(ray, out hit, maxRayInteract))
        {
            PickUpItems pickUpItem = hit.collider.transform.GetComponent<PickUpItems>();
            bool isWeapon = pickUpItem.IsWeapon();
            if (PickUpWeapon(isWeapon, hit)) return true; 
            Interactable interact = hit.collider.transform.GetComponent<Interactable>();
            interact?.Interaction();
        }
        return false; 
    }
    public bool PickUpWeapon(bool isWeapon, RaycastHit hit)
    {
        if (isWeapon)
            return weapon.SetWeapon(hit.collider.gameObject);
        else return false;
    } 
    public bool GetDataObstacle(out Vector3 pointRay, out Vector3 scale, out ObstacleData data)
    {
        ray = GetUpdateRay();
        if (Physics.Raycast(ray, out hit, maxRayInteract, climbLayerMask))
        {
            pointRay = hit.collider.transform.position;
            scale = hit.collider.transform.localScale; 
            data = hit.collider.GetComponent<Obstacle>().data; 
            return true;
        }
        else
        {
            pointRay = Vector3.zero;
            scale = Vector3.zero; 
            data = null; 
            return false;
        } 
    }
    private Ray GetUpdateRay()
    {
        return new Ray(pointRay.position, pointRay.forward);
    }
}
