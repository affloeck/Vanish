using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PushPlant : MonoBehaviour {

	private float TopThrust = 500f;
	private float BottomThrust = 200f; 

	public GameObject PlantTop;
	public GameObject PlantBottom;
	public GameObject CamCenterPoint;

	private Rigidbody TopRB;
	private Rigidbody BottomRB;

	void Start (){
//		CamCenterPoint = GetComponent<GameObject> ();
		TopRB = PlantTop.GetComponent<Rigidbody> ();
		BottomRB = PlantBottom.GetComponent<Rigidbody> ();

	}



	void OnTriggerEnter(Collider col){
		if (col.transform.position.x >= CamCenterPoint.transform.position.x) {
			TopRB.AddForce (new Vector3 (TopThrust, 0f, 0));
			BottomRB.AddForce (new Vector3 (BottomThrust, 0f, 0));
		} else {
			TopRB.AddForce (new Vector3 (-TopThrust, 0f, 0));
			BottomRB.AddForce (new Vector3 (-BottomThrust, 0f, 0));
		}
	}


}

