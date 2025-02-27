 
using UnityEngine;
using Zenject;
using StateGame;

namespace Inventory_
{
    public class InventoryBoxObjectUI : MonoBehaviour
    { 
        private StateGameHandler state;

        [Inject]
        private void Construct(StateGameHandler state)
        {
            this.state = state;
        } 
        private void Start()
        {
            gameObject.SetActive(false);
            state.Invent.SetActiveInventoryBox(false);
        }
        private void OnEnable()
        {
            state.Invent.OnActiveInventory += InputCharacter_OnExitInventoryBox;
            state.Invent.SetActiveInventoryBox(true); 

        }
        private void OnDisable()
        {
            state.Invent.OnActiveInventory -= InputCharacter_OnExitInventoryBox;
            state.Invent.SetActiveInventoryBox(false);
        }  
        public void InputCharacter_OnExitInventoryBox(bool isActive)
        {
            gameObject.SetActive(false);
        }
    }
}

