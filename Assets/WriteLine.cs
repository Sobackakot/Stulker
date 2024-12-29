
using UnityEngine;

public class WriteLine : MonoBehaviour
{
    [SerializeField] private Transform target;
    [SerializeField] private Transform handRight; 

    private void LateUpdate()
    {
        handRight.position = target.position;
        handRight.rotation = target.rotation;
    }

}
