// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "MyCollection/MyTestShader"
{
	Properties
	{
		[HideInInspector] __dirty( "", Int ) = 1
		_Blending("Blending", Range( 0 , 1)) = 0
		_DistortionMap("DistortionMap", 2D) = "bump" {}
		_DistortionScale("DistortionScale", Range( 0 , 1)) = 0.9881434
		_RippleScale("RippleScale", Range( 0 , 20)) = 0
		_RippleSpeed("RippleSpeed", Range( 0 , 1)) = 0
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Transparent+0" "IsEmissive" = "true"  }
		Cull Back
		GrabPass{ "GrabScreen0" }
		CGPROGRAM
		#include "UnityShaderVariables.cginc"
		#pragma target 3.0
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows 
		struct Input
		{
			float4 screenPos;
		};

		uniform sampler2D GrabScreen0;
		uniform sampler2D _DistortionMap;
		uniform float _RippleScale;
		uniform float _RippleSpeed;
		uniform float _DistortionScale;
		uniform float _Blending;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			o.Albedo = float3(0,0,0);
			float4 temp_cast_0 = (( _Time.y * _RippleSpeed )).xxxx;
			float4 ase_screenPos = float4( i.screenPos.xyz , i.screenPos.w + 0.00000000001 );
			float4 ase_screenPos8 = ase_screenPos;
			#if UNITY_UV_STARTS_AT_TOP
			float scale8 = -1.0;
			#else
			float scale8 = 1.0;
			#endif
			float halfPosW8 = ase_screenPos8.w * 0.5;
			ase_screenPos8.y = ( ase_screenPos8.y - halfPosW8 ) * _ProjectionParams.x* scale8 + halfPosW8;
			ase_screenPos8.xyzw /= ase_screenPos8.w;
			float4 temp_cast_2 = (1.0).xxxx;
			float4 temp_output_3_0 = lerp( tex2Dproj( GrabScreen0, UNITY_PROJ_COORD( ( float4( ( UnpackNormal( tex2D( _DistortionMap, ( _RippleScale * (( temp_cast_0 + ase_screenPos8 )).xx ) ) ) * _DistortionScale ) , 0.0 ) + ase_screenPos8 ) ) ) , temp_cast_2 , _Blending );
			o.Emission = temp_output_3_0.rgb;
			o.Metallic = temp_output_3_0.r;
			o.Smoothness = temp_output_3_0.r;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=10001
469;928;1337;844;768.3965;124.6241;1;True;True
Node;AmplifyShaderEditor.RangedFloatNode;19;-1876.577,209.3958;Float;False;Property;_RippleSpeed;RippleSpeed;4;0;0;0;1;0;1;FLOAT
Node;AmplifyShaderEditor.TimeNode;12;-1805.517,-5.124463;Float;False;0;5;FLOAT4;FLOAT;FLOAT;FLOAT;FLOAT
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;18;-1543.318,64.04581;Float;False;2;0;FLOAT;0.0;False;1;FLOAT;0.0;False;1;FLOAT
Node;AmplifyShaderEditor.GrabScreenPosition;8;-1525.687,273.4949;Float;False;0;0;5;FLOAT4;FLOAT;FLOAT;FLOAT;FLOAT
Node;AmplifyShaderEditor.SimpleAddOpNode;16;-1384.078,140.5458;Float;False;2;0;FLOAT;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;1;FLOAT4
Node;AmplifyShaderEditor.RangedFloatNode;15;-1483.408,-176.1641;Float;False;Property;_RippleScale;RippleScale;3;0;0;0;20;0;1;FLOAT
Node;AmplifyShaderEditor.SwizzleNode;13;-1270.738,59.45584;Float;False;FLOAT2;0;0;2;0;1;0;FLOAT4;0,0,0,0;False;1;FLOAT2
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;14;-1180.468,-79.77414;Float;False;2;0;FLOAT;0.0,0;False;1;FLOAT2;0,0;False;1;FLOAT2
Node;AmplifyShaderEditor.SamplerNode;6;-1019.983,-222.9396;Float;True;Property;_DistortionMap;DistortionMap;1;0;Assets/Plugins/AmplifyShaderEditor/Examples/Assets/Textures/Misc/SmallWaves.png;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;1.0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1.0;False;5;FLOAT3;FLOAT;FLOAT;FLOAT;FLOAT
Node;AmplifyShaderEditor.RangedFloatNode;11;-1036.026,-1.209926;Float;False;Property;_DistortionScale;DistortionScale;2;0;0.9881434;0;1;0;1;FLOAT
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;10;-703.1466,-74.57498;Float;False;2;0;FLOAT3;0.0;False;1;FLOAT;0,0,0;False;1;FLOAT3
Node;AmplifyShaderEditor.SimpleAddOpNode;9;-559.0154,100.1701;Float;False;2;0;FLOAT3;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;1;FLOAT4
Node;AmplifyShaderEditor.RangedFloatNode;5;-465.6742,422.3951;Float;False;Property;_Blending;Blending;0;0;0;0;1;0;1;FLOAT
Node;AmplifyShaderEditor.RangedFloatNode;4;-361.9995,334.3153;Float;False;Constant;_White;White;0;0;1;0;0;0;1;FLOAT
Node;AmplifyShaderEditor.ScreenColorNode;2;-391.75,111.7149;Float;False;Global;GrabScreen0;Grab Screen 0;0;0;Object;-1;1;0;FLOAT4;0,0;False;5;COLOR;FLOAT;FLOAT;FLOAT;FLOAT
Node;AmplifyShaderEditor.LerpOp;3;-151.6998,177.8648;Float;False;3;0;COLOR;0,0,0,0;False;1;FLOAT;0.0,0,0,0;False;2;FLOAT;0.0;False;1;COLOR
Node;AmplifyShaderEditor.Vector3Node;1;-314.6998,-52.46993;Float;False;Constant;_Vector0;Vector 0;0;0;0,0,0;0;4;FLOAT3;FLOAT;FLOAT;FLOAT
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;69.61499,-56.35498;Float;False;True;2;Float;ASEMaterialInspector;0;Standard;MyCollection/MyTestShader;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;0;False;0;0;Translucent;0.5;True;True;0;False;Opaque;Transparent;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;False;0;255;255;0;0;0;0;False;0;4;10;25;False;0.5;True;0;Zero;Zero;0;Zero;Zero;Add;Add;0;False;0;0,0,0,0;VertexOffset;False;Cylindrical;Relative;0;;-1;-1;-1;-1;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0.0;False;4;FLOAT;0.0;False;5;FLOAT;0.0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0.0;False;9;FLOAT;0.0;False;10;OBJECT;0.0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;13;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;18;0;12;2
WireConnection;18;1;19;0
WireConnection;16;0;18;0
WireConnection;16;1;8;0
WireConnection;13;0;16;0
WireConnection;14;0;15;0
WireConnection;14;1;13;0
WireConnection;6;1;14;0
WireConnection;10;0;6;0
WireConnection;10;1;11;0
WireConnection;9;0;10;0
WireConnection;9;1;8;0
WireConnection;2;0;9;0
WireConnection;3;0;2;0
WireConnection;3;1;4;0
WireConnection;3;2;5;0
WireConnection;0;0;1;0
WireConnection;0;2;3;0
WireConnection;0;3;3;0
WireConnection;0;4;3;0
ASEEND*/
//CHKSM=F40274DD89CBB1ABDF531244F023F712E8772708