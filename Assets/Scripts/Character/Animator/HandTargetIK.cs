 
using UnityEngine;

[CreateAssetMenu( fileName = "targetHandIK", menuName = "HandsRifle")]
public class HandTargetIK : ScriptableObject
{
    public TargetTypeHand targetTypeHand;
}
public enum TargetTypeHand
{
    RightHand,
    LeftHand,
    RightHint,
    LeftHint
}