Shader "Study/Test06"
{

	SubShader
	{
		pass
		{

			CGPROGRAM
#pragma target 3.0
			#pragma vertex vert
			#pragma fragment frag  

			struct a2v
			{
				float4 pos:POSITION;
				float4 col:COLOR;
			};

			struct v2f
			{
				float4 pos:SV_POSITION;
				float4 col:COLOR0;
			};

			v2f vert(a2v v) 
			{
				v2f o;
				o.pos = mul(UNITY_MATRIX_MVP,v.pos);
				if (o.pos.x > 0)
				{
					o.col = o.pos;
				}
				else if (o.pos.x < 0)
				{
					o.col = o.pos.zyxw;
				}
				
				return o;
			}


			float4 frag(v2f v):SV_Target
			{
				return v.col;
			}
			ENDCG
		}
	}

}
