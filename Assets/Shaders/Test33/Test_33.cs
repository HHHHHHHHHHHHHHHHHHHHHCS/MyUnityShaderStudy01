using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Test_33 : MonoBehaviour
{

	// Use this for initialization
	void Start () {
        GetComponent<Renderer>().material.SetFloat("_OutlineFactor", 1);
	}
	
	// Update is called once per frame
	void Update () {
		
	}
}
