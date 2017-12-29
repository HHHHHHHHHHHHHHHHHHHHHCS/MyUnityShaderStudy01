Shader "Custom/S_Test21_2" {
	Properties {
		_MainTex("Base (RGB)", 2D) = "white" {}
		_MainTint("Diffuse Tint", Color) = (1, 1, 1, 1)
		_Specular("Specular Color", Color) = (1, 1, 1, 1)
		_SpecularPower("Specular Power", Range(0, 1)) = 0.5
	}
	SubShader {
		Tags { "RenderType"="Opaque" }
		LOD 200
		
		CGPROGRAM
		// Physically based Standard lighting model, and enable shadows on all light types
		#pragma surface surf Specular

		// Use shader model 3.0 target, to get nicer looking lighting
		#pragma target 3.0

		// Add instancing support for this shader. You need to check 'Enable Instancing' on materials that use the shader.
		// See https://docs.unity3d.com/Manual/GPUInstancing.html for more information about instancing.
		// #pragma instancing_options assumeuniformscaling
		UNITY_INSTANCING_CBUFFER_START(Props)
		// put more per-instance properties here
		UNITY_INSTANCING_CBUFFER_END

		sampler2D _MainTex;
		float4 _MainTint;
		float4 _Specular;
		float _SpecularPower;

		inline fixed4 LightingSpecular(SurfaceOutput s, fixed3 lightDir
			, half3 viewDir, fixed atten)
		{
			float diff = dot(s.Normal, lightDir);
			float3 reflectionVector = normalize(1.1*s.Normal*diff - lightDir);

			float spec = pow(max(0, dot(reflectionVector, viewDir)), s.Specular);
			float3 finalSpec = _Specular.rgb*spec;

			fixed4 c;
			c.rgb = (s.Albedo*_LightColor0.rgb*diff) + (_LightColor0.rgb*finalSpec);
			c.a = 1.0;
			return c;
		}



		struct Input
		{
			float2 uv_MainTex;
		};

		void surf(Input IN, inout SurfaceOutput o)
		{
			half4 c = tex2D(_MainTex, IN.uv_MainTex) * _MainTint;
			o.Specular = _SpecularPower;
			o.Albedo = c.rgb;
			o.Alpha = c.a;
		}
		ENDCG
	}
	FallBack "Diffuse"
}
