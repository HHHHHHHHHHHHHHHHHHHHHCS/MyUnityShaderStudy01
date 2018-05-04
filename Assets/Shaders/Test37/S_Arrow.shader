// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "HCS/Arrow"
{
	Properties
	{
		_MainTex ("Base (RGB), Alpha (A)", 2D) = "black" {}
		//_RepeatX("RepeatX", float) = 1
		//_RepeatY("RepeatY", float) = 1
		_Length("Length", range(0,1)) = 0.5
		_Show("Show", range(0,0.5)) = 0.2
		_Hide("Hide", range(0,0.5)) = 0.2
	}

	SubShader
	{
		LOD 200

		Tags
		{
			"Queue" = "Transparent"
			"IgnoreProjector" = "True"
			"RenderType" = "Transparent"
		}
		
		Pass
		{
			Cull Off
			Lighting Off
			ZWrite Off
			Offset -1, -1
			Fog { Mode Off }
			ColorMask RGB
			Blend SrcAlpha OneMinusSrcAlpha

			CGPROGRAM

			#pragma vertex vert
			#pragma fragment frag

			#include "UnityCG.cginc"

			sampler2D _MainTex;
			fixed _RepeatX;
			//fixed _RepeatY;
			fixed _Length;
			fixed _Show;
			fixed _Hide;

			struct appdata_t
			{
				float4 vertex : POSITION;
				half4 color : COLOR;
				float2 texcoord : TEXCOORD0;
			};

			struct v2f
			{
				float4 vertex : POSITION;
				half4 color : COLOR;
				float2 texcoord : TEXCOORD0;
				float2 worldPos : TEXCOORD1;
				float3 worldScale: TEXCOORD2;
			};

			v2f vert (appdata_t v)
			{
				v2f o;
				o.vertex = UnityObjectToClipPos(v.vertex);
				o.color = v.color;
				o.texcoord = v.texcoord;
				float3 recipObjScale = float3(length(unity_WorldToObject[0].xyz), length(unity_WorldToObject[1].xyz), length(unity_WorldToObject[2].xyz));
				o.worldScale = 1.0 / recipObjScale;
				return o;
			}

			fixed4 RepeatTexture(v2f IN)
			{
				fixed2 uv = IN.texcoord;
				//fixed _RepeatX =  IN.worldScale / 2;
				fixed repX = 1 / _RepeatX;
				uv.x = (uv.x - (int)(uv.x / repX) * repX) * _RepeatX;
				//uv.y = (uv.y - (int)(uv.y / (1 / _RepeatY)) * (1 / _RepeatY)) * _RepeatY;
				uv.x -= _Time[1];
				fixed4 color = tex2D(_MainTex, uv)* IN.color;
				return color;
			}

			half4 frag (v2f IN) : COLOR
			{
				half4 col= RepeatTexture(IN);

				float nowPos = abs(IN.texcoord.x / _Length - 0.5);
				col.a *= 1-sign(saturate(IN.texcoord.x- _Length));
				col.a *= 1-step(nowPos,0.5-_Show-_Hide);
				col.a *= clamp(lerp(0,1,(nowPos -_Show)/ _Hide),0,1);
				return col;
			}
			ENDCG
		}
	}
	
	/*SubShader
	{
		LOD 100

		Tags
		{
			"Queue" = "Transparent"
			"IgnoreProjector" = "True"
			"RenderType" = "Transparent"
		}
		
		Pass
		{
			Cull Off
			Lighting Off
			ZWrite Off
			Fog { Mode Off }
			ColorMask RGB
			Blend SrcAlpha OneMinusSrcAlpha
			ColorMaterial AmbientAndDiffuse
			
			SetTexture [_MainTex]
			{
				Combine Texture * Primary
			}
		}
	}*/
}
