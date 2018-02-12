Shader "Custom/S_Test30"
{
	Properties
	{
		_ColorStart("_Color", Color) = (0,0,0,1)
		_ColorEnd("_Color", Color) = (0,1,1,1)
		_Inside("_Inside", Range(0,1)) = 0
		_Rim("_Rim", Range(0,2)) = 1.2
	}

	SubShader
	{
		Tags{ "Queue" = "Transparent" }
		LOD 200

		Pass
		{
			Cull off
			Zwrite off
			Blend oneminusdstcolor one
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			#include "HLSLSupport.cginc"
			#include "UnityCG.cginc"

			struct v2f_surf
			{
				half4 pos : SV_POSITION;
				fixed4 finalColor : COLOR;
			};

			uniform half4 _ColorStart;
			uniform half4 _ColorEnd;
			uniform half _Rim;
			uniform half _Inside;
			v2f_surf vert(appdata_base v)
			{
				v2f_surf o;
				o.pos = UnityObjectToClipPos(v.vertex);
				half3 uv = mul((float3x3)UNITY_MATRIX_IT_MV, v.normal);
				uv = normalize(uv);
				o.finalColor = lerp(_ColorStart, _ColorEnd,saturate(max(1 - pow(uv.z,_Rim),
					_Inside)));
				return o;
			}

			fixed4 frag(v2f_surf IN) : COLOR
			{
				return IN.finalColor;
			}
		ENDCG
		}
	}
	FallBack "VertexLit"
}