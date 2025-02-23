
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
        if (handlerState.stateWeapon.isAim)
        {
            bool isNextTime = particles.PlayParticleShooting(handlerState.stateWeapon.isFire);
            if (isNextTime)
            {
                audios.PlayAudioShooting(handlerState.stateWeapon.isFire);
                lights.TurnOnLightShooting(handlerState.stateWeapon.isFire);
            }
        } 
    }

    public void FixedTick()
    {
        if (handlerState.stateWeapon.isAim)
           lights.TurnOfLightShooting(handlerState.stateWeapon.isFire);
    }
}
