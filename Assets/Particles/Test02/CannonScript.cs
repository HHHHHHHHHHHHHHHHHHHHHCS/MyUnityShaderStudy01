using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CannonScript : MonoBehaviour
{
    public GameObject ball;

    public float shootForce;

    private void Update()
    {
        if(Input.GetKeyDown(KeyCode.Space))
        {
            GameObject go = Instantiate(ball, transform.position, transform.rotation);
            go.GetComponent<Rigidbody>().AddForce(shootForce*go.transform.forward);
        }
    }
}
