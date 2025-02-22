
using UnityEngine;
using Zenject;

public class RaycastCamera : MonoBehaviour
{
    [SerializeField] private Transform targetAiming;
    [SerializeField] private float  aimPointSpeed = 45f;
    [SerializeField] private Vector3 offsetPointRayFor = new Vector3(0,0.25f,0);
    [SerializeField] private Vector3 offsetPointRayDown = new Vector3(0,6,0.6f);

    private Transform pointRay;
    private Transform charTransPointRay; 
    [SerializeField] private float maxRayInteract = 4f;
    [SerializeField] private float maxRayForwardParcoure = 0.8f;
    [SerializeField] private float maxRayHeightParcoure = 6f;
    private float maxRayAiming = 1000f;
     
    public LayerMask layerMaskBox;
    public LayerMask layerMaskTake;
    public LayerMask ignorLayerMask;
    public LayerMask climbLayerMask;

    private Ray rayForward;
    private Ray rayDown;
    private RaycastHit hitForward;
    private RaycastHit hitDown;
     
   
    private InventoryObjectUI inventoryGameObject;
    private WeaponHandle weapon;
    private CharacterMove charact;
    private WindowUI windowUI;
    private bool isActiveInventoryBox;

    private CharacterState state;
    [Inject]
    private void Container(CharacterState state)
    { 
        this.state = state;
    }
    private void Awake()
    {
        pointRay = GetComponent<Transform>();
        inventoryGameObject = FindObjectOfType<InventoryObjectUI>();
        weapon = FindObjectOfType<WeaponHandle>();
        windowUI = FindObjectOfType<WindowUI>(); 
        charact = FindObjectOfType<CharacterMove>();
        charTransPointRay = charact.GetComponent<Transform>();
    }
    private void OnEnable()
    {
        state.OnSearcheInventoryBox += InputCharacter_OnSearcheInventoryBox;
        state.OnGetItemFromHitRay += InputCharacter_IsRaycastHitItem;
    }
    private void OnDisable()
    {
        state.OnSearcheInventoryBox -= InputCharacter_OnSearcheInventoryBox;
        state.OnGetItemFromHitRay -= InputCharacter_IsRaycastHitItem;
    }
    public void Shooting(bool isLeftButtonDown)
    {
        if (isLeftButtonDown )
        {
           
            rayForward = GeRayForward();
            if (Physics.Raycast(rayForward, out hitForward, maxRayAiming))
            {
                hitForward.rigidbody?.AddForce(-hitForward.normal * 1f, ForceMode.Impulse);
            }
        }  
    }
    public void GetPointRayAim()
    { 
        rayForward = GeRayForward();
        if (Physics.Raycast(rayForward, out hitForward, maxRayAiming, ~ignorLayerMask))
            targetAiming.position = Vector3.Lerp(targetAiming.position, hitForward.point, Time.deltaTime * aimPointSpeed);
        else
            targetAiming.position = Vector3.Lerp(targetAiming.position, rayForward.GetPoint(1000), Time.deltaTime * aimPointSpeed);
    }
    public void RayHitTakeItemInteract()
    {
        rayForward = GeRayForward(); 
        if (Physics.Raycast(rayForward, out hitForward, maxRayInteract, layerMaskTake.value))
        { 
            state.SetStateHitToItem(true);
            state.SetStateHitToInventory(false);
            windowUI.SetInteractText("Take (F)"); 
        }
        else RayHitInventoryBoxInteract();
    }
    private void RayHitInventoryBoxInteract()
    {
        rayForward = GeRayForward();
        if (Physics.Raycast(rayForward, out hitForward, maxRayInteract, layerMaskBox.value))
        {
            state.SetStateHitToItem(false);
            state.SetStateHitToInventory(true);
            windowUI.SetInteractText("Search (F)");
        }
        else
        {
            state.SetStateHitToItem(false);
            state.SetStateHitToInventory(false);
            windowUI.SetInteractText(" ");
        }
            
    } 
    public void InputCharacter_OnSearcheInventoryBox(bool isActive)
    {
        rayForward = GeRayForward();
        isActiveInventoryBox = isActive;
        if (Physics.Raycast(rayForward, out hitForward, maxRayInteract))
        {
            InventoryBoxGameObject box = hitForward.collider.transform.GetComponent<InventoryBoxGameObject>(); 
            box?.OnActiveInventoryBox(isActiveInventoryBox);
            inventoryGameObject.SetActiveInventory(isActiveInventoryBox);
        } 
    }
    public bool InputCharacter_IsRaycastHitItem()
    {
        rayForward = GeRayForward();
        if (Physics.Raycast(rayForward, out hitForward, maxRayInteract))
        {
            PickUpItems pickUpItem = hitForward.collider.transform.GetComponent<PickUpItems>();
            bool isWeapon = pickUpItem.IsWeapon();
            if (PickUpWeapon(isWeapon, hitForward)) return true; 
            Interactable interact = hitForward.collider.transform.GetComponent<Interactable>();
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
    public bool SetRayHitParcour(out RaycastHit hitForward,out RaycastHit hitDown)
    {
        bool isHitForward = RayForward(charTransPointRay, offsetPointRayFor);
        bool isHitDown = RayDown(this.hitForward, isHitForward); 
        state.SetStateHitToObstacle(isHitDown);
        if (isHitDown)
        {
            hitForward = this.hitForward;
            hitDown = this.hitDown;
        }
        else
        {
            hitForward = default;
            hitDown = default;
        }
        return isHitDown; 
    }
   
    private bool RayForward(Transform charTrans, Vector3 offset)
    {  
        rayForward = new Ray(charTrans.position + offset, charTrans.forward);
        return Physics.Raycast(rayForward, out hitForward, maxRayForwardParcoure, climbLayerMask);  
    }
    private bool RayDown(RaycastHit hit, bool isHitForward)
    {
        if (!isHitForward) return false; 
        rayDown = new Ray(hit.point + (Vector3.up * maxRayHeightParcoure), Vector3.down);
        return Physics.Raycast(rayDown, out hitDown, maxRayHeightParcoure, climbLayerMask);  
    }
    private bool RayDownCheckWidth(Transform charTrans, bool isHitDown)
    {
        if (!isHitDown) return false;
        Ray rayDown = new Ray(charTrans.position + (charTrans.position.z * new Vector3(0,6,0.6f)), -charTrans.up);
        return Physics.Raycast(rayDown, out RaycastHit hitDown, maxRayHeightParcoure, climbLayerMask);  
    }
    
    private Ray GeRayForward()
    {
        return new Ray(pointRay.position, pointRay.forward);
    }

}

