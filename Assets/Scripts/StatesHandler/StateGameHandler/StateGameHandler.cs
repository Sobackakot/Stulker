namespace StateGame
{
    public class StateGameHandler  
    {
        public StateCharacterInventory Invent { get; private set; }
        public StateCharacterParcour Raycast { get; private set; }
        public StateCharacterWeapon Weapon { get; private set; } 
        public StateCharacterCamera Camera { get; private set; }
        public StateCharacterMove Move { get; private set; }
        public StateInventoryItem Item { get; private set; }
        public StateGameHandler()
        {
            Invent = new StateCharacterInventory(this);
            Raycast = new StateCharacterParcour(this);
            Weapon = new StateCharacterWeapon(this);
            Camera = new StateCharacterCamera(this);
            Move = new StateCharacterMove(this);
            Item = new StateInventoryItem(this);

        }
        ~StateGameHandler()
        {
            Invent = null;
            Raycast = null;
        }
    }
}

