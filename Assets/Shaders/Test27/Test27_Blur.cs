using System.Collections;
using System.Collections.Generic;
using UnityEngine;

//[ExecuteInEditMode]
public class Test27_Blur : MonoBehaviour
{//失败
    [SerializeField]
    private Material mat;

    private void OnRenderImage(RenderTexture sourceTexture, RenderTexture destTexture)
    {

        Graphics.Blit(sourceTexture, destTexture, mat);
    }

}
