using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[ExecuteInEditMode]
public class C_Test34 : MonoBehaviour
{
    private Shader shader;

    private void Awake()
    {
        shader = Shader.Find("Custom/S_Test34");
    }

    private void OnEnable()
    {
        if(shader)
        {
            GetComponent<Camera>().SetReplacementShader(shader, "RenderType");
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
