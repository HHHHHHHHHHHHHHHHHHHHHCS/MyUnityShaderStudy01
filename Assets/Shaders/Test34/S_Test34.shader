Shader "Custom/S_Test34"
{
	Properties
	{
		_Color("Color",color) = (1,1,1,1)
	}
	
	SubShader
	{
		Tags { "RenderType"="Opaque" }

		ZWrite on
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
				float4 depth:DEPTH;
			};

			half4 _Color;

			v2f vert (appdata v)
			{
				v2f o;
				o.vertex = UnityObjectToClipPos(v.vertex);
				o.depth = -UnityObjectToViewPos(v.vertex).z*_ProjectionParams.w;
				return o;
			}
			
			fixed4 frag (v2f i) : SV_Target
			{
				float invert = 1 - i.depth;
				return fixed4(invert,invert,invert,1)*_Color;
			}
			ENDCG
		}
	}

	SubShader
	{
		Tags { "RenderType"="Transparent" }

		ZWrite off
		Blend SrcAlpha OneMinusSrcAlpha

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

			half4 _Color;

			v2f vert (appdata v)
			{
				v2f o;
				o.vertex=UnityObjectToClipPos(v.vertex);
				return o;
			}
			
			fixed4 frag (v2f i) : SV_Target
			{
				return _Color;
			}
			ENDCG
		}
	}


}
