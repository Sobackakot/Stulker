
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;
using Zenject.SpaceFighter;

public class Cell : MonoBehaviour, IPointerClickHandler
{
    private ListCast list; 
    public Image image;
    public ItemDataCast item;
    public short index;
    private void Awake()
    {
        image = GetComponent<Image>(); 
    }
    private void Start()
    {
        list = GetComponentInParent<ListCast>();
    } 
    public void OnPointerClick(PointerEventData eventData)
    {
        if (eventData.button == PointerEventData.InputButton.Left)
        {
            list.AddItem(item, index);
            Debug.Log("left");
        }
        else if (eventData.button == PointerEventData.InputButton.Right)
        {
            list.RemoveItem(index);
            Debug.Log("rigt");
        }
    } 
}
