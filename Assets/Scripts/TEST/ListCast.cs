 
using System.Collections.Generic; 
using UnityEngine; 

public class ListCast : MonoBehaviour 
{   
    private List<Cell>  cells = new List<Cell>();
    private List<ItemDataCast> itemData = new List<ItemDataCast>();

    private void Awake()
    {
        cells.AddRange(FindObjectsOfType<Cell>(true));
        for(short i =0; i< cells.Count; i++ )
        {
            itemData.Add(null);
            cells[i].index = i;
        }
        
    }
    private void Update()
    {
        ShowCells();
    }
    private void ShowCells()
    {
        for(short i =0; i< cells.Count; i++)
        {
            if (itemData[i] != null)
            {
                cells[i].image.sprite = itemData[i].image; 
            }
            else
            {
                cells[i].image.sprite = null;
            }
        }
    }
    public void AddItem(ItemDataCast item, short index)
    {
        itemData[index] = item; 
    }
    public void RemoveItem(short index)
    {
        itemData[index] = null;
    }  
}
