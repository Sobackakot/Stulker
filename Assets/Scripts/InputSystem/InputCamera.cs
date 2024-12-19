
using System; 
using UnityEngine;
using UnityEngine.InputSystem; 
using Zenject;

public class InputCamera : IInitializable, IDisposable
{    
    public event Action<Vector2> onInputAxis;
    public event Action<Vector2> onScrollZoom;
    public event Action OnSwitchCamera; 
    
     
    private InputActions inputActions; 
    public void Initialize()
    {
        inputActions = new InputActions();
        inputActions.Enable();
        inputActions.ActionMaps.CameraSwitch.performed += ctx => CameraSwitcher(ctx);
        inputActions.ActionMaps.MouseDelta.performed += ctx => MouseInputAxis(ctx);  
        inputActions.ActionMaps.MouseDelta.canceled += ctx => MouseInputAxis(ctx);  
        inputActions.ActionMaps.MouseScroll.performed += ctx => MouseScrollZoom(ctx); 
        Cursor.lockState = CursorLockMode.Locked;
    } 
    public void Dispose()
    {
        inputActions.Disable();
    }
    private void CameraSwitcher(InputAction.CallbackContext context)
    {
        if (context.performed)
            OnSwitchCamera?.Invoke();
    }

    private void MouseInputAxis(InputAction.CallbackContext context)
    {
        if (context.performed)
            onInputAxis?.Invoke(context.ReadValue<Vector2>());
        else
            onInputAxis?.Invoke(Vector2.zero);
    }
     
     
    private void MouseScrollZoom(InputAction.CallbackContext context)
    {
        if (context.performed)
            onScrollZoom?.Invoke(context.ReadValue<Vector2>());
        else
            onScrollZoom?.Invoke(Vector2.zero); 
    }
}
