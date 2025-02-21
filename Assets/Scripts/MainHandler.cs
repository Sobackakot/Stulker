 
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
        animator.Tick_();
        camera.Tick_Camera();
    }
    public void LateTick()
    {    
        character.LateTick_();
        animator.LateTick_();
        camera.LateTick_Camera();
    }
    public void FixedTick()
    { 
        character.FixedTick_();
        animator.FixedTick_();
        camera.FixedTick_Camera();
    } 
}
