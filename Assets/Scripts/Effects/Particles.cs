 
using UnityEngine;

public class Particles : MonoBehaviour
{
    [SerializeField] private ParticleSystem fireEffect;
    [SerializeField] private ParticleSystem fireEffect2;
    [SerializeField] private ParticleSystem bulletEffect;

    [SerializeField] private float divideTime;

    private float nextTime;
    private float intervalTime = 1;
    public bool PlayParticleShooting(bool isKeyDownLeft)
    {
        if (isKeyDownLeft && Time.time > nextTime)
        {
            nextTime = Time.time + intervalTime / divideTime;
            fireEffect.Play();
            fireEffect2.Play();
            bulletEffect.Play();
            return true;
        }
        else return false;
    }
}
