
using UnityEngine;

public class WriteLine : MonoBehaviour
{
    [SerializeField] private Transform target;
    [SerializeField] private Transform handRight;

    [SerializeField] private bool isLocal = false;
    private Vector3 localPos;
    private Vector3 localRot;
  

    private void LateUpdate()
    {
        if (!isLocal)
        {
            handRight.position = target.position;
            handRight.rotation = target.rotation;
        }
        else
        { 
                localPos = target.localPosition;
            handRight.localPosition = localPos; 
                localRot = target.localEulerAngles;
            handRight.localEulerAngles = localRot;
        }
        
    }

}
