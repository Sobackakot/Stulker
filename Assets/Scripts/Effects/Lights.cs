
using UnityEngine;

public class Lights : MonoBehaviour
{
    [SerializeField] private Light lightShooting;
    private void OnEnable()
    {
        lightShooting.enabled = false;
    }

    public void TurnOnLightShooting(bool isKeyDownLeft)
    {
        if (isKeyDownLeft)
        {
            lightShooting.enabled = true; 
        }
    }
    public void TurnOfLightShooting(bool isKeyDownLeft)
    {
        if (!isKeyDownLeft)
        {
            lightShooting.enabled = false;
        }
    }

}
