 
using UnityEngine; 

// Class representing an interactable object. 
public class Interactable : MonoBehaviour 
{  
    public void OnMouseDownCastom()
    {
        Interaction(); // Perform the interaction.
    }

    // Method to perform the interaction.
    public virtual void Interaction()
    {
        Debug.Log("Interactable");
    } 
     
}
