using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class fallDetect : MonoBehaviour {
	Vector3 checkpoint;

	void Start (){
		gameVariables.checkpoint = new Vector3(0, 0, 0);
	
	}

	void Update (){
		if (transform.position.y < -10) {
			transform.position = gameVariables.checkpoint;
		}
	}
}