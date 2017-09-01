using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class propForce : MonoBehaviour {


	void OnCollisionEnter (Collision col)
	{
		if(col.gameObject.tag == "Plant")
		{
			Destroy(col.gameObject);
		}
	}
}
