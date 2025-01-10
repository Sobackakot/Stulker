
using UnityEngine;

public class CharacterParcure : MonoBehaviour
{
    private Rigidbody rb;
    private Collider col;
    private RaycastCamera ray;
    private CharacterAnimator anim;
    private Animator animator;
    private StateAnimatorCharacter stateMachin;
    private ObstacleData data;

    public AnimatorStateInfo animState;
    private Vector3 obstaclePoint;
    private Vector3 obstacleScale; 
    private Vector3 offset;
    public bool isStartingParcoure {  get; private set; }

    private void Awake()
    {
        rb = GetComponent<Rigidbody>();
        col = GetComponent<Collider>();
        ray = FindObjectOfType<RaycastCamera>();
        animator = GetComponent<Animator>();
        stateMachin = animator.GetBehaviour<StateAnimatorCharacter>();
        anim = GetComponent<CharacterAnimator>();
    }

    public void CharacterState_OnParcoure(bool isRun)
    {
        animState = animator.GetCurrentAnimatorStateInfo(0);
        isStartingParcoure = ray.GetDataObstacle(out obstaclePoint, out obstacleScale, out data);
        if (isStartingParcoure)
        {
            bool isClimb = data.SetHeightObstacle(obstacleScale.y, obstacleScale.z, isRun);
            if (isStartingParcoure && isClimb) anim.StartParcoureAnim(isStartingParcoure, data.nameTriggerAnim);
            offset.z = obstacleScale.z / 2;
            offset.y = obstacleScale.y / 2;
            isStartingParcoure = false; 
        } 
    }
    public bool UpdateParcour()
    {
        rb.isKinematic = stateMachin.isKinematic;
        if (stateMachin.isParcoureState)
        {
            SetMatchTarget(data.avatarTarget, obstaclePoint, Quaternion.identity, offset, data.startTime, data.targetTime);
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
