using UnityEngine;
using System.Collections;

public class Test04 : MonoBehaviour
{
    public GameObject go1;
    public GameObject go2;
    public GameObject go3;

    public Texture p1;
    public Texture p2;
    public Texture p3;

    void Awake()
    {
        go1.GetComponent<Renderer>().material.SetTexture("_MainTex", p1);
        go2.GetComponent<Renderer>().material.SetTexture("_MainTex", p2);
        go3.GetComponent<Renderer>().material.SetTexture("_MainTex", p3);
    }
}
