
using TMPro;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;
using Zenject;

public class ItemInSlot : MonoBehaviour, IDragHandler, IBeginDragHandler, IEndDragHandler, IPointerClickHandler
{
    public int slotIndex {  get; set; }
    public ItemScrObj dataItem { get; private set;}
     
    private RectTransform pickItemTransform;
    private Transform originalParent;
    private CanvasGroup canvasGroup;
    private Canvas canvas;
    public InventorySlot originalSlot {  get; private set; }

    private Image itemIcon;
    private TextMeshProUGUI itemAmount;
    private EquipmentController equipmentController;
    private IInventoryUI inventoryUI;

    [Inject]
    private void Container(EquipmentController equipmenrt, [Inject(Id = "inventoryUI")]IInventoryUI inventoryUI)
    {
        equipmentController = equipmenrt;
        this.inventoryUI = inventoryUI;
    }

    private void Awake()
    {   
        originalParent = GetComponent<Transform>();  //transform parent object
        pickItemTransform = GetComponent<RectTransform>();//current position of the item
        canvasGroup = GetComponent<CanvasGroup>();
        canvas = pickItemTransform.GetComponentInParent<Canvas>(); //UI canvas with inventoryController

        itemIcon = GetComponent<Image>(); //image of the current item 
        itemAmount = pickItemTransform.GetChild(0).GetComponent<TextMeshProUGUI>(); //amount of current item
    }
    public virtual void SetItem(ItemScrObj newItem) // coll from InventorySlot
    {
        if (newItem == null) return;
        dataItem = newItem;
        itemAmount.text = dataItem.item.itemAmount.ToString();
        itemIcon.sprite = dataItem.IconItem;
        itemIcon.enabled = true;
    }
    public virtual void CleareItem() // coll from InventorySlot
    {
        dataItem = null;
        itemIcon.sprite = null;
        itemIcon.enabled = false;
        itemAmount.text = " "; 
    }
    public virtual void OnBeginDrag(PointerEventData eventData)
    {   
        canvasGroup.blocksRaycasts = false;
        canvasGroup.alpha = 0.6f;
        originalParent = transform.parent; //save the parent object of the item 
        originalSlot = transform.GetComponentInParent<InventorySlot>();

        pickItemTransform.SetParent(canvas.transform); //changing the parent object of an item
        pickItemTransform.SetAsLastSibling(); //sets item display priority  
    }
    public virtual void OnDrag(PointerEventData eventData) //moves an item to the mouse cursor position
    {
        pickItemTransform.anchoredPosition += eventData.delta / canvas.scaleFactor; 
    }
    public virtual void OnEndDrag(PointerEventData eventData)
    {
        canvasGroup.blocksRaycasts = true;
        canvasGroup.alpha = 1f; 
        pickItemTransform.SetParent(originalParent); //returns the item to the original position of the parent object   
        originalSlot = transform.GetComponentInParent<InventorySlot>();
    }
    public virtual void OnPointerClick(PointerEventData eventData)
    {
        if (eventData.button == PointerEventData.InputButton.Left)
        {
            UseItem();
        }
    } 
    private void UseItem()
    {
        if (dataItem.itemType != EquipItems.None && dataItem != null)
        {
            ItemScrObj oldItem = null;
            equipmentController.EquipingItem(dataItem,out oldItem);
            if (oldItem != null)
            {
                SetItem(oldItem); 
            }
            else
            {
                CleareItem(); 
            }
        }
    }
}
