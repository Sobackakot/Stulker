
using System;
using UnityEngine;
using Zenject;

public class MoveController : IInitializable, IDisposable, IFixedTickable
{
    public MoveController(InputCharacter inputCharacter, CharacterMove character, 
        [Inject(Id = "inventoryBoxUI")]IInventoryUI inventoryUI)
    {
        this.inputCharacter = inputCharacter;
        this.character = character; 
        this.inventoryUI = inventoryUI;
    }

    private InputCharacter inputCharacter;
    private CharacterMove character;
    private IInventoryUI inventoryUI;
     
    public void Initialize()
    { 
        inputCharacter.onInputGetAxis += character.InputCharacter_OnAxisMove;
    }
    public void Dispose()
    {
        inputCharacter.onInputGetAxis -= character.InputCharacter_OnAxisMove;
    } 
    public void FixedTick()
    {
        character.Jumping();
        character.Moving();
        bool isActiveInventoryBox = inventoryUI.isActiveInventory;
        character.StopingMoveCharacter(isActiveInventoryBox);
        character.SwitchVelocityMove();
    } 
}
