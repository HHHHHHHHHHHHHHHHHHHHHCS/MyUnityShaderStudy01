using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CannonBallScript : MonoBehaviour
{
    public float destoryTime = 1;

	void Start ()
    {
        Destroy(gameObject, destoryTime);
	}

}
