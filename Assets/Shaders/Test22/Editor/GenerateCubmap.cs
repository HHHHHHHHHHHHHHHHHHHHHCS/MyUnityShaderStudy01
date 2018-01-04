using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;

public class GenerateCubmap : ScriptableWizard
{
    public Transform renderFromPosition;

    public Cubemap cubemap;

    private void OnWizardUpdate()
    {
        helpString = "Select transform to render from and cube mao to render into";
        isValid = (renderFromPosition != null) && (cubemap != null);
    }

    private void OnWizardCreate()
    {
        GameObject go = new GameObject("Cubemap Camera", typeof(Camera));
        go.transform.position = renderFromPosition.position;
        go.transform.rotation = Quaternion.identity;

        go.GetComponent<Camera>().RenderToCubemap(cubemap);

        DestroyImmediate(go);
    }

    [MenuItem("Tool/Render into Cubemap")]
    private static void RenderCubemap()
    {
        DisplayWizard("Render cubemao", typeof(GenerateCubmap), "Render");
    }
}
