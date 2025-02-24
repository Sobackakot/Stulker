
using Zenject;
using StateGame;

public class EffectsController : ITickable, IFixedTickable
{   
    public EffectsController(Audios audios,StateGameHandler handlerState, Particles particles, Lights lights)
    {
        this.audios = audios;
        this.handlerState = handlerState;
        this.particles = particles;
        this.lights = lights;
    }
    private Audios audios;
    private StateGameHandler handlerState;
    private Particles particles;
    private Lights lights; 
     
    public void Tick()
    {
        if (handlerState.Weapon.isAim)
        {
            bool isNextTime = particles.PlayParticleShooting(handlerState.Weapon.isFire);
            if (isNextTime)
            {
                audios.PlayAudioShooting(handlerState.Weapon.isFire);
                lights.TurnOnLightShooting(handlerState.Weapon.isFire);
            }
        } 
    }

    public void FixedTick()
    {
        if (handlerState.Weapon.isAim)
           lights.TurnOfLightShooting(handlerState.Weapon.isFire);
    }
}
