using System;
using UnityEngine;
using Zenject;
using StateGame;


namespace Inventory_
{
    public class InventoryObjectUI : MonoBehaviour
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
            state.Invent.SetActiveInventory(false);
            state.Invent.SetActiveInventoryBox(false);
        }
        private void OnEnable()
        {
            state.Invent.OnActiveInventory += Input_OnActivateInventory;
            state.Invent.OnExitInventory += Input_OnExitInventory;
            state.Invent.SetActiveInventory(true); 
        }
        private void OnDestroy()
        {
            state.Invent.OnActiveInventory -= Input_OnActivateInventory;
            state.Invent.OnExitInventory -= Input_OnExitInventory;
            state.Invent.SetActiveInventory(false); 
        }
        private void Input_OnActivateInventory(bool isActive)
        {
            gameObject.SetActive(isActive);
        }
        private void Input_OnExitInventory()
        {
            gameObject.SetActive(false);
        }
        public void SetActiveInventory(bool isActive)
        {
            gameObject.SetActive(isActive);
        }
    }
}

