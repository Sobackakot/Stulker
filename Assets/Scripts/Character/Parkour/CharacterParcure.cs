using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CharacterParcure : MonoBehaviour
{
    private Rigidbody rb;
    private RaycastCamera ray;
    private CharacterAnimator anim;
    private Animator animator;
    private StateAnimatorCharacter stateMachin;

    private Vector3 obstaclePoint;
    private Vector3 obstacleScale;
    private Quaternion obstacleRotate;
    private Vector3 offset;
    [SerializeField] private float startTime = 0.74f;
    [SerializeField] private float targetTime = 0.84f;
    public bool isStartingParcure {  get; private set; }

    private void Awake()
    {
        rb = GetComponent<Rigidbody>();
        ray = FindObjectOfType<RaycastCamera>();
        animator = GetComponent<Animator>();
        stateMachin = animator.GetBehaviour<StateAnimatorCharacter>();
        anim = GetComponent<CharacterAnimator>();
    }


    private void Update()
    {
        if (Input.GetKeyDown(KeyCode.R))
        {
            isStartingParcure = ray.GetDataObstacle(out obstaclePoint, out obstacleScale, out obstacleRotate);
            if(isStartingParcure) anim.ParkourUp(true);
        }
        if (stateMachin.isParkour) SetMatchTargetHand();
        if (stateMachin.isClimbUp) SetMatchTargetFoot();
        if (stateMachin.isClimbing) SetMatchTargetFoot2();
        rb.isKinematic = stateMachin.isKinematic; 
    }
    private void SetMatchTargetHand()
    {
        offset.z = obstacleScale.z /2;
        offset.y = obstacleScale.y /2;
        MatchTargetWeightMask WeightMask = new MatchTargetWeightMask(new Vector3(0, 0.5f, 0), 0);
        animator.MatchTarget(obstaclePoint + offset, obstacleRotate, AvatarTarget.LeftHand, WeightMask, 0.63f,0.74f);
    }
    private void SetMatchTargetFoot()
    {
        offset.z = obstacleScale.z / 2;
        offset.y = obstacleScale.y / 2;
        MatchTargetWeightMask WeightMask = new MatchTargetWeightMask(new Vector3(0,0.5f,0), 0);
        animator.MatchTarget(obstaclePoint + offset, obstacleRotate, AvatarTarget.LeftFoot, WeightMask, 0.28f, 0.86f);
    }
    private void SetMatchTargetFoot2()
    {
        offset.z = obstacleScale.z / 2;
        offset.y = obstacleScale.y / 2;
        MatchTargetWeightMask WeightMask = new MatchTargetWeightMask(new Vector3(0,0.5f, 0), 0);
        animator.MatchTarget(obstaclePoint + offset, obstacleRotate, AvatarTarget.RightFoot, WeightMask, 0.38f, 0.60f);
    }
}
