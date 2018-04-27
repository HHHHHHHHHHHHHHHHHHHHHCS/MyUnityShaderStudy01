using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[ExecuteInEditMode]
public class C_Test35 : MonoBehaviour
{
    public Color col;

    private Shader shader;



    private void Awake()
    {
        shader = Shader.Find("Custom/S_Test35");
    }

    private void OnValidate()
    {
        Shader.SetGlobalColor("_OverDrawColor", col);
    }

    private void OnEnable()
    {
        if(shader)
        {
            GetComponent<Camera>().SetReplacementShader(shader, "");
        }
    }

    private void OnDisable()
    {
        if (shader)
        {
            GetComponent<Camera>().ResetReplacementShader();
        }
    }
}
