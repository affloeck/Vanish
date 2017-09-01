using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class playerController : MonoBehaviour {

//movement variables
	public float runSpeed;
	public float walkSpeed;
	public bool running;

	private bool facingRight;
	private Rigidbody myRB;
	private Animator myAnim;

	//for jumping
	bool grounded = false;
	Collider[] groundCollisions;
	float groundCheckRadius = 0.2f;
	public LayerMask groundLayer;
	public Transform groundCheck;
	public float jumpHeight;

	void Start(){
		myRB = GetComponent<Rigidbody>();
		myAnim = GetComponent<Animator>();

		facingRight = true;

	}
		
		

	void FixedUpdate(){

		running = false;
		print (grounded);

		if (grounded && Input.GetAxis ("Jump") > 0) {
			myAnim.SetBool ("grounded", grounded);
			myRB.velocity = new Vector3 (myRB.velocity.x, 0, 0);
			myRB.AddForce (new Vector3 (0, jumpHeight, 0));
			grounded = false;
		}


		groundCollisions = Physics.OverlapSphere (groundCheck.position, groundCheckRadius, groundLayer);
		if (groundCollisions.Length > 0)
			grounded = true;
		else
			grounded = false;
		//myAnim.SetBool ("grounded", grounded);
		//myAnim.SetFloat ("verticalSpeed", myRB.velocity.y);

		float move = Input.GetAxis ("Horizontal");
		/*	myAnim.SetFloat ("speed", Mathf.Abs(move));

		float sneaking = Input.GetAxisRaw ("Fire3");
		myAnim.SetFloat ("sneaking", sneaking);

		float firing = Input.GetAxis ("Fire1");
		myAnim.SetFloat ("shooting", firing);

		if ((sneaking > 0 || firing > 0) && grounded ) {
			myRB.velocity = new Vector3 (move * walkSpeed, myRB.velocity.y, 0);

		}
		*
		else{
		*/
			myRB.velocity = new Vector3 (move * runSpeed, myRB.velocity.y, 0);
			if (Mathf.Abs(move) > 0)running = true;
	//	}



		if (move > 0 && !facingRight)
		Flip ();
		else if(move<0 && facingRight) 
			Flip ();
	}

	private void Grounded(){
		
	}

	private void Flip(){
		facingRight = !facingRight;
		Vector3 theScale = transform.localScale;
		theScale.x *= -1;
		transform.localScale = theScale;
	}

	private float GetFacing(){
		if (facingRight)
			return 1;
		else
			return -1;

	}

	private bool getRunning(){
		return (running);

	}
}