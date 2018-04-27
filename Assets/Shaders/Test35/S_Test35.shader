﻿Shader "Custom/S_Test35"
{

	SubShader
	{
		Tags { "Queue"="Transparent"}

		ZTest Always
		ZWrite off
		Blend One One

		Pass
		{
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			
			#include "UnityCG.cginc"



			struct appdata
			{
				float4 vertex : POSITION;
			};

			struct v2f
			{
				float4 vertex : SV_POSITION;
			};

			half4 _OverDrawColor;

			v2f vert (appdata v)
			{
				v2f o;
				o.vertex=UnityObjectToClipPos(v.vertex);
				return o;
			}
			
			fixed4 frag (v2f i) : SV_Target
			{
				return _OverDrawColor;
			}
			ENDCG
		}
	}
}
