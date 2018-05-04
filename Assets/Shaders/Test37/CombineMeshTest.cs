using UnityEngine;
using System.Collections;

public class CombineMeshTest : MonoBehaviour
{
     void Start()
     {
         MeshFilter[] meshFilters = GetComponentsInChildren<MeshFilter>();       //获取自身和所有子物体中所有MeshFilter组件
         CombineInstance[] combine = new CombineInstance[meshFilters.Length];    //新建CombineInstance数组

         for (int i = 0; i < meshFilters.Length; i++)
         {
             combine[i].mesh = meshFilters[i].sharedMesh;
             combine[i].transform = meshFilters[i].transform.localToWorldMatrix;
             meshFilters[i].gameObject.SetActive(false);
         }

         transform.GetComponent<MeshFilter>().mesh = new Mesh();
         transform.GetComponent<MeshFilter>().mesh.CombineMeshes(combine);       //合并
         transform.gameObject.SetActive(true);
     }

    // Use this for initialization  
    /*void Start()
    {
        //---------------- 先获取材质 -------------------------  
        //获取自身和所有子物体中所有MeshRenderer组件  
        MeshRenderer[] meshRenderers = GetComponentsInChildren<MeshRenderer>();
        //新建材质球数组  
        Material[] mats = new Material[meshRenderers.Length];
        for (int i = 0; i < meshRenderers.Length; i++)
        {
            //生成材质球数组   
            mats[i] = meshRenderers[i].sharedMaterial;
        }
        //---------------- 合并 Mesh -------------------------  
        //获取自身和所有子物体中所有MeshFilter组件  
        MeshFilter[] meshFilters = GetComponentsInChildren<MeshFilter>();
        CombineInstance[] combine = new CombineInstance[meshFilters.Length];
        for (int i = 0; i < meshFilters.Length; i++)
        {
            combine[i].mesh = meshFilters[i].sharedMesh;
            //矩阵(Matrix)自身空间坐标的点转换成世界空间坐标的点   
            combine[i].transform = meshFilters[i].transform.localToWorldMatrix;
            meshFilters[i].gameObject.SetActive(false);
        }
        //为新的整体新建一个mesh  
        transform.GetComponent<MeshFilter>().mesh = new Mesh();
        //合并Mesh. 第二个false参数, 表示并不合并为一个网格, 而是一个子网格列表  
        transform.GetComponent<MeshFilter>().mesh.CombineMeshes(combine, false);
        transform.gameObject.SetActive(true);

        //为合并后的新Mesh指定材质 ------------------------------  
        transform.GetComponent<MeshRenderer>().sharedMaterials = mats;
    }*/
}