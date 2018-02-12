Shader "Hidden/S_Test19"
{//这个是BOX Blur
	Properties
	{
		_MainTex ("Texture", 2D) = "white" {}
		_Columns("Columns float",float) = 64
		_Rows("Rows float",float) = 64
		_Offest("Offest",Range(0,2)) = 1.01
	}
	SubShader
	{
		// No culling or depth
		Cull Off ZWrite Off ZTest Always

		Pass
		{
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			
			#include "UnityCG.cginc"


			float _Columns;
			float _Rows;
			sampler2D _MainTex;
			float _Offest;

			struct appdata
			{
				float4 vertex : POSITION;
				float2 uv : TEXCOORD0;
			};

			struct v2f
			{
				float2 uv : TEXCOORD0;
				float4 vertex : SV_POSITION;
			};

			v2f vert (appdata v)
			{
				v2f o;
				o.vertex = UnityObjectToClipPos(v.vertex);
				o.uv = v.uv;
				return o;
			}
			


			fixed4 frag (v2f i) : SV_Target
			{
				float2 uv = i.uv;
				uv.x *=_Columns;
				uv.y *=_Rows;
				uv.x = round(uv.x);
				uv.y = round(uv.y);
				uv.x /= _Columns;
				uv.y /= _Rows;
				//这里是做模糊偏移
				fixed4 col = tex2D(_MainTex, uv);
				uv.x *= ((_SinTime.z +1)/10+0.9);
				fixed4 col2 = tex2D(_MainTex, uv);
				col =  (col+col2)/2;
				return col;
			}
			ENDCG
		}
	}
}
