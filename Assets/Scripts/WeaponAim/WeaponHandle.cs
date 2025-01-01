using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class WeaponHandle : MonoBehaviour
{
    private Transform trWeapon;
    private void Awake()
    {
        trWeapon = transform.GetComponent<Transform>();
    }
    public void SetWeapon(GameObject weapon)
    {
        // Instantiate weapon as a child of trWeapon
        GameObject newWeapon = Instantiate(weapon, trWeapon);

        // Reset local position and rotation
        newWeapon.transform.localPosition = Vector3.zero;
        newWeapon.transform.localRotation = Quaternion.identity;
        newWeapon.transform.GetComponent<Rigidbody>().isKinematic = true;
        newWeapon.transform.GetComponent<Collider>().enabled = false;
    }
}
