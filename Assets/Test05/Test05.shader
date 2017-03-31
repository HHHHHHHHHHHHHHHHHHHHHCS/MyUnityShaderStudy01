Shader "Study/Test05"
{
	SubShader
	{
		pass
		{
			CGPROGRAM
// Upgrade NOTE: excluded shader from OpenGL ES 2.0 because it uses non-square matrices
#pragma exclude_renderers gles


			#pragma vertex vert  
			#pragma fragment frag  

			#define AA FL4(1,1,1,1)
			typedef float4 FL4;

			struct vf
			{
				float4 pos;
				float2 uv;
			};

			void vert(in float2 objpos:POSITION,out float4 pos : POSITION,out float4 col : COLOR)
			{

				pos = float4(objpos, 0, 1);
			
				col = pos;
				if (pos.x < 0)
				{
					col = float4(0, 0, 0, 1);
				}
				else
				{
					col = float4(0, 0, 0, 1);
				}

			}

			void frag(inout float4 col:COLOR)
			{
				FL4 aa = AA;

				col = float4(1,1, 0, 1);

				bool bol = false;

				col = bol ? col : float4(1, 0, 1, 1);

				col = float4(col.xxyy);

				float3 flo3 = float3(1,0,1);

				col = float4(flo3.xyy,1);

				col = float4(col.abgr);

				float2x4 m = { 0.5,0,1,1	,0,1,0,1 };

				col = float4(m[0]);

				float2x4 m2 = { m[0],{23,46,74,23 } };

				float a[4] = { 1,0,1,0 };

				vf q;
				q.pos = float4(a[0], a[1], a[2], a[3]) ;
				q.uv = float2(0, 1);


				int i = 0;
				switch (i)
				{
					case 0:
					{
						break;
					}
					case 1:
					{
						break;

					}
					default:
					{
						break;
					}
				}
			}

			ENDCG
		}

	}


}
