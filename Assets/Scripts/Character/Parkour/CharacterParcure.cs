
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
    private Quaternion obstacleRotate;
    private Vector3 offset;
    public bool isStartingParcure {  get; private set; }

    private void Awake()
    {
        rb = GetComponent<Rigidbody>();
        col = GetComponent<Collider>();
        ray = FindObjectOfType<RaycastCamera>();
        animator = GetComponent<Animator>();
        stateMachin = animator.GetBehaviour<StateAnimatorCharacter>();
        anim = GetComponent<CharacterAnimator>();
    }


    private void Update()
    {
        animState = animator.GetCurrentAnimatorStateInfo(0);
        if (Input.GetKeyDown(KeyCode.R))
        {
            isStartingParcure = ray.GetDataObstacle(out obstaclePoint, out obstacleScale, out data); 
            if(isStartingParcure)
            {
                bool isClimb = data.GetHeightObstacle(obstacleScale.y, obstacleScale.z);
                if (isStartingParcure && isClimb) anim.ParkourUp(true, data.nameTriggerAnim);
                offset.z = obstacleScale.z / 2;
                offset.y = obstacleScale.y / 2;
            }  
        }
        
        if (stateMachin.isClimbingStart) SetMatchTarget(data.avatarTarget, obstaclePoint, Quaternion.identity, offset, data.startTime, data.targetTime);
        rb.isKinematic = stateMachin.isKinematic;
        col.enabled = !stateMachin.isKinematic;

        //if (stateMachin.isNextClimbing) SetMatchTargetFoot();
        //if (stateMachin.isFinishClimbing) SetMatchTargetFoot2(); 
    }
    public void SetMatchTarget(AvatarTarget avatarTarget, Vector3 targetPos, Quaternion targetRot, Vector3 offset, float startnormalizedTime, float targetNormalizedTime)
    {
        if (animator.isMatchingTarget)
            return;

        float normalizeTime = Mathf.Repeat(animState.normalizedTime, 1f);

        if (normalizeTime > targetNormalizedTime)
            return;
        MatchTargetWeightMask WeightMask = new MatchTargetWeightMask(Vector3.one, 0);
        animator.SetTarget(avatarTarget, targetNormalizedTime); //Sets Target Bone for reference motion
        animator.MatchTarget(targetPos + offset, targetRot, avatarTarget, WeightMask, startnormalizedTime, targetNormalizedTime, true);
    }
    private void SetMatchTarget1(AvatarTarget avatarTarget, float ferstTime, float nexTime)
    {
        offset.z = obstacleScale.z /2;
        offset.y = obstacleScale.y /2;
        MatchTargetWeightMask WeightMask = new MatchTargetWeightMask(Vector3.one, 0);
        animator.MatchTarget(obstaclePoint + offset, Quaternion.identity, avatarTarget, WeightMask, ferstTime, nexTime);
    }
    private void SetMatchTargetFoot()
    {
        offset.z = obstacleScale.z / 2;
        offset.y = obstacleScale.y / 2;
        MatchTargetWeightMask WeightMask = new MatchTargetWeightMask(new Vector3(0,0.5f,0), 0);
        animator.MatchTarget(obstaclePoint + offset, Quaternion.identity, AvatarTarget.LeftFoot, WeightMask, 0.28f, 0.87f);
    }
    private void SetMatchTargetFoot2()
    {
        offset.z = obstacleScale.z / 2;
        offset.y = obstacleScale.y / 2;
        MatchTargetWeightMask WeightMask = new MatchTargetWeightMask(new Vector3(0,0.5f, 0), 0);
        animator.MatchTarget(obstaclePoint + offset, Quaternion.identity, AvatarTarget.RightFoot, WeightMask, 0.38f, 0.60f);
    }
}
