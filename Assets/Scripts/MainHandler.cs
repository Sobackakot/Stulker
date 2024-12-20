 
using Zenject;

public class MainHandler : ITickable, ILateTickable, IFixedTickable 
{   
    public MainHandler(CameraController camera, MoveController character, AnimatorController animator)
    {   
        this.character = character;
        this.animator = animator;
        this.camera = camera;
    }
    private CameraController camera;
    private MoveController character;
    private AnimatorController animator; 

    public void Tick()
    {
        camera.Tickable_();
        animator.Tick_();
    }
    public void LateTick()
    {   
        camera.LateTick_();
        character.LateTick_();
        animator.LateTick_();
    }
    public void FixedTick()
    {
        camera.FixedTick_();
        character.FixedTick_(); 
    } 
}
