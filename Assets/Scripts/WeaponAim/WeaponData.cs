 
using UnityEngine;

[CreateAssetMenu(fileName = "weapon", menuName = "Wepons")]
public class WeaponData : ScriptableObject
{
    public string weaponName = "animation name";

    [Header("Ready for battle slot")]
    public Vector3 readyPos;
    public Vector3 readyRot;
      
    [Header("Right hand target slot")]
    public Vector3 rightHandPos;
    public Vector3 rightHandRop;

    public Vector3 rightHimPos;

    [Header("Left hand target slot")]
    public Vector3 leftHandPos;
    public Vector3 leftHandRot;

    public Vector3 leftHimPos;
    
}
