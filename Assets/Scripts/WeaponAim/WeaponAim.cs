 
using UnityEngine;

public class WeaponAim : MonoBehaviour
{
    private Transform trWeapon;
    private float angle = 25f; 
    private void Awake()
    {
        trWeapon = transform.GetComponent<Transform>(); 
    }
    public void SetWeaponAim(Vector3 hitPoint, bool isAim)
    {
        if(isAim)
        { 
            trWeapon.right = (hitPoint - trWeapon.position).normalized; 
        } 
    }
}
