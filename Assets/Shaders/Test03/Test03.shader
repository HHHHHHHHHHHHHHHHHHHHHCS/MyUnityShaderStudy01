Shader "Study/Test03" {
	properties
	{
		
		_Color("Main Color",color) = (1,1,1,1)
		_Ambient("Ambient",color) = (1,1,1,1)
		_Specular("Specular",color) = (1,1,1,1)
		_Shininess("Shininess",range(0,8)) = 4
		_Emission("Emission",color) = (1,1,1,1)
		_Constant("ConstantColor",color) = (1,1,1,0.3)
		_MainTexture("MainTexture",2d) = ""
		_MainTexture2("MainTexture2",2d) = ""


	}

		SubShader
	{
		Tags {"Queue" = "Transparent"}
		pass
		{
			Blend SrcAlpha OneMinusSrcAlpha

			material
			{
				diffuse[_Color]
				ambient[_Ambient]
				specular[_Specular]
				shininess[_Shininess]
				emission[_Emission]
			}
			lighting on
			separatespecular on

			settexture[_MainTexture]
			{
				combine texture * primary double//parimary是material计算出来的 值 加 double 就是*2的意思   quad是*4的意思
			}


			settexture[_MainTexture2]
			{
				constantColor [_Constant]
				combine texture * previous quad ,texture*constant//previous是所有前面全部 计算出来的 值 加 double 就是*2的意思   quad是*4的意思
				//,texture  是只针对 当前 进行alpha运算
			}
		}
	}

}
