using System.Collections.Generic;
using UnityEngine;

public class CharacterParcure : MonoBehaviour
{
    private Rigidbody rb;
    private Transform charTrans;
    private RaycastCamera ray;
    private CharacterAnimator anim;
    private Animator animator;
    private StateAnimatorCharacter stateMachin;
    [SerializeField] private List<ObstacleData>  obstaclesData = new List<ObstacleData>();
    private ObstacleData currentObstacle;

    public AnimatorStateInfo animState;
    private Vector3 obstaclePoint;
    private Vector3 obstacleScale; 
    private Vector3 offset;
    
    public bool isStartingParcoure {  get; private set; }

    private void Awake()
    {
        rb = GetComponent<Rigidbody>();
        charTrans = GetComponent<Transform>();
        ray = FindObjectOfType<RaycastCamera>();
        animator = GetComponent<Animator>();
        stateMachin = animator.GetBehaviour<StateAnimatorCharacter>();
        anim = GetComponent<CharacterAnimator>();
    }

    public void CharacterState_OnParcoure()
    {
        animState = animator.GetCurrentAnimatorStateInfo(0);
        isStartingParcoure = ray.SetRayHitParcour(out RaycastHit hitForward,out RaycastHit hitDown); 
        if (isStartingParcoure)
        {   
            foreach(ObstacleData data in obstaclesData)
            {
                
                if(data.CheckHeightObstacle(hitForward,hitDown, charTrans))
                {
                    currentObstacle = data;
                    anim.StartParcoureAnim(isStartingParcoure, data.nameStateAnim); 
                    break;
                }
            } 
            isStartingParcoure = false; 
        } 
    }
    public bool UpdateParcour()
    {
        rb.isKinematic = stateMachin.isKinematic;
        if (stateMachin.isParcoureState)
        {
            //SetMatchTarget(currentObstacle.avatarTarget, obstaclePoint, Quaternion.identity, offset, currentObstacle.startTime, currentObstacle.targetTime); 
            charTrans.rotation = Quaternion.RotateTowards(charTrans.rotation, currentObstacle.targetRotate, 360f * Time.deltaTime);
            return true;
        } else return false; 
    }
    public void SetMatchTarget(AvatarTarget avatarTarget, Vector3 targetPos, Quaternion targetRot, Vector3 offset, float startnormalizedTime, float targetNormalizedTime)
    {
        if (animator.isMatchingTarget)
            return;

        float normalizeTime = Mathf.Repeat(animState.normalizedTime, 1f);

        if (normalizeTime > targetNormalizedTime)
            return;
        MatchTargetWeightMask WeightMask = new MatchTargetWeightMask(new Vector3(0,1,0), 0);
        animator.SetTarget(avatarTarget, targetNormalizedTime); //Sets Target Bone for reference motion
        animator.MatchTarget(targetPos + offset, targetRot, avatarTarget, WeightMask, startnormalizedTime, targetNormalizedTime, true);
    } 
}
