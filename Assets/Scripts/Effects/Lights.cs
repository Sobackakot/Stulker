
using UnityEngine;

public class Lights : MonoBehaviour
{
    private Light lightFire;
    private void OnEnable()
    {
        lightFire = GetComponent<Light>();
        lightFire.enabled = false;
    }
    public void TurnOnLightShooting(bool isKeyDownLeft)
    {
        if (isKeyDownLeft)
        {
            lightFire.enabled = true; 
        }
    }
    public void TurnOfLightShooting(bool isKeyDownLeft)
    {
        if (!isKeyDownLeft)
        {
            lightFire.enabled = false;
        }
    }

}
