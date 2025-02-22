using System.Collections.Generic;
using UnityEngine;
using Zenject;

public class CharacterParcure : MonoBehaviour
{
    private Rigidbody rb;
    private Transform charTrans;
    private RaycastCamera ray;
    private CharacterAnimator anim;
    private Animator animator;
    private StateAnimatorCharacter stateMachin;
    [SerializeField] private List<ObstacleData>  obstaclesData = new List<ObstacleData>();
    private ObstacleData curObst;

    public AnimatorStateInfo animState; 
    
    public bool isStartingParcoure {  get; private set; }

    private CharacterState state;

    [Inject]
    private void Container(CharacterState state)
    {
        this.state = state;
    }
    private void Awake()
    {
        rb = GetComponent<Rigidbody>();
        charTrans = GetComponent<Transform>();
        ray = FindObjectOfType<RaycastCamera>();
        animator = GetComponent<Animator>();
        stateMachin = animator.GetBehaviour<StateAnimatorCharacter>();
        anim = GetComponent<CharacterAnimator>();
    }
    public void Initialize()
    {
        state.OnParcoure += CharacterState_OnParcoure;
    }
    public void Dispose()
    {
        state.OnParcoure -= CharacterState_OnParcoure;
    }
    public void Update()
    {
        bool isParcoure = UpdateParcour();
        state.SetStateParcour(isParcoure);
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
                    curObst = data;
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
            animator.MatchTarget(curObst.matchPoint, charTrans.rotation, curObst.MatchBody, 
                new MatchTargetWeightMask(curObst.MatchPosWeight, 0), curObst.StartTime, curObst.TargetTime);
            charTrans.rotation = Quaternion.RotateTowards(charTrans.rotation, curObst.targetRotate, 360f * Time.deltaTime);
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
