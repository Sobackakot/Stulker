using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SimpleList : MonoBehaviour
{
    private List<Cell> cells = new List<Cell>();

    private void Awake()
    {
        cells.AddRange(FindObjectsOfType<Cell>());
        for (short i = 0; i < cells.Count; i++)
        {
            cells[i].index = i;
        }

    }

    public void AddItem(Color color, short index)
    {
        cells[index].image.color = color;
    }
    public void RemoveItem(short index)
    {
        cells[index].image.color = Color.white;
        
    }
}
