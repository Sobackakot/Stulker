
using UnityEngine;
using Zenject;

public class EffectsController : ITickable, IFixedTickable
{   
    public EffectsController(Audios audios, CharacterState state, Particles particles, Lights lights)
    {
        this.audios = audios;
        this.state = state;
        this.particles = particles;
        this.lights = lights;
    }
    private Audios audios;
    private CharacterState state;
    private Particles particles;
    private Lights lights; 
     
    public void Tick()
    {
        if (state.isAim)
        {
            bool isNextTime = particles.PlayParticleShooting(state.isFire);
            if (isNextTime)
            {
                audios.PlayAudioShooting(state.isFire);
                lights.TurnOnLightShooting(state.isFire);
            }
        } 
    }

    public void FixedTick()
    {
        if (state.isAim)
            lights.TurnOfLightShooting(state.isFire);
    }
}
