Shader "Custom/S_Test17"
{
	Properties
	{
		_MainTex("Base (RGB)",2D) = "whiter"{}
		[Normal][NoScaleOffset]_TestTex("Test Texture",2D) = "whiter"{}
	}

		SubShader
	{
		Tags{"RenderType" = "Opaque"}

		ZWrite On
		ZTest Off

		Lod 200

		CGPROGRAM
		#pragma surface surf Lambert



		sampler2D _MainTex;
		sampler2D _TestTex;

		struct Input
		{
			float2 uv_MainTex;
		};

		void surf(Input IN, inout SurfaceOutput o)
		{
			half4 c1 = tex2D(_MainTex, IN.uv_MainTex);
			half4 c2 = tex2D(_TestTex, IN.uv_MainTex);
			o.Albedo = (c1.rgb+c2.rgb)/2;
			o.Alpha = clamp((c1.a+c2.a)*(c1.a-c2.a),0,1) ;
		}
		ENDCG
		}
	FALLBACK "Diffuse"
}
