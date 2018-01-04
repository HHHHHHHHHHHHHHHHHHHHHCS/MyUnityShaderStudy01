Shader "Custom/S_Test22"
{
	Properties
	{
		_MainTex("Base texture", 2D) = "white"
		_Cubemap("Env map", CUBE) = "" {}
	}
	SubShader
	{
		Tags{ "RenderType" = "Opaque" }
		LOD 200
		CGPROGRAM
		#pragma surface surf Lambert
		sampler2D _MainTex;
		samplerCUBE _Cubemap;
		struct Input
		{
			float2 uv_MainTex;
			float3 worldRefl;
		};
		void surf(Input IN, inout SurfaceOutput o)
		{
			fixed4 c = tex2D(_MainTex, IN.uv_MainTex);
			o.Albedo = c.rgb;
			fixed4 reflcol = texCUBE(_Cubemap, IN.worldRefl);
			reflcol *= c.a;
			o.Emission = reflcol.rgb;
			o.Alpha = reflcol.a;
		}
		ENDCG
	}
}