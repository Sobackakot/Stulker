
using System;
using UnityEngine;
using Zenject;

public class MoveController : IInitializable, IDisposable, ITickable, IFixedTickable, ILateTickable
{
    public MoveController(InputCharacter inputCharacter, CharacterMove character,CharacterComponent components, 
        [Inject(Id = "inventoryBoxUI")]IInventoryUI inventoryUI)
    {
        this.inputCharacter = inputCharacter;
        this.character = character; 
        this.components = components;
        this.inventoryUI = inventoryUI;
    }

    private InputCharacter inputCharacter;
    private CharacterMove character;
    private CharacterComponent components;
    private IInventoryUI inventoryUI;

    private bool isMoving;
    public void Initialize()
    { 
        inputCharacter.onInputGetAxis += character.InputCharacter_OnAxisMove;
    }
    public void Dispose()
    {
        inputCharacter.onInputGetAxis -= character.InputCharacter_OnAxisMove;
    }

    public void Tick()
    {   
        components.SetAnimatorMatchTarget();
        isMoving = components.UpdateStateComponetn();
    }

    public void FixedTick()
    { 
        if (isMoving)
        {
            character.Jumping();
            character.Moving();
            bool isActiveInventoryBox = inventoryUI.isActiveInventory;
            character.StopingMoveCharacter(isActiveInventoryBox);
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
