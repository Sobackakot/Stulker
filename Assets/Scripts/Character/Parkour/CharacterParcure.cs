
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
                isStartingParcure = false;
            }  
        }
        
        if (stateMachin.isParcureState) SetMatchTarget(data.avatarTarget, obstaclePoint, Quaternion.identity, offset, data.startTime, data.targetTime);
        rb.isKinematic = stateMachin.isKinematic;
        
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
