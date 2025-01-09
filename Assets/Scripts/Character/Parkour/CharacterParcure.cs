
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
        if (Input.GetKeyDown(KeyCode.R))
        {
            isStartingParcure = ray.GetDataObstacle(out obstaclePoint, out obstacleScale, out obstacleRotate, out data);
            if(isStartingParcure)
            {
                bool isClimb = data.GetHeightObstacle(obstacleScale.y);
                if (isStartingParcure && isClimb) anim.ParkourUp(true, data.nameTriggerAnim);
            }  
        }
        if (stateMachin.isClimbingStart) SetMatchTarget(data.avatarTarget, data.startTime, data.targetTime);
        rb.isKinematic = stateMachin.isKinematic;
        col.enabled = !stateMachin.isKinematic;

        if (stateMachin.isNextClimbing) SetMatchTargetFoot();
        if (stateMachin.isFinishClimbing) SetMatchTargetFoot2(); 
    }
    private void SetMatchTarget(AvatarTarget avatarTarget, float time, float nexTime)
    {
        offset.z = obstacleScale.z /2;
        offset.y = obstacleScale.y /2;
        MatchTargetWeightMask WeightMask = new MatchTargetWeightMask(new Vector3(0, 0.5f, 0), 0);
        animator.MatchTarget(obstaclePoint + offset, obstacleRotate, avatarTarget, WeightMask, time, nexTime);
    }
    private void SetMatchTargetFoot()
    {
        offset.z = obstacleScale.z / 2;
        offset.y = obstacleScale.y / 2;
        MatchTargetWeightMask WeightMask = new MatchTargetWeightMask(new Vector3(0,0.5f,0), 0);
        animator.MatchTarget(obstaclePoint + offset, obstacleRotate, AvatarTarget.LeftFoot, WeightMask, 0.28f, 0.87f);
    }
    private void SetMatchTargetFoot2()
    {
        offset.z = obstacleScale.z / 2;
        offset.y = obstacleScale.y / 2;
        MatchTargetWeightMask WeightMask = new MatchTargetWeightMask(new Vector3(0,0.5f, 0), 0);
        animator.MatchTarget(obstaclePoint + offset, obstacleRotate, AvatarTarget.RightFoot, WeightMask, 0.38f, 0.60f);
    }
}
