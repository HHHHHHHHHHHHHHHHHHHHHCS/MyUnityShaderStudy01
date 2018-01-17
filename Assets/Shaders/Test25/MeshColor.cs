using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MeshColor : MonoBehaviour
{

    void Update()
    {
        Mesh mesh = GetComponent<MeshFilter>().sharedMesh;
        Vector3[] vertices = mesh.vertices;
        Color[] colors = new Color[vertices.Length];
        for(int i = 0;i<vertices.Length;i++)
        {
            colors[i] =Random.ColorHSV();
        }
        //colors[0] = Color.red;
        //colors[1] = Color.green;
        //colors[2] = Color.blue;
        //colors[3] = Color.magenta;
        mesh.colors = colors;
    }
}
