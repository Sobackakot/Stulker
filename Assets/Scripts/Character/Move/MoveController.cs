
using System; 
using Zenject;

public class MoveController : IInitializable, IDisposable, ITickable, IFixedTickable, ILateTickable
{
    public MoveController(InputCharacter inputCharacter, CharacterMove character, 
        CharacterAnimator characterAnimator, CharacterParkour characterParkour, CharacterComponent components)
    {
        this.inputCharacter = inputCharacter;
        this.character = character;
        this.characterAnimator = characterAnimator;
        this.characterParkour = characterParkour;
        this.components = components; 
    }

    private InputCharacter inputCharacter;
    private CharacterMove character;
    private CharacterAnimator characterAnimator;
    private CharacterParkour characterParkour;
    private CharacterComponent components; 

    private bool isMoving;
    private bool isStateParcure;
    public void Initialize()
    { 
        inputCharacter.onInputGetAxis += character.InputCharacter_OnAxisMove;
        inputCharacter.onGetKeyDownJump += character.InputCharacter_OnKeyDownJump;
        inputCharacter.onGetKeyRun += character.InputCharacter_OnKeyRun;
        inputCharacter.onGetKeyWalk += character.InputCharacter_OnKeyWalk;
        inputCharacter.onKeyShooting += characterAnimator.InputCharacter_OnActiveShooting;
    } 
    public void Dispose()
    { 
        inputCharacter.onInputGetAxis -= character.InputCharacter_OnAxisMove;
        inputCharacter.onGetKeyDownJump -= character.InputCharacter_OnKeyDownJump;
        inputCharacter.onGetKeyRun -= character.InputCharacter_OnKeyRun;
        inputCharacter.onGetKeyWalk -= character.InputCharacter_OnKeyWalk;
        inputCharacter.onKeyShooting -= characterAnimator.InputCharacter_OnActiveShooting;
    }

    public void Tick()
    {   
        components.SetAnimatorMatchTarget();
        isMoving = components.UpdateStateComponetn();
        isStateParcure = characterParkour.isParcourUp;

        if (character.isCollision && !isStateParcure)
            characterAnimator.JumpAnimation(character.isJumping);
        characterAnimator.MovAnimation(character.inputAxis);
        characterAnimator.SwithAnimationMove(character.isRunningSprint, character.isWalking, character.inputAxis);
        if (character.isJumping)
        { 
            characterAnimator.ParkourUp(isStateParcure);
        } 
    }

    public void FixedTick()
    { 
        if (isMoving)
        {
            character.Jumping();
            character.Moving();
        }  
    }

    public void LateTick()
    {
        if (isMoving)
        { 
            character.SwitchVelocityMove(); 
        } 
    }
}
