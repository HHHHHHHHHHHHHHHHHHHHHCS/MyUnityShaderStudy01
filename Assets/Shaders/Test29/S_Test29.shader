// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "Custom/S_Test29"
{
	Properties
	{
		_Color("Tint (RGB)", Color) = (1,1,1,1)
		_RampTex("Facing Ratio Ramp (RGB)", 2D) = "white" {}
	}

	SubShader
	{
		Cull Off
		ZWrite Off
		Tags{ "Queue" = "Transparent" }
		Blend One OneMinusSrcColor
		Pass
		{
		CGPROGRAM
		#pragma vertex vert
		#pragma fragment frag
		#include "UnityCG.cginc"

		float4 _Color;
		sampler2D _RampTex;
		struct v2f
		{
			float4 pos : SV_POSITION;
			float2 uv : TEXCOORD0;
		};

		float4 _RampTex_ST;
		v2f vert(appdata_base v)
		{
			v2f o;
			o.pos = UnityObjectToClipPos(v.vertex);
			float3 viewDir = normalize(ObjSpaceViewDir(v.vertex));
			o.uv = float4(abs(dot(viewDir,v.normal)), 0.5, 0.0, 1.0);
			return o;
		}

		half4 frag(v2f i) : COLOR
		{
			half4 texcol = tex2D(_RampTex, i.uv);
			return texcol * _Color;
		}

		ENDCG
		}
	}
	Fallback "VertexLit"
}