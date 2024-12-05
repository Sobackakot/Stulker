
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
        bool isNextTime = particles.PlayParticleShooting(state.isKeyDownMouseLeft);
        if (isNextTime)
        {
            audios.PlayAudioShooting(state.isKeyDownMouseLeft);
            lights.TurnOnLightShooting(state.isKeyDownMouseLeft);
        } 
    }

    public void FixedTick()
    {
        lights.TurnOfLightShooting(state.isKeyDownMouseLeft);
    }
}
