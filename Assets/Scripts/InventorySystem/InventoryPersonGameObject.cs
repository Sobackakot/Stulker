using UnityEngine;
using Zenject;

public class InventoryPersonGameObject : MonoBehaviour
{ 
    private InputCharacter input;
    public bool isActivateInventoryPerson {  get; private set; } 

    [Inject]
    private void Container(InputCharacter input)
    {
        this.input = input;
    } 
    private void Start()
    {
        gameObject.SetActive(false);
    }
    private void OnEnable()
    {
        input.onActiveInventory += OnActivate;
        isActivateInventoryPerson = true;   
    }
    private void OnDisable()
    {
        isActivateInventoryPerson = false;
    }
    private void OnDestroy()
    {
        input.onActiveInventory -= OnActivate;
        isActivateInventoryPerson = false;
    }
    private void OnActivate(bool isActive)
    {
        isActivateInventoryPerson = isActive; 
    }
    public void Activate()
    { 
        gameObject.SetActive(isActivateInventoryPerson); 
    }
}
