using UnityEngine;
using System.Collections.Generic;

public class ArrowTest : MonoBehaviour
{
    private void Awake()
    {

        int index = 0;
        Material currentMat = GetComponent<MeshRenderer>().material;
        foreach (Transform item in transform)
        {
            if (index == 0)
            {
                currentMat.SetFloat("_RepeatX", transform.GetChild(0).localScale.x / 2);
            }
            //item.localScale = new Vector3(Random.Range(0, 60), 1, 1);
            //item.eulerAngles = new Vector3(0, 0, Random.Range(0, 360F));
            item.transform.position += Vector3.up * index++;

        }
    }

}

