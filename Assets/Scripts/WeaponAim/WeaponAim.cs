 
using UnityEngine;

public class WeaponAim : MonoBehaviour
{
    private Transform trWeapon;
    private Vector3 localEuler;
    private float angle = 25f;
    private void Awake()
    {
        trWeapon = transform.GetComponent<Transform>(); 
    }
    public void SetWeaponAim(Vector3 hitPoint)
    {   
        Vector3 direction = (hitPoint - trWeapon.position).normalized;
        trWeapon.forward = Vector3.Lerp(trWeapon.forward, direction, Time.deltaTime *angle);
        ClampWeaponRotation();
    }
    private void ClampWeaponRotation() 
    {
        localEuler = trWeapon.localEulerAngles;
        localEuler.y = Mathf.Clamp(localEuler.y, localEuler.y - angle, localEuler.y + angle);  
        trWeapon.localEulerAngles =new Vector3(localEuler.x, localEuler.y, localEuler.z);
    }
}
