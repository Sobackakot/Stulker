
using System;
using UnityEngine;
using Zenject;

public class CameraController: ILateTickable, IInitializable, IDisposable
{   
    public CameraController(InputCamera input, CameraCharacter camera, 
        [Inject(Id = "inventoryUI")] IInventoryUI inventoryUI)
    {
        this.input = input;
        this.camera = camera;   
        this.inventoryUI = inventoryUI;
    }
    private InputCamera input;
    private CameraCharacter camera;
    private IInventoryUI inventoryUI;


    public void Initialize()
    {
        input.onInputAxis += camera.GetInputAxisMouse;
        input.onScrollZoom += camera.GetInputScrollMouse; 
    }
    public void Dispose()
    {
        input.onInputAxis -= camera.GetInputAxisMouse;
        input.onScrollZoom -= camera.GetInputScrollMouse;
    }

    public void LateTick()
    {
        if (inventoryUI.isCameraActive)
        {
            camera.RotateCamera();
            camera.ZoomCamera();
        } 
    }
   

}
