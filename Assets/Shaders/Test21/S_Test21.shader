Shader "Custom/S_Test21" {
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
			half3 h = normalize(lightDir + viewDir);
			fixed diff = max(0, dot(s.Normal, lightDir));
			float nh = max(0, dot(s.Normal, h));
			float spec = pow(nh, s.Specular*128.0);

			fixed4 c;
			c.rgb = (s.Albedo * _LightColor0*diff + _LightColor0.rgb
				*_Specular.rgb*spec)*(atten * 2);
			c.a = s.Alpha + _LightColor0.a*_Specular.a*spec*atten;
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
