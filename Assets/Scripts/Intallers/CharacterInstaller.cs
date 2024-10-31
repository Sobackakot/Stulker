
using System.Collections.Generic;
using UnityEngine;
using Zenject;


[CreateAssetMenu(fileName = "Installer(Character)", menuName = "Installers/Character")]
public class CharacterInstaller : ScriptableObjectInstaller
{    
    public override void InstallBindings()
    {
        BindCharacter();
        BindCamera();
        BindInventory();
    }

    private void BindCamera()
    {
        Container.BindInterfacesAndSelfTo<CameraController>().AsSingle().NonLazy();
        Container.BindInterfacesAndSelfTo<InputCamera>().AsSingle().NonLazy();
         
        Container.Bind<CameraCharacter>().FromComponentInHierarchy(this).AsSingle();
    }

    private void BindCharacter()
    {
        Container.BindInterfacesAndSelfTo<InputCharacter>().AsSingle().NonLazy(); 
        Container.BindInterfacesAndSelfTo<MoveController>().AsSingle().NonLazy();

        //MonoBehaviour  
        Container.Bind<CharacterMove>().FromComponentInHierarchy(this).AsSingle();
        Container.Bind<CharacterAnimator>().FromComponentInHierarchy(this).AsSingle();
        Container.Bind<CharacterParkour>().FromComponentInHierarchy(this).AsSingle();   
        Container.Bind<CharacterComponent>().FromComponentInHierarchy(this).AsSingle();   
    }
    private void BindInventory()
    {
        // Bind InventoryUI with an identifier
        Container.Bind<InventoryUI>().FromComponentInHierarchy(this).AsSingle();

        Container.Bind<EquipmentUI>().FromComponentInHierarchy(this).AsSingle();

        Container.Bind<ActiveInventory>().FromComponentInHierarchy(this).AsSingle(); 

        Container.BindInterfacesAndSelfTo<InventoryController>().FromNew().AsSingle().NonLazy();
        Container.BindInterfacesAndSelfTo<EquipmentController>().FromNew().AsSingle().NonLazy(); 
    }
}
