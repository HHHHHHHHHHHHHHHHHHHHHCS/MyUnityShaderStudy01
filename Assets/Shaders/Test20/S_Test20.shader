Shader "Custom/S_Test20"
{
	Properties
	{
		_MainTex("Base Texture",2D) = "white"
		[Normal]_NormalMap("Normal Map",2D) = "bump"
	}

	SubShader
	{
		Tags{"RenderType" = "Opaque"}

		LOD 200

		CGPROGRAM
		#pragma surface surf Lambert

		sampler2D _MainTex;
		sampler2D _NormalMap;

		struct Input
		{
			float2 uv_MainTex;
			float2 uv_NormalMap;
		};

		void surf(Input IN, inout SurfaceOutput o)
		{
			fixed4 c = tex2D(_MainTex, IN.uv_MainTex);

			o.Albedo = c.rgb;
			o.Alpha = c.a;
			o.Normal = UnpackNormal(tex2D( _NormalMap, IN.uv_NormalMap));
		}
		ENDCG
	}
	FallBack "Diffuse"
}