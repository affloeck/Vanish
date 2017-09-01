using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class lightMovement : MonoBehaviour {

	public playerController playerController;

	private GameObject light;

	void Start(){
		light = GetComponent<GameObject> ();
		playerController = GameObject.FindObjectOfType<playerController> ();
	}

	void Update(){
		Vector3 lightMovement = new Vector3 (Random.Range (-30f, 30),0, 0);
		if (playerController.running) {
			transform.Rotate (lightMovement * Time.deltaTime);
			print ("running");
		} 
	}
}
