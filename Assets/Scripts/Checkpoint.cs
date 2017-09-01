﻿using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Checkpoint : MonoBehaviour {
	
	void OnTriggerEnter(Collider other){
		if (other.gameObject.tag == "Player") {
			gameVariables.checkpoint = transform.position;
		}	
	}
}