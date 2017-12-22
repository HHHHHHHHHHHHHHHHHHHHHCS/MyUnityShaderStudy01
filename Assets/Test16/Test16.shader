// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'



Shader "Study/Test16"
{
	Properties
	{
		_Color ("Color Tint",Color)= (1,1,1,1)
		_MainTex("Main Tex",2D) = "white"{}
		_UVTex("UV Tex",2D)= "white"{}
	}

	SubShader
	{
		Pass{
		Tags{ "LightMode" = "ForwardBase" }

		CGPROGRAM

		#pragma vertex vert
		#pragma fragment frag

		#include "Lighting.cginc"

		fixed4 _Color;
		sampler2D _MainTex;
		sampler2D _UVTex;


		struct a2v
		{
			float4 vertex : POSITION;
			float4 texcoord:TEXCOORD0;
		};

		struct v2f
		{
			float4 pos : SV_POSITION;
			float2 uv : TEXCOORD0;
		};

		v2f vert(a2v v)
		{
			v2f o;

			o.pos = UnityObjectToClipPos(v.vertex);

			o.uv = v.texcoord;

			return o;
		}

		fixed4 frag(v2f i) : SV_Target
		{
			fixed4 albedo = fixed4(tex2D(_MainTex, i.uv).rgb*_Color.rgb,0);
			float2 newUV = i.uv;
			newUV.x += _Time.y;
			newUV.y += _Time.y;
			albedo+= fixed4(tex2D(_UVTex, newUV).rgb, 0);


			return albedo;
		}

			ENDCG
		}
	}
		FallBack "Diffuse"
}
