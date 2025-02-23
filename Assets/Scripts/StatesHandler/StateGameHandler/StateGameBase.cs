namespace StateGame
{
    public abstract class StateGameBase : IStateGame 
    {
        public StateGameBase(StateGameHandler stateGameHandler)
        {
            this.stateGameHandler = stateGameHandler;
            EnterState();
        } 
        ~StateGameBase()
        {
            ExitState();
        }
        protected StateGameHandler stateGameHandler;
        public abstract void EnterState();

        public abstract void ExitState();

        public abstract void UpdatState();
    }
}

