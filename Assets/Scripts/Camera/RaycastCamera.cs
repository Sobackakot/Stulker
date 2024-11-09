 
using UnityEngine;
using Zenject;

public class RaycastCamera : MonoBehaviour
{  
    private Transform point;
    private float maxRayDistance = 3f;
     
    public LayerMask layerMaskBox;
    public LayerMask layerMaskTake;
     
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
    private void OnInteractButton(bool isActive)
    {
        isActiveInventoryBox = isActive;    
        Ray ray = new Ray(point.position, point.forward);
        RaycastHit hit;
        if (Physics.Raycast(ray, out hit, maxRayDistance))
        {
            SearcheBox(hit);
            TakeItem(hit); 
        }
    } 
    private void SearcheBox(RaycastHit hit)
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
    private void TakeItem(RaycastHit hit)
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
    public void RayHitTakeInteract()
    {
        Ray ray = new Ray(point.position, point.forward);
        RaycastHit hit;
        if (Physics.Raycast(ray, out hit, maxRayDistance, layerMaskTake.value))
        {
            windowUI.SetInteractText("Take (F)"); 
        }
        else RayHitBoxInteract();
    }
    private void RayHitBoxInteract()
    {
        Ray ray = new Ray(point.position, point.forward);
        RaycastHit hit;
        if (Physics.Raycast(ray, out hit, maxRayDistance, layerMaskBox.value))
        {
            windowUI.SetInteractText("Search (F)");
        }
        else
        { 
            windowUI.SetInteractText(" "); 
        }
    }
}
