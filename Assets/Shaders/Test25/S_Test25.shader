Shader "Custom/S_Test25"
{
	Properties
	{
		_MainTex("Base (RGB)",2D) = "white"{}
	}

	SubShader
	{
		Tags{"RenderType" = "Opaque"}
		LOD 200

		CGPROGRAM
		#pragma surface surf Lambert vertex:vert

		sampler2D _MainTex;

		struct Input
		{
			float2 uv_MainTex;
			float4 vertColor;
		};

		void vert(inout appdata_full v, out Input o)
		{
			UNITY_INITIALIZE_OUTPUT(Input,o);
			o.vertColor = v.color;
		}

		void surf(Input IN, inout SurfaceOutput o)
		{
			o.Albedo = IN.vertColor.rgb*tex2D(_MainTex, IN.uv_MainTex).rgb;
		}

		ENDCG
	}
		FallBack "Diffuse"
}
