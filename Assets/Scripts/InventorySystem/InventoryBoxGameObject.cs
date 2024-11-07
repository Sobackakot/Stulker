 
using UnityEngine;

public class InventoryBoxGameObject : MonoBehaviour
{
    public bool isActiveInventoryBox { get; private set; }
    private void Start()
    {
        gameObject.SetActive(false);
    }
    private void OnEnable()
    {
        isActiveInventoryBox = true;
    }
    private void OnDisable()
    {
        isActiveInventoryBox = false;
    }
}
