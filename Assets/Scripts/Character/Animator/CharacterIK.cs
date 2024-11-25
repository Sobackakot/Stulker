 
using UnityEngine;
using UnityEngine.Animations.Rigging;

public class CharacterIK : MonoBehaviour
{
    private Rig rig;
    [SerializeField] private Transform targetPointAim;
    [SerializeField] private Transform pointFromCamera;
    private float targetWeight;
    private void Awake()
    {
        rig = GetComponent<Rig>();
    }
    public void SetWeightIK(bool isAiming)
    {
        rig.weight = Mathf.Lerp(rig.weight, targetWeight, Time.deltaTime * 10f);
        targetWeight = isAiming ? 1 : 0;
        targetPointAim.position = pointFromCamera.position;
    }
}
