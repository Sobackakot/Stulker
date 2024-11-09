
using System; 
using UnityEngine;
using UnityEngine.InputSystem;
using Zenject;

public class InputCamera : IInitializable, IDisposable
{
    public event Action<Vector2> onInputAxis;
    public event Action<Vector2> onScrollZoom;
    public event Action onRightMouseButton; 
    public event Action onLeftMouseButton;
     
    private InputActions inputActions;

    public void Initialize()
    {
        inputActions = new InputActions();
        inputActions.Enable();
        inputActions.ActionMaps.MouseDelta.performed += ctx => MouseInputAxis(ctx);

        inputActions.ActionMaps.LeftMouseButton.performed += ctx => LeftMouseButton_performed(ctx);
        inputActions.ActionMaps.RightMouseButton.performed += ctx => RightMouseButton_performed(ctx); 
        //inputActions.ActionMaps.MouseScroll.performed += ctx => MouseScrollZoom(ctx);
        //inputActions.ActionMaps.MouseMidle.performed += ctx => isPressed = true;
        //inputActions.ActionMaps.MouseMidle.canceled += ctx => isPressed = false;
        Cursor.lockState = CursorLockMode.Locked;
    } 
    public void Dispose()
    {
        inputActions.Disable();
    }

    private void MouseInputAxis(InputAction.CallbackContext context)
    {
        if (context.performed)
            onInputAxis?.Invoke(context.ReadValue<Vector2>());
        else
            onInputAxis?.Invoke(Vector2.zero);
    }
    
    private void LeftMouseButton_performed(InputAction.CallbackContext context)
    {
        if (context.performed)
            onLeftMouseButton?.Invoke();  
    }
    private void RightMouseButton_performed(InputAction.CallbackContext context)
    {
        if (context.performed)
            onRightMouseButton?.Invoke(); 
    }
    
    private void MouseScrollZoom(InputAction.CallbackContext context)
    {
        if (context.performed)
            onScrollZoom?.Invoke(context.ReadValue<Vector2>());
        else
            onScrollZoom?.Invoke(Vector2.zero);
    }
}
