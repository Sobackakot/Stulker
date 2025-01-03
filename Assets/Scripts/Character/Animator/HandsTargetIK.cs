 
using UnityEngine;
using UnityEngine.Animations.Rigging;

public class HandsTargetIK : MonoBehaviour
{
    public HandTargetIK targetHand;

    private HandRightIK rightHand;
    private HandLeftIK leftHand;

    private Transform trHand; 
    private void Awake()
    {
        trHand = transform;
        rightHand = FindObjectOfType<HandRightIK>();
        leftHand = FindObjectOfType<HandLeftIK>(); 
    }
    private void SetTargetIK()
    {
        Debug.Log(targetHand.targetTypeHand);
        switch (targetHand.targetTypeHand)
        {
            case TargetTypeHand.RightHand:
                rightHand.GetComponent<TwoBoneIKConstraint>().data.target = trHand;
                break;
            case TargetTypeHand.LeftHand:
                leftHand.GetComponent<TwoBoneIKConstraint>().data.target = trHand;
                break;
            case TargetTypeHand.RightHint:
                rightHand.GetComponent<TwoBoneIKConstraint>().data.hint = trHand;
                break;
            case TargetTypeHand.LeftHint:
                leftHand.GetComponent<TwoBoneIKConstraint>().data.hint = trHand;
                break;
        } 
    } 
}
