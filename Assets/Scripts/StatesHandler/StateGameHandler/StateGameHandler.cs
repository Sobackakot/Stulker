namespace StateGame
{
    public class StateGameHandler  
    {
        public StateCharacterInventory stateInventory { get; private set; }
        public StateCharacterParcour stateRaycast { get; private set; }
        public StateCharacterWeapon stateWeapon { get; private set; } 
        public StateCharacterCamera stateCamera { get; private set; }
        public StateCharacterMove stateMove { get; private set; }
        public StateInventoryItem stateItem { get; private set; }
        public StateGameHandler()
        {
            stateInventory = new StateCharacterInventory(this);
            stateRaycast = new StateCharacterParcour(this);
            stateWeapon = new StateCharacterWeapon(this);
            stateCamera = new StateCharacterCamera(this);
            stateMove = new StateCharacterMove(this);
            stateItem = new StateInventoryItem(this);

        }
        ~StateGameHandler()
        {
            stateInventory = null;
            stateRaycast = null;
        }
    }
}

