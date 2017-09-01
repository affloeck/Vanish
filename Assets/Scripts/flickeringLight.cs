using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class flickeringLight : MonoBehaviour {

	public float maxReduction;
	public float maXIncrease;
	public float rateDamping;
	public float strength;
	public bool stopFlickering;

	private Light _lightSource;
	private float _baseIntensity;
	private bool _flickering;

	public void Reset(){
		maxReduction = 0.2f;
		maXIncrease = 0.2f; 
		rateDamping = 0.1f;
		strength = 300f;

	}

	void Start () {
		_lightSource = GetComponent<Light> ();

		if (_lightSource == null) {
			Debug.LogError ("Flicker script must have a Light GO");
			return;
		}
		_baseIntensity = _lightSource.intensity;
		StartCoroutine (DoFlicker ());

	}

	void Update () {
		print (_lightSource.intensity);
		if (!stopFlickering && _flickering) {
			StartCoroutine (DoFlicker ());
		}
	}

	private IEnumerator DoFlicker(){
		_flickering = true;
		while (!stopFlickering) {
			_lightSource.intensity = Mathf.Lerp (_lightSource.intensity, Random.Range (_baseIntensity - maxReduction, _baseIntensity + maXIncrease), strength * Time.deltaTime);
			yield return new WaitForSeconds (rateDamping);
		}
		_flickering = false;
	}
}
