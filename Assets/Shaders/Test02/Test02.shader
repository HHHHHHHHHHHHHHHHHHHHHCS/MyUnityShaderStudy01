Shader "Study/Test02" {
	properties
	{
		_Color("Main Color",color) = (1,1,1,1)
		_Ambient("Ambient",color) = (1,1,1,1)
		_Specular("Specular",color)= (1,1,1,1)
		_Shininess("Shininess",range(0,8))=4
		_Emission("Emission",color)=(1,1,1,1)
	}

	SubShader 
	{
		pass
		{
			//color(0.5,0.5,0.5,1)//()是死的值
			//color[_color]//[]是动态变量值
			
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
		}
	}

}
