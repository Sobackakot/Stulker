 
using UnityEngine;

public class WeaponAim : MonoBehaviour
{
    private Transform trWeapon;
    private void Awake()
    {
        trWeapon = transform.GetComponent<Transform>();
    }
    public void SetWeaponAim(Vector3 hitPoint)
    {
        Vector3 direction =  (hitPoint - trWeapon.position).normalized;
        trWeapon.forward = direction;
    }
}
