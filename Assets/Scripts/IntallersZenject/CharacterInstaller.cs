
using UnityEngine;
using Zenject;
using Inventory_;
using System;


[CreateAssetMenu(fileName = "Installer(Character)", menuName = "Installers/Character")]
public class CharacterInstaller : ScriptableObjectInstaller 
{
    private const string Inventory_ID = "inventory";
    private const string InventoryBox_ID = "inventoryBox";
    private const string InventoryEquip_ID = "inventoryEquip";

    private const string InventoryUI_ID = "inventoryUI";
    private const string InventoryBoxUI_ID = "inventoryBoxUI";
    private const string EquipmentUI_ID = "equipmentUI";

    private const string CameraTird_ID = "cameraTird";
    private const string CameraFerst_ID = "cameraFerst";
     

    public override void InstallBindings()
    {
        BindCharacter();
        BindCamera();
        BindInventory();
        Container.BindInterfacesAndSelfTo<MainHandler>().AsSingle().NonLazy();

        Container.Bind<WindowUI>().FromComponentInHierarchy(this).AsSingle();
       
        Container.BindInterfacesAndSelfTo<EffectsController>().AsSingle().NonLazy();
         
        Container.Bind<Audios>().FromComponentInHierarchy(this).AsSingle();
        Container.Bind<Particles>().FromComponentInHierarchy(this).AsSingle();
        Container.Bind<Lights>().FromComponentInHierarchy(this).AsSingle();  
    }

    private void BindCamera()
    {
        Container.BindInterfacesAndSelfTo<CameraController>().AsSingle().NonLazy();
        Container.BindInterfacesAndSelfTo<InputCamera>().AsSingle().NonLazy();  
        Container.Bind<ICameraCharacter>().WithId(CameraTird_ID).To<TirdCameraCharacter>().FromComponentInHierarchy(this).AsSingle();
        Container.Bind<ICameraCharacter>().WithId(CameraFerst_ID).To<FirstCameraCharacter>().FromComponentInHierarchy(this).AsSingle();
        Container.Bind<RaycastCamera>().FromComponentInHierarchy(this).AsSingle();
    }

    private void BindCharacter()
    {
        Container.BindInterfacesAndSelfTo<InputCharacter>().AsSingle().NonLazy(); 
        Container.BindInterfacesAndSelfTo<MoveController>().AsSingle().NonLazy(); 
        Container.BindInterfacesAndSelfTo<CharacterState>().AsSingle().NonLazy(); 
        Container.BindInterfacesAndSelfTo<AnimatorController>().AsSingle().NonLazy(); 

        //MonoBehaviour  
        Container.Bind<CharacterMove>().FromComponentInHierarchy(this).AsSingle();
        Container.Bind<CharacterAnimator>().FromComponentInHierarchy(this).AsSingle();   
        Container.Bind<CharacterIK>().FromComponentInHierarchy(this).AsSingle();   
        Container.Bind<CharacterParcure>().FromComponentInHierarchy(this).AsSingle();    
    }
    private void BindInventory()
    {
        // Bind InventoryUI with an identifier
        Container.Bind<IInventoryUI>().WithId(InventoryUI_ID).To<InventoryUI>().FromComponentInHierarchy(this).AsSingle();

        Container.Bind<IInventoryUI>().WithId(InventoryBoxUI_ID).To<InventoryBoxUI>().FromComponentInHierarchy(this).AsSingle();

        Container.Bind<IInventoryUI>().WithId(EquipmentUI_ID).To<EquipmentUI>().FromComponentInHierarchy(this).AsSingle();

        Container.Bind<InventoryObjectUI>().FromComponentInHierarchy(this).AsSingle();
        Container.Bind<InventoryBoxObjectUI>().FromComponentInHierarchy(this).AsTransient();


        Container.Bind<IInventoryController>().WithId(Inventory_ID).To<InventoryController>().AsSingle().NonLazy(); 

        Container.Bind<IInventoryController>().WithId(InventoryEquip_ID).To<EquipmentController>().AsSingle().NonLazy(); 

        Container.Bind<IInventoryController>().WithId(InventoryBox_ID).To<InventoryBoxController>().AsSingle().NonLazy(); 
    }
}
