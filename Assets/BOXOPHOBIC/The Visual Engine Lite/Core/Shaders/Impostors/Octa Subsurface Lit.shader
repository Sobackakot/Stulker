// Made with Amplify Shader Editor v1.9.6.3
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "BOXOPHOBIC/The Visual Engine/Impostors/Octa Subsurface Lit (Lite)"
{
	Properties
	{
		[HideInInspector] _EmissionColor("Emission Color", Color) = (1,1,1,1)
		[HideInInspector] _AlphaCutoff("Alpha Cutoff ", Range(0, 1)) = 0.5
		[HideInInspector]_IsVersion("_IsVersion", Float) = 2030
		[HideInInspector]_IsTVEShader("_IsTVEShader", Float) = 1
		[HideInInspector]_IsShared("_IsShared", Float) = 0
		[HideInInspector]_IsIdentifier("_IsIdentifier", Float) = 0
		[HideInInspector]_IsCollected("_IsCollected", Float) = 0
		[HideInInspector]_IsConverted("_IsConverted", Float) = 0
		[HideInInspector]_IsCustomShader("_IsCustomShader", Float) = 0
		[HideInInspector]_HasDefaultTextures("_HasDefaultTextures", Float) = 0
		[HideInInspector]_IsInitialized("_IsInitialized", Float) = 0
		[StyledCategory(Render Settings, true, 0, 10)]_CategoryRender("[ Category Render ]", Float) = 1
		[Enum(Off,0,On,1)]_RenderSSR("Render SSR", Float) = 0
		[Enum(Off,0,On,1)]_RenderDecals("Render Decals", Float) = 0
		[Enum(Auto,0,Off,1,On,2)]_RenderMotion("Render Motion", Float) = 0
		[Enum(Off,0,On,1)]_RenderShadow("Render Shadows", Float) = 1
		[StyledSpace(10)]_EndRender("[ End Render ]", Float) = 1
		[StyledCategory(Noise Settings, true, 0, 10)]_NoiseCategory("[ Noise Category ]", Float) = 1
		[NoScaleOffset][StyledTextureSingleLine]_NoiseTex3D("Noise Mask 3D", 3D) = "white" {}
		[StyledSpace(10)]_NoiseEnd("[ Noise End ]", Float) = 1
		[StyledCategory(Global Settings, true, 0, 10)]_GlobalCategory("[ Global Category ]", Float) = 1
		[StyledMessage(Warning, Global Elements and Layers are only available with The Visual Engine Core package., 0, 0)]_GlobalLiteInfo("# Global Lite Info", Float) = 0
		[StyledSpace(10)]_GlobalEnd("[ Global End ]", Float) = 1
		[StyledCategory(Impostor Settings, true, 0, 10)]_ImpostorCategory("[ Impostor Category ]", Float) = 1
		_Albedo("Impostor Albedo & Alpha", 2D) = "white" {}
		_Normals("Impostor Normal & Depth", 2D) = "white" {}
		[NoScaleOffset][StyledTextureSingleLine]_MasksA("Impostor MasksA", 2D) = "white" {}
		[NoScaleOffset][StyledTextureSingleLine]_MasksB("Impostor MasksB", 2D) = "white" {}
		_AI_Parallax("Impostor Parallax", Range( 0 , 1)) = 1
		[HideInInspector]_AI_SizeOffset("Impostor Size Offset", Vector) = (0,0,0,0)
		_AI_ShadowView("Impostor Shadow View", Range( 0 , 1)) = 1
		_AI_ShadowBias("Impostor Shadow Bias", Range( 0 , 2)) = 0.25
		[HideInInspector]_AI_DepthSize("Impostor Depth Size", Float) = 0
		_AI_TextureBias("Impostor Texture Bias", Float) = -1
		[HideInInspector]_AI_Offset("Impostor Offset", Vector) = (0,0,0,0)
		[HideInInspector]_AI_ImpostorSize("Impostor Size", Float) = 0
		[HideInInspector]_AI_FramesY("Impostor Frames Y", Float) = 0
		[HideInInspector]_AI_FramesX("Impostor Frames X", Float) = 0
		[HideInInspector]_AI_Frames("Impostor Frames", Float) = 0
		_AI_Clip("Impostor Clip", Range( 0 , 1)) = 0.5
		[Enum(Constant,0,Dual Colors,1)][Space(10)]_ImpostorColorMode("Impostor Color", Float) = 0
		[HDR]_ImpostorColor("Impostor Color", Color) = (1,1,1,1)
		[HDR]_ImpostorColorTwo("Impostor ColorB", Color) = (1,1,1,1)
		_ImpostorAlphaClipValue("Impostor Alpha", Range( 0 , 1)) = 0.5
		_ImpostorMetallicValue("Impostor Metallic", Range( 0 , 1)) = 0
		_ImpostorSmoothnessValue("Impostor Smoothness", Range( 0 , 1)) = 1
		[StyledSpace(10)]_ImpostorEnd("[ Impostor End ]", Float) = 1
		[StyledCategory(Variation Settings, true, 0, 10)]_VariationCategory("[ Variation Category ]", Float) = 1
		[StyledMessage(Warning, The Variation feature is only available with The Visual Engine Core package., 0, 10)]_VariationLiteInfo("# Variation Lite Info", Float) = 0
		[StyledColoring]_VariationColoring("# Variation Coloring", Color) = (1,1,1,0.6)
		_VariationIntensityValue("Variation Intensity", Range( 0 , 1)) = 0
		[HDR]_VariationColorOne("Variation ColorA", Color) = (0.4573758,0.6226415,0.2144001,1)
		[HDR]_VariationColorTwo("Variation ColorB", Color) = (0.7450981,0.5238863,0.1098039,1)
		[Space(10)]_VariationMultiValue("Variation Multi Mask", Range( 0 , 1)) = 1
		[StyledRemapSlider]_VariationNoiseRemap("Variation Noise Mask", Vector) = (0,1,0,0)
		_VariationNoiseTillingValue("Variation Noise Tilling", Range( 0 , 40)) = 1
		_VariationNoisePivotsValue1("Variation Noise Pivots", Range( 0 , 1)) = 0
		[StyledSpace(10)]_VariationEnd("[ Variation End ]", Float) = 1
		[StyledCategory(Tinting Settings, true, 0, 10)]_TintingCategory("[ Tinting Category ]", Float) = 1
		[StyledMessage(Warning, The Tinting feature is only available with The Visual Engine Core package., 0, 10)]_TintingLiteInfo("# Tinting Lite Info", Float) = 0
		[StyledColoring]_TintingColoring("# Tinting Coloring", Color) = (1,1,1,0.6)
		_TintingIntensityValue("Tinting Intensity", Range( 0 , 1)) = 0
		_TintingGrayValue("Tinting Gray", Range( 0 , 1)) = 1
		[HDR][Gamma]_TintingColor("Tinting Color", Color) = (1,1,1,1)
		[StyledSpace(10)]_TintingSpace("[ Tinting Space ]", Float) = 1
		_TintingMultiValue("Tinting Multi Mask", Range( 0 , 1)) = 1
		_TintingLumaValue("Tinting Luma Mask", Range( 0 , 1)) = 1
		[StyledRemapSlider]_TintingLumaRemap("Tinting Luma Mask", Vector) = (0,1,0,0)
		[Space(10)][StyledToggle]_TintingElementMode("Use Paint Globals / Elements", Float) = 1
		[StyledSpace(10)]_TintingEnd("[ Tinting End]", Float) = 1
		[StyledCategory(Dryness Settings, true, 0, 10)]_DrynessCategory("[ Dryness Category ]", Float) = 1
		[StyledMessage(Warning, The Dryness feature is only available with The Visual Engine Core package., 0, 10)]_DrynessLiteInfo("# Dryness Lite Info", Float) = 0
		[StyledColoring]_DrynessColoring("# Dryness Coloring", Color) = (1,1,1,0.6)
		_DrynessIntensityValue("Dryness Intensity", Range( 0 , 1)) = 0
		_DrynessGrayValue("Dryness Gray", Range( 0 , 1)) = 1
		_DrynessShiftValue("Dryness Shift", Range( 0 , 1)) = 0
		[HDR][Gamma]_DrynessColor("Dryness Color", Color) = (1,0.7083712,0.495283,1)
		_DrynessSubsurfaceValue("Dryness Subsurface", Range( 0 , 1)) = 0.5
		_DrynessSmoothnessValue("Dryness Smoothness", Range( 0 , 1)) = 0.5
		[StyledSpace(10)]_DrynessSpace("[ Dryness Space ]", Float) = 1
		_DrynessMultiValue("Dryness Multi Mask", Range( 0 , 1)) = 1
		_DrynessLumaValue("Dryness Luma Mask", Range( 0 , 1)) = 1
		[StyledRemapSlider]_DrynessLumaRemap("Dryness Luma Mask", Vector) = (0,1,0,0)
		[Space(10)][StyledToggle]_DrynessElementMode("Use Atmo Globals / Elements", Float) = 1
		[StyledSpace(10)]_DrynessEnd("[ Dryness End ]", Float) = 1
		[StyledCategory(Overlay Settings, true, 0, 10)]_OverlayCategory("[ Overlay Category ]", Float) = 1
		[StyledMessage(Warning, The Overlay Glitter feature is only available with The Visual Engine Core package., 0, 10)]_OverlayLiteInfo("# Overlay Lite Info", Float) = 0
		[StyledMessage(Info, The current settings are pre baked to the impostor., 0, 10)]_OverlayBakeInfo("Overlay Baking Info", Float) = 0
		_OverlayIntensityValue("Overlay Intensity", Range( 0 , 1)) = 0
		[HDR]_OverlayColor("Overlay Color", Color) = (0.2815503,0.4009458,0.5377358,1)
		_OverlayNormalValue("Overlay Normal", Range( -8 , 8)) = 1
		_OverlaySubsurfaceValue("Overlay Subsurface", Range( 0 , 1)) = 0.5
		_OverlaySmoothnessValue("Overlay Smoothness", Range( 0 , 1)) = 0.5
		[StyledColoring]_OverlayColoringOn("# Overlay Coloring On", Color) = (1,1,1,0.6)
		[Space(10)][StyledTextureSingleLine]_OverlayGlitterTex("Overlay Glitter", 2D) = "black" {}
		[Space(10)]_OverlayGlitterIntensityValue("Overlay Glitter Intensity", Range( 0 , 1)) = 1
		[HDR]_OverlayGlitterColor("Overlay Glitter Color", Color) = (0.7215686,1.913725,2.996078,1)
		_OverlayGlitterTillingValue("Overlay Glitter Tilling", Range( 0 , 10)) = 2
		_OverlayGlitterDistValue("Overlay Glitter Fade", Range( 0 , 200)) = 100
		[StyledColoring]_OverlayColoringOff("# Overlay Coloring Off", Color) = (1,1,1,1)
		[StyledSpace(10)]_OverlaySpace("[ Overlay Space ]", Float) = 1
		_OverlayLumaValue("Overlay Luma Mask", Range( 0 , 1)) = 1
		[StyledRemapSlider]_OverlayLumaRemap("Overlay Luma Mask", Vector) = (0,1,0,0)
		_OverlayProjValue("Overlay ProjY Mask", Range( 0 , 1)) = 0.5
		[StyledRemapSlider]_OverlayProjRemap("Overlay ProjY Mask", Vector) = (0,1,0,0)
		[StyledRemapSlider]_OverlayBlendRemap1("Overlay Blend Mask", Vector) = (0.1,0.2,0,0)
		[Space(10)][StyledToggle]_OverlayElementMode("Use Atmo Globals / Elements", Float) = 1
		[StyledSpace(10)]_OverlayEnd("[ Overlay End ]", Float) = 1
		[StyledCategory(Wetness Settings, true, 0, 10)]_WetnessCategory("[ Wetness Category ]", Float) = 1
		[StyledMessage(Warning, The Wetness feature is only available with The Visual Engine Core package., 0, 10)]_WetnessLiteInfo("# Wetness Lite Info", Float) = 0
		[StyledColoring]_WetnessColoring("# Wetness Coloring", Color) = (1,1,1,0.6)
		_WetnessIntensityValue("Wetness Intensity", Range( 0 , 1)) = 0
		_WetnessContrastValue("Wetness Contrast", Range( 0 , 1)) = 0.2
		_WetnessSmoothnessValue("Wetness Smoothness", Range( 0 , 1)) = 0.8
		[Space(10)][StyledToggle]_WetnessElementMode("Use Atmo Globals / Elements", Float) = 1
		[StyledSpace(10)]_WetnessEnd("[ Wetness End ]", Float) = 1
		[StyledCategory(Cutout Settings, true, 0, 10)]_CutoutCategory("[ Cutout Category ]", Float) = 1
		[StyledMessage(Warning, The Cutout feature is only available with The Visual Engine Core package., 0, 10)]_CutoutLiteInfo("# Cutout Lite Info", Float) = 0
		[StyledColoring]_CutoutColoring("# Cutout Coloring", Color) = (1,1,1,0.6)
		_CutoutIntensityValue("Cutout Intensity", Range( 0 , 1)) = 0
		[Enum(Off,0,Affect Shadow Pass,1)]_CutoutShadowMode("Cutout Shadow", Float) = 1
		[StyledSpace(10)]_CutoutSpace("[ Cutout Space ]", Float) = 1
		_CutoutMultiValue("Cutout Multi Mask", Range( 0 , 1)) = 1
		_CutoutAlphaValue("Cutout Alpha Mask", Range( 0 , 1)) = 0
		_CutoutNoiseValue("Cutout Noise Mask", Range( 0 , 1)) = 1
		_CutoutNoiseTillingValue("Cutout Noise Tilling", Range( 0 , 40)) = 1
		[Space(10)][StyledToggle]_CutoutElementMode("Use Atmo Globals / Elements", Float) = 1
		[StyledSpace(10)]_CutoutEnd("[ Cutout End ]", Float) = 1
		[StyledCategory(Dither Settings, true, 0, 10)]_DitherCategory("[ Dither Category ]", Float) = 1
		[StyledMessage(Warning, The Dither feature is only available with The Visual Engine Core package., 0, 10)]_DitherLiteInfo("# Dither Lite Info", Float) = 0
		[StyledColoring]_DitherColoring("# Dither Coloring", Color) = (1,1,1,0.6)
		_DitherConstantValue("Dither Constant", Range( 0 , 1)) = 0
		_DitherDistanceValue("Dither Distance", Range( 0 , 1)) = 0
		_DitherDistanceMinValue("Dither Distance Start", Range( 0 , 1000)) = 0
		_DitherDistanceMaxValue("Dither Distance Limit", Range( 0 , 1000)) = 0
		[Enum(Off,0,Affect Shadow Pass,1)]_DitherShadowMode("Dither Shadow", Float) = 1
		[Space(10)]_DitherMultiValue("Dither Multi Mask", Range( 0 , 1)) = 1
		_DitherNoiseTillingValue("Dither Noise Tilling", Range( 0 , 40)) = 1
		[StyledSpace(10)]_DitherEnd("[ Dither End ]", Float) = 1
		[StyledCategory(Emissive Settings, true, 0, 10)]_EmissiveCategory("[ Emissive Category ]", Float) = 1
		_EmissiveIntensityValue("Emissive Intensity", Range( 0 , 1)) = 0
		[HDR]_EmissiveColor("Emissive Color", Color) = (1,1,1,1)
		[Enum(Nits,0,EV100,1)]_EmissivePowerMode("Emissive Power", Float) = 0
		_EmissivePowerValue("Emissive Power", Float) = 1
		_EmissiveExposureValue("Emissive Weight", Range( 0 , 1)) = 0.5
		[Space(10)][StyledToggle]_EmissiveElementMode("Use Glow Globals / Elements", Float) = 0
		[StyledSpace(10)]_EmissiveEnd("[ Emissive End ]", Float) = 1
		[HideInInspector]_emissive_power_value("_emissive_power_value", Float) = 1
		[StyledCategory(Subsurface Settings, true, 0, 10)]_SubsurfaceCategory("[ Subsurface Category ]", Float) = 1
		[DiffusionProfile]_SubsurfaceDiffusion("Subsurface Diffusion", Float) = 0
		[HideInInspector]_SubsurfaceDiffusion_Asset("Subsurface Diffusion", Vector) = (0,0,0,0)
		[StyledSpace(10)]_SubsurfaceSpace("# SubsurfaceSpace", Float) = 0
		_SubsurfaceIntensityValue("Subsurface Intensity", Range( 0 , 1)) = 0
		[HDR]_SubsurfaceColor("Subsurface Color", Color) = (1,1,1,1)
		_SubsurfaceScatteringValue("Subsurface Power", Range( 0 , 16)) = 2
		_SubsurfaceAngleValue("Subsurface Angle", Range( 1 , 16)) = 8
		_SubsurfaceDirectValue("Subsurface Direct", Range( 0 , 1)) = 1
		_SubsurfaceNormalValue("Subsurface Normal", Range( 0 , 1)) = 0
		_SubsurfaceAmbientValue("Subsurface Ambient", Range( 0 , 1)) = 0.2
		_SubsurfaceShadowValue("Subsurface Shadow", Range( 0 , 1)) = 1
		_SubsurfaceThicknessValue("Subsurface Thickness", Range( 0 , 1)) = 0
		[Space(10)]_SubsurfaceMultiValue("Subsurface Multi Mask", Range( 0 , 1)) = 1
		[Space(10)][StyledToggle]_SubsurfaceElementMode("Use Glow Globals / Elements", Float) = 0
		[StyledSpace(10)]_SubsurfaceEnd("[ Subsurface End ]", Float) = 1
		[StyledCategory(Size Fade Settings, true, 0, 10)]_SizeFadeCategory("[ Size Fade Category ]", Float) = 1
		[StyledMessage(Warning, The Size Fade feature is only available with The Visual Engine Core package., 0, 10)]_SizeFadeLiteInfo("# SizeFade Lite Info", Float) = 0
		[StyledColoring]_SizeFadeColoring("# SizeFade Coloring", Color) = (1,1,1,0.6)
		_SizeFadeIntensityValue("Size Fade Intensity", Range( 0 , 1)) = 0
		[Enum(All Axis,0,Y Axis,1)]_SizeFadeScaleMode("Size Fade Mode", Float) = 0
		_SizeFadeScaleValue("Size Fade Scale", Range( 0 , 1)) = 1
		_SizeFadeDistMinValue("Size Fade Start", Range( 0 , 1000)) = 0
		_SizeFadeDistMaxValue("Size Fade Limit", Range( 0 , 1000)) = 0
		[Space(10)][StyledToggle]_SizeFadeElementMode("Use Form Globals / Elements", Float) = 0
		[StyledSpace(10)]_SizeFadeEnd("[ Size Fade End ]", Float) = 1
		[StyledCategory(Motion Settings, true, 0, 10)]_MotionWindCategory("[ Motion Wind Category ]", Float) = 1
		[NoScaleOffset][StyledTextureSingleLine]_MotionNoiseTex("Motion Texture", 2D) = "white" {}
		[Space(10)]_MotionBaseIntensityValue("Motion LayerA Intensity", Range( 0 , 8)) = 0.2
		_MotionBasePivotValue("Motion LayerA Pivots", Range( 0 , 1)) = 0.8
		[Space(10)]_MotionIntensityValue("Motion Wind Intensity", Range( 0 , 1)) = 1
		_MotionDelayValue("Motion Wind Delay", Range( 0 , 1)) = 0
		_MotionTillingValue("Motion Wind Tilling", Range( 0 , 40)) = 5
		[Space(10)][StyledToggle]_MotionWindElementMode("Use Wind Elements", Float) = 0
		[StyledSpace(10)]_MotionWindEnd("[ Motion Wind End ]", Float) = 1
		[StyledCategory(Interaction Settings, true, 0, 10)]_MotionInteractionCategory("[ Motion Interaction Category ]", Float) = 1
		[StyledMessage(Warning, The Interaction feature is only available with The Visual Engine Core package., 0, 10)]_InteractionLiteInfo("# Interaction Lite Info", Float) = 0
		[StyledColoring]_InteractionColoring("# Interaction Coloring", Color) = (1,1,1,0.6)
		_MotionPushIntensityValue("Interaction Intensity", Range( 0 , 8)) = 0
		_MotionPushPivotValue("Interaction Pivots", Range( 0 , 1)) = 1
		_MotionPushMaskValue("Interaction Bend Mask", Range( 0 , 1)) = 0
		[Space(10)][StyledToggle]_MotionPushElementMode("Use Push Globals / Elements", Float) = 1
		[StyledSpace(10)]_MotionInteractionEnd("[ Motion Interaction End ]", Float) = 1
		[HideInInspector]_AI_Offset("_AI_Offset", Vector) = (0,0,0,0)
		[HideInInspector]_global_wind_layer_value("_global_wind_layer_value", Float) = 0
		[HideInInspector]_IsImpostorShader("_IsImpostorShader", Float) = 1
		[HideInInspector]_IsSubsurfaceShader("_IsSubsurfaceShader", Float) = 1
		[HideInInspector]_IsLiteShader("_IsLiteShader", Float) = 1
		[HideInInspector] _texcoord( "", 2D ) = "white" {}


		[HideInInspector] _BlendMode("Blend Mode", Float) = 0
	}

	SubShader
	{
		LOD 0

		
		Tags { "RenderPipeline"="HDRenderPipeline" "RenderType"="Opaque" "Queue"="Geometry" }

		Cull Back
		Blend One Zero
		ZTest LEqual
		ZWrite On
		ZClip [_ZClip]

		HLSLINCLUDE
		#pragma target 4.5
		#pragma exclude_renderers glcore gles gles3 
		#pragma multi_compile_instancing
		#pragma instancing_options renderinglayer
		#pragma multi_compile _ DOTS_INSTANCING_ON
		#pragma multi_compile _ LOD_FADE_CROSSFADE
		#define AI_RENDERPIPELINE

		struct GlobalSurfaceDescription
		{
			float3 Albedo;
			float3 Normal;
			float3 BentNormal;
			float3 Specular;
			float CoatMask;
			float Metallic;
			float3 Emission;
			float Smoothness;
			float Occlusion;
			float Alpha;
			float AlphaClipThreshold;
			float SpecularAAScreenSpaceVariance;
			float SpecularAAThreshold;
			float SpecularOcclusion;
			//Refraction
			float RefractionIndex;
			float3 RefractionColor;
			float RefractionDistance;
			//SSS/Translucent
			float Thickness;
			float SubsurfaceMask;
			float TransmissionMask;
			float DiffusionProfile;
			//Anisotropy
			float Anisotropy;
			float3 Tangent;
			//Iridescent
			float IridescenceMask;
			float IridescenceThickness;
		};

		struct SurfaceOutput
		{
			half3 Albedo;
			half3 Specular;
			half Metallic;
			float3 Normal;
			half3 Emission;
			half Smoothness;
			half Occlusion;
			half Alpha;
		};

		struct AlphaSurfaceDescription
		{
			float Alpha;
			float AlphaClipThreshold;
		};

		struct SmoothSurfaceDescription
		{
			float Smoothness;
			float Alpha;
			float AlphaClipThreshold;
		};

		struct DistortionSurfaceDescription
		{
			float Alpha;
			float2 Distortion;
			float DistortionBlur;
			float AlphaClipThreshold;
		};
		ENDHLSL

		
		Pass
		{
			
			Name "GBuffer"
			Tags { "LightMode"="GBuffer" }

			Stencil
			{
				Ref 10
				WriteMask 14
				Comp Always
				Pass Replace
			}


			ColorMask [_LightLayersMaskBuffer4] 4
			ColorMask [_LightLayersMaskBuffer5] 5

			HLSLPROGRAM

			#pragma shader_feature_local_fragment _DISABLE_DECALS
			#pragma shader_feature_local_fragment _DISABLE_SSR
			#define _MATERIAL_FEATURE_TRANSMISSION 1
			#define ASE_SRP_VERSION 140011
			#ifdef UNITY_COLORSPACE_GAMMA//AI_SRP
			#define unity_ColorSpaceDielectricSpec half4(0.220916301, 0.220916301, 0.220916301, 1.0 - 0.220916301)//AI_SRP
			#else//AI_SRP
			#define unity_ColorSpaceDielectricSpec half4(0.04, 0.04, 0.04, 1.0 - 0.04) //AI_SRP
			#endif//AI_SRP
			#define ASE_USING_SAMPLING_MACROS 1


			#pragma vertex Vert
			#pragma fragment Frag

			#if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define OUTPUT_SPLIT_LIGHTING
			#endif

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			//#if defined( ASE_SRP_VERSION ) && ASE_SRP_VERSION < 60900
			//#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Wind.hlsl"
			//#endif
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"

			#define SHADERPASS SHADERPASS_GBUFFER
			//#pragma multi_compile _ LIGHTMAP_ON
			//#pragma multi_compile _ DIRLIGHTMAP_COMBINED
			//#pragma multi_compile _ DYNAMICLIGHTMAP_ON
			//#pragma multi_compile _ SHADOWS_SHADOWMASK
			//#pragma multi_compile DECALS_OFF DECALS_3RT DECALS_4RT
			#pragma multi_compile _ LIGHT_LAYERS
			#pragma multi_compile_fragment PROBE_VOLUMES_OFF PROBE_VOLUMES_L1 PROBE_VOLUMES_L2

			#define VARYINGS_NEED_POSITION_WS
			#define VARYINGS_NEED_TANGENT_TO_WORLD
			#define VARYINGS_NEED_TEXCOORD1
			#define VARYINGS_NEED_TEXCOORD2

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"

			//#if defined( ASE_SRP_VERSION ) && ASE_SRP_VERSION < 60900
			//#define T2W(var, index) var.worldToTangent[index]
			//#else
			#define T2W(var, index) var.tangentToWorld[index]
			//#endif

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/CommonLighting.hlsl"
			#define ai_ObjectToWorld GetObjectToWorldMatrix()
			#define ai_WorldToObject GetWorldToObjectMatrix()
			#define AI_INV_TWO_PI  INV_TWO_PI
			#define AI_PI          PI
			#define AI_INV_PI      INV_PI
			#define ASE_NEEDS_VERT_NORMAL
			#pragma shader_feature_local_fragment TVE_PIPELINE_STANDARD TVE_PIPELINE_UNIVERSAL TVE_PIPELINE_HD
			#pragma shader_feature_local_vertex TVE_MOTION_BASE_BENDING
			#pragma shader_feature_local_vertex TVE_MOTION_WIND_ELEMENT
			#pragma shader_feature_local_fragment TVE_OVERLAY
			#pragma shader_feature_local_fragment TVE_OVERLAY_ELEMENT
			#pragma shader_feature_local_fragment TVE_EMISSIVE
			#pragma shader_feature_local_fragment TVE_EMISSIVE_ELEMENT
			#pragma shader_feature_local_fragment TVE_SUBSURFACE
			#pragma shader_feature_local_fragment TVE_SUBSURFACE_ELEMENT
			  
			struct TVEVisualData
			{  
				half Dummy;  
				half3 Albedo;
				half2 NormalTS;
				half3 NormalWS; 
				half4 Shader;
				half4 Emissive;
				half AlphaClip;
				half AlphaFade;
				half MultiMask;
				half Grayscale;
				half Luminosity;
				half3 Translucency;
				half Transmission;
				half Thickness;
				float Diffusion;
			};  
			    
			struct TVEModelData
			{    
				half Dummy;    
				half3 PositionOS;
				half3 PositionWS;
				half3 PositionWO;
				half3 PositionRawOS;
				half3 PositionAddOS;
				half3 PivotOS;
				half3 PivotWS;
				half3 PivotWO;
				half3 NormalOS;
				half3 NormalWS;
				half3 NormalRawOS;
				half3 NormalRawWS;
				half4 TangentOS;
				half3 ViewDirWS;
				half4 VertexData;
				half4 MotionData;
				half4 BoundsData;
				half4 RotationData;
			};    
			      
			struct TVEGlobalData
			{      
				half Dummy;      
				half4 CoatParams;
				half4 PaintParams;
				half4 GlowParams;
				half4 AtmoParams;
				half4 FadeParams;
				half4 FormParams;
				half4 LandParams;
				half4 WindParams;
				half4 PushParams;
			};      
			        
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END
			//#pragma editor_sync_compilation


			struct AttributesMesh
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 texcoord : TEXCOORD0;
				float4 uv1 : TEXCOORD1;
				float4 uv2 : TEXCOORD2;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID

			};

			struct PackedVaryingsMeshToPS
			{
				float4 positionCS : SV_Position;
				float3 interp00 : TEXCOORD0;
				float3 interp01 : TEXCOORD1;
				float4 interp02 : TEXCOORD2;
				float4 interp03 : TEXCOORD3;
				float4 interp04 : TEXCOORD4;
				float4 UVsFrame122_g156549 : TEXCOORD5;
				float4 UVsFrame222_g156549 : TEXCOORD6;
				float4 UVsFrame322_g156549 : TEXCOORD7;
				float4 octaframe22_g156549 : TEXCOORD8;
				float4 viewPos22_g156549 : TEXCOORD9;
				float4 ase_texcoord10 : TEXCOORD10;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START( UnityPerMaterial )
			float4 _DrynessColor;
			half4 _ImpostorColor;
			half4 _ImpostorColorTwo;
			float4 _OverlayGlitterTex_ST;
			half4 _InteractionColoring;
			float4 _AI_SizeOffset;
			half4 _SizeFadeColoring;
			half4 _VariationColoring;
			half4 _VariationColorTwo;
			half4 _VariationColorOne;
			half4 _VariationNoiseRemap;
			half4 _DitherColoring;
			half4 _TintingColoring;
			float4 _TintingColor;
			half4 _TintingLumaRemap;
			half4 _DrynessColoring;
			half4 _CutoutColoring;
			half4 _WetnessColoring;
			half4 _OverlayColor;
			half4 _OverlayProjRemap;
			half4 _DrynessLumaRemap;
			half4 _OverlayLumaRemap;
			half4 _OverlayColoringOn;
			half4 _OverlayColoringOff;
			half4 _SubsurfaceColor;
			half4 _OverlayGlitterColor;
			half4 _EmissiveColor;
			float4 _SubsurfaceDiffusion_Asset;
			half4 _OverlayBlendRemap1;
			float3 _AI_Offset;
			half _GlobalEnd;
			half _CutoutMultiValue;
			half _CutoutAlphaValue;
			half _CutoutNoiseValue;
			half _CutoutNoiseTillingValue;
			half _DitherLiteInfo;
			half _ImpostorMetallicValue;
			half _EmissiveExposureValue;
			float _emissive_power_value;
			half _DitherEnd;
			half _ImpostorColorMode;
			half _DitherConstantValue;
			half _EmissiveIntensityValue;
			half _GlobalLiteInfo;
			half _DitherDistanceValue;
			half _DitherCategory;
			half _DitherDistanceMaxValue;
			half _CutoutShadowMode;
			half _CutoutElementMode;
			half _OverlayIntensityValue;
			half _WetnessCategory;
			half _WetnessEnd;
			half _WetnessElementMode;
			half _WetnessIntensityValue;
			half _WetnessContrastValue;
			half _CutoutIntensityValue;
			half _WetnessSmoothnessValue;
			half _OverlayLumaValue;
			half _CutoutCategory;
			half _CutoutEnd;
			half _SubsurfaceIntensityValue;
			half _CutoutSpace;
			half _ImpostorSmoothnessValue;
			half _CutoutLiteInfo;
			half _OverlayGlitterDistValue;
			half _DitherDistanceMinValue;
			half _DitherShadowMode;
			half _SubsurfaceAmbientValue;
			half _SubsurfaceShadowValue;
			half _SubsurfaceElementMode;
			half _EmissiveCategory;
			half _GlobalCategory;
			half _EmissiveEnd;
			half _SubsurfaceNormalValue;
			half _EmissivePowerMode;
			half _EmissiveElementMode;
			half _OverlayCategory;
			half _OverlayEnd;
			half _OverlaySpace;
			half _OverlayElementMode;
			half _OverlayBakeInfo;
			half _EmissivePowerValue;
			half _OverlaySubsurfaceValue;
			half _SubsurfaceDirectValue;
			half _SubsurfaceCategory;
			half _DitherMultiValue;
			half _DitherNoiseTillingValue;
			half _OverlayProjValue;
			half _OverlaySmoothnessValue;
			half _SizeFadeCategory;
			half _SizeFadeEnd;
			half _SubsurfaceEnd;
			half _SizeFadeElementMode;
			half _SizeFadeScaleMode;
			half _SizeFadeScaleValue;
			half _SizeFadeDistMinValue;
			half _OverlayNormalValue;
			half _WetnessLiteInfo;
			half _SizeFadeDistMaxValue;
			half _SizeFadeIntensityValue;
			half _SizeFadeLiteInfo;
			half _ImpostorAlphaClipValue;
			half _DrynessMultiValue;
			half _RenderMotion;
			half _RenderShadow;
			half _ImpostorCategory;
			half _IsImpostorShader;
			half _IsSubsurfaceShader;
			half _IsLiteShader;
			half _ImpostorEnd;
			half _MotionWindCategory;
			half _MotionWindEnd;
			half _MotionWindElementMode;
			half _MotionInteractionCategory;
			half _MotionInteractionEnd;
			half _InteractionLiteInfo;
			half _MotionPushIntensityValue;
			half _MotionPushPivotValue;
			half _MotionPushMaskValue;
			half _MotionPushElementMode;
			half _IsIdentifier;
			half _IsConverted;
			half _IsCollected;
			half _HasDefaultTextures;
			half _OverlayGlitterTillingValue;
			half _OverlayGlitterIntensityValue;
			half _OverlayLiteInfo;
			half _SubsurfaceScatteringValue;
			half _SubsurfaceAngleValue;
			float _SubsurfaceDiffusion;
			half _SubsurfaceSpace;
			half _IsVersion;
			float _AI_Frames;
			half _RenderDecals;
			half _CategoryRender;
			half _EndRender;
			half _NoiseCategory;
			half _NoiseEnd;
			half _IsInitialized;
			half _IsTVEShader;
			half _IsCustomShader;
			half _IsShared;
			half _RenderSSR;
			half _DrynessLumaValue;
			float _AI_FramesX;
			float _AI_ImpostorSize;
			half _TintingSpace;
			half _TintingElementMode;
			half _TintingIntensityValue;
			half _TintingGrayValue;
			half _TintingMultiValue;
			half _TintingLumaValue;
			half _DrynessLiteInfo;
			half _DrynessCategory;
			half _DrynessEnd;
			half _DrynessSpace;
			half _DrynessElementMode;
			half _DrynessIntensityValue;
			half _SubsurfaceMultiValue;
			half _DrynessGrayValue;
			half _DrynessShiftValue;
			half _DrynessSmoothnessValue;
			half _DrynessSubsurfaceValue;
			half _TintingEnd;
			half _TintingCategory;
			half _TintingLiteInfo;
			half _VariationNoiseTillingValue;
			float _AI_Parallax;
			float _AI_TextureBias;
			float _AI_DepthSize;
			float _AI_ShadowBias;
			float _AI_ShadowView;
			float _AI_Clip;
			half _MotionBaseIntensityValue;
			half _MotionBasePivotValue;
			float _AI_FramesY;
			half _MotionTillingValue;
			half _global_wind_layer_value;
			half _MotionDelayValue;
			half _VariationLiteInfo;
			half _VariationCategory;
			half _VariationEnd;
			half _VariationIntensityValue;
			half _VariationMultiValue;
			half _VariationNoisePivotsValue1;
			half _MotionIntensityValue;
			half _SubsurfaceThicknessValue;
			float _BlendMode;
			CBUFFER_END

			TEXTURE2D(_OverlayGlitterTex);
			SAMPLER(sampler_OverlayGlitterTex);
			TEXTURE3D(_NoiseTex3D);
			SAMPLER(sampler_NoiseTex3D);
			float4x4 unity_CameraProjection;
			float4x4 unity_CameraInvProjection;
			float4x4 unity_WorldToCamera;
			float4x4 unity_CameraToWorld;
			TEXTURE2D(_Albedo);
			SAMPLER(sampler_Albedo);
			TEXTURE2D(_Normals);
			SAMPLER(sampler_Normals);
			float3 TVE_WorldOrigin;
			TEXTURE2D(_MotionNoiseTex);
			SAMPLER(sampler_Linear_Repeat);
			float TVE_WindLayers[10];
			TEXTURE2D_ARRAY(TVE_WindBaseTex);
			half4 TVE_RenderBaseCoords;
			SAMPLER(sampler_Linear_Clamp);
			TEXTURE2D_ARRAY(TVE_WindNearTex);
			half4 TVE_RenderNearCoords;
			float4 TVE_RenderNearPositionR;
			half TVE_RenderNearFadeValue;
			half4 TVE_WindParams;
			half _DisableSRPBatcher;
			TEXTURE2D(_MasksA);
			TEXTURE2D(_MasksB);
			SAMPLER(sampler_MasksA);
			SAMPLER(sampler_MasksB);
			half4 TVE_CoatParams;
			half4 TVE_PaintParams;
			half4 TVE_GlowParams;
			half4 TVE_AtmoParams;
			half4 TVE_FormParams;
			half4 TVE_PushParams;
			half TVE_IsEnabled;


			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"

			float2 VectortoOctahedron( float3 N )
			{
				N /= dot( 1.0, abs( N ) );
				if( N.z <= 0 )
				{
				N.xy = ( 1 - abs( N.yx ) ) * ( N.xy >= 0 ? 1.0 : -1.0 );
				}
				return N.xy;
			}
			
			float3 OctahedronToVector( float2 Oct )
			{
				float3 N = float3( Oct, 1.0 - dot( 1.0, abs( Oct ) ) );
				if(N.z< 0 )
				{
				N.xy = ( 1 - abs( N.yx) ) * (N.xy >= 0 ? 1.0 : -1.0 );
				}
				return normalize( N);
			}
			
			inline void RayPlaneIntersectionUV( float3 normalOS, float3 rayPosition, float3 rayDirection, inout float2 uvs, inout float3 localNormal )
			{
				float lDotN = dot( rayDirection, normalOS ); 
				float p0l0DotN = dot( -rayPosition, normalOS );
				float t = p0l0DotN / lDotN;
				float3 p = rayDirection * t + rayPosition;
				float3 upVector = float3( 0, 1, 0 );
				float3 tangent = normalize( cross( upVector, normalOS ) + float3( -0.001, 0, 0 ) );
				float3 bitangent = cross( tangent, normalOS );
				float frameX = dot( p, tangent );
				float frameZ = dot( p, bitangent );
				uvs = -float2( frameX, frameZ );
				if( t <= 0.0 )
				uvs = 0;
				float3x3 worldToLocal = float3x3( tangent, bitangent, normalOS );
				localNormal = normalize( mul( worldToLocal, rayDirection ) );
			}
			
			inline void OctaImpostorVertex( inout float4 positionOS, inout float3 normalOS, inout float4 uvsFrame1, inout float4 uvsFrame2, inout float4 uvsFrame3, inout float4 octaFrame, inout float4 viewPos )
			{
				float2 uvOffset = _AI_SizeOffset.zw;
				float parallax = -_AI_Parallax; 
				float UVscale = _AI_ImpostorSize;
				float framesXY = _AI_Frames;
				float prevFrame = framesXY - 1;
				float3 fractions = 1.0 / float3( framesXY, prevFrame, UVscale );
				float fractionsFrame = fractions.x;
				float fractionsPrevFrame = fractions.y;
				float fractionsUVscale = fractions.z;
				float3 worldCameraPos;
				#if defined(UNITY_PASS_SHADOWCASTER)
				float3 worldOrigin = 0;
				float4 perspective = float4( 0, 0, 0, 1 );
				if ( UNITY_MATRIX_P[ 3 ][ 3 ] == 1 )
				{
				perspective = float4( 0, 0, 5000, 0 );
				worldOrigin = ai_ObjectToWorld._m03_m13_m23;
				}
				worldCameraPos = worldOrigin + mul( UNITY_MATRIX_I_V, perspective ).xyz;
				#else
				if ( UNITY_MATRIX_P[ 3 ][ 3 ] == 1 )
				{
				worldCameraPos = ai_ObjectToWorld._m03_m13_m23 + UNITY_MATRIX_I_V._m02_m12_m22 * 5000;
				}
				else
				{
				worldCameraPos = GetCameraRelativePositionWS( _WorldSpaceCameraPos );
				}
				#endif
				float3 objectCameraPosition = mul( ai_WorldToObject, float4( worldCameraPos, 1 ) ).xyz - _AI_Offset.xyz; 
				float3 objectCameraDirection = normalize( objectCameraPosition );
				float3 upVector = float3( 0,1,0 );
				float3 objectHorizontalVector = normalize( cross( objectCameraDirection, upVector ) );
				float3 objectVerticalVector = cross( objectHorizontalVector, objectCameraDirection );
				float2 uvExpansion = positionOS.xy;
				float3 billboard = objectHorizontalVector * uvExpansion.x + objectVerticalVector * uvExpansion.y;
				float3 localDir = billboard - objectCameraPosition; 
				objectCameraDirection = trunc( objectCameraDirection * 65536.0 ) / 65536.0;
				float2 frameOcta = VectortoOctahedron( objectCameraDirection.xzy ) * 0.5 + 0.5;
				float2 prevOctaFrame = frameOcta * prevFrame;
				float2 baseOctaFrame = floor( prevOctaFrame );
				float2 fractionOctaFrame = ( baseOctaFrame * fractionsFrame );
				float2 octaFrame1 = ( baseOctaFrame * fractionsPrevFrame ) * 2.0 - 1.0;
				float3 octa1WorldY = OctahedronToVector( octaFrame1 ).xzy;
				float3 octa1LocalY;
				float2 uvFrame1;
				RayPlaneIntersectionUV( octa1WorldY, objectCameraPosition, localDir, /*inout*/ uvFrame1, /*inout*/ octa1LocalY );
				float2 uvParallax1 = octa1LocalY.xy * fractionsFrame * parallax;
				uvFrame1 = ( uvFrame1 * fractionsUVscale + 0.5 ) * fractionsFrame + fractionOctaFrame;
				uvsFrame1 = float4( uvParallax1, uvFrame1) - float4( 0, 0, uvOffset );
				float2 fractPrevOctaFrame = frac( prevOctaFrame );
				float2 cornerDifference = lerp( float2( 0,1 ) , float2( 1,0 ) , saturate( ceil( ( fractPrevOctaFrame.x - fractPrevOctaFrame.y ) ) ));
				float2 octaFrame2 = ( ( baseOctaFrame + cornerDifference ) * fractionsPrevFrame ) * 2.0 - 1.0;
				float3 octa2WorldY = OctahedronToVector( octaFrame2 ).xzy;
				float3 octa2LocalY;
				float2 uvFrame2;
				RayPlaneIntersectionUV( octa2WorldY, objectCameraPosition, localDir, /*inout*/ uvFrame2, /*inout*/ octa2LocalY );
				float2 uvParallax2 = octa2LocalY.xy * fractionsFrame * parallax;
				uvFrame2 = ( uvFrame2 * fractionsUVscale + 0.5 ) * fractionsFrame + ( ( cornerDifference * fractionsFrame ) + fractionOctaFrame );
				uvsFrame2 = float4( uvParallax2, uvFrame2) - float4( 0, 0, uvOffset );
				float2 octaFrame3 = ( ( baseOctaFrame + 1 ) * fractionsPrevFrame  ) * 2.0 - 1.0;
				float3 octa3WorldY = OctahedronToVector( octaFrame3 ).xzy;
				float3 octa3LocalY;
				float2 uvFrame3;
				RayPlaneIntersectionUV( octa3WorldY, objectCameraPosition, localDir, /*inout*/ uvFrame3, /*inout*/ octa3LocalY );
				float2 uvParallax3 = octa3LocalY.xy * fractionsFrame * parallax;
				uvFrame3 = ( uvFrame3 * fractionsUVscale + 0.5 ) * fractionsFrame + ( fractionOctaFrame + fractionsFrame );
				uvsFrame3 = float4( uvParallax3, uvFrame3) - float4( 0, 0, uvOffset );
				octaFrame = 0;
				octaFrame.xy = prevOctaFrame;
				octaFrame.zw = fractionOctaFrame;
				positionOS.xyz = billboard + _AI_Offset.xyz;
				normalOS.xyz = objectCameraDirection;
				viewPos = 0;
				viewPos.xyz = TransformWorldToView( TransformObjectToWorld( positionOS.xyz ) );
			}
			
			float3 ObjectPosition_UNITY_MATRIX_M(  )
			{
				return float3(UNITY_MATRIX_M[0].w, UNITY_MATRIX_M[1].w, UNITY_MATRIX_M[2].w );
			}
			
			inline void OctaImpostorFragment( inout SurfaceOutput o, out float4 positionCS, out float3 positionWS, float4 uvsFrame1, float4 uvsFrame2, float4 uvsFrame3, float4 octaFrame, float4 interpViewPos, out float4 output0, out float4 output1 )
			{
				float depthBias = -1.0;
				float textureBias = _AI_TextureBias;
				float2 fraction = frac( octaFrame.xy );
				float2 invFraction = 1 - fraction;
				float3 weights;
				weights.x = min( invFraction.x, invFraction.y );
				weights.y = abs( fraction.x - fraction.y );
				weights.z = min( fraction.x, fraction.y );
				float4 parallaxSample1 = SAMPLE_TEXTURE2D_BIAS( _Normals, sampler_Normals, uvsFrame1.zw, depthBias );
				float2 parallax1 = ( ( 0.5 - parallaxSample1.a ) * uvsFrame1.xy ) + uvsFrame1.zw;
				float4 parallaxSample2 = SAMPLE_TEXTURE2D_BIAS( _Normals, sampler_Normals, uvsFrame2.zw, depthBias );
				float2 parallax2 = ( ( 0.5 - parallaxSample2.a ) * uvsFrame2.xy ) + uvsFrame2.zw;
				float4 parallaxSample3 = SAMPLE_TEXTURE2D_BIAS( _Normals, sampler_Normals, uvsFrame3.zw, depthBias );
				float2 parallax3 = ( ( 0.5 - parallaxSample3.a ) * uvsFrame3.xy ) + uvsFrame3.zw;
				float4 albedo1 = SAMPLE_TEXTURE2D_BIAS( _Albedo, sampler_Albedo, parallax1, textureBias );
				float4 albedo2 = SAMPLE_TEXTURE2D_BIAS( _Albedo, sampler_Albedo, parallax2, textureBias );
				float4 albedo3 = SAMPLE_TEXTURE2D_BIAS( _Albedo, sampler_Albedo, parallax3, textureBias );
				float4 blendedAlbedo = albedo1 * weights.x + albedo2 * weights.y + albedo3 * weights.z;
				o.Alpha = ( blendedAlbedo.a - _AI_Clip );
				clip( o.Alpha );
				float t = ceil( fraction.x - fraction.y );
				float4 cornerDifference = float4( t, 1 - t, 1, 1 );
				float2 step_1 = ( parallax1 - octaFrame.zw ) * _AI_Frames;
				float4 step23 = ( float4( parallax2, parallax3 ) -  octaFrame.zwzw ) * _AI_Frames - cornerDifference;
				step_1 = step_1 * (1-step_1);
				step23 = step23 * (1-step23);
				float3 steps;
				steps.x = step_1.x * step_1.y;
				steps.y = step23.x * step23.y;
				steps.z = step23.z * step23.w;
				steps = step(-steps, 0);
				float final = dot( steps, weights );
				clip( final - 0.5 );
				o.Albedo = blendedAlbedo.rgb;
				#if defined(AI_HD_RENDERPIPELINE)
				float4 feat1 = _Features.SampleLevel( SamplerState_Point_Repeat, parallax1, 0);
				o.Diffusion = feat1.rgb;
				o.Features = feat1.a;
				float4 test1 = _Specular.SampleLevel( SamplerState_Point_Repeat, parallax1, 0);
				o.MetalTangent = test1.b;
				#endif
				float4 normals1 = SAMPLE_TEXTURE2D_BIAS( _Normals, sampler_Normals, parallax1, textureBias );
				float4 normals2 = SAMPLE_TEXTURE2D_BIAS( _Normals, sampler_Normals, parallax2, textureBias );
				float4 normals3 = SAMPLE_TEXTURE2D_BIAS( _Normals, sampler_Normals, parallax3, textureBias );
				float4 blendedNormal = normals1 * weights.x  + normals2 * weights.y + normals3 * weights.z;
				float4 output0a = SAMPLE_TEXTURE2D_BIAS( _MasksA, sampler_MasksA, parallax1, textureBias );
				float4 output0b = SAMPLE_TEXTURE2D_BIAS( _MasksA, sampler_MasksA, parallax2, textureBias );
				float4 output0c = SAMPLE_TEXTURE2D_BIAS( _MasksA, sampler_MasksA, parallax3, textureBias );
				output0 = output0a * weights.x  + output0b * weights.y + output0c * weights.z; 
				float4 output1a = SAMPLE_TEXTURE2D_BIAS( _MasksB, sampler_MasksB, parallax1, textureBias );
				float4 output1b = SAMPLE_TEXTURE2D_BIAS( _MasksB, sampler_MasksB, parallax2, textureBias );
				float4 output1c = SAMPLE_TEXTURE2D_BIAS( _MasksB, sampler_MasksB, parallax3, textureBias );
				output1 = output1a * weights.x  + output1b * weights.y + output1c * weights.z; 
				float3 localNormal = blendedNormal.rgb * 2.0 - 1.0;
				float3 worldNormal = normalize( mul( (float3x3)ai_ObjectToWorld, localNormal ) );
				o.Normal = worldNormal;
				float3 viewPos = interpViewPos.xyz;
				float depthOffset = ( ( parallaxSample1.a * weights.x + parallaxSample2.a * weights.y + parallaxSample3.a * weights.z ) - 0.5 /** 2.0 - 1.0*/ ) /** 0.5*/ * _AI_DepthSize * length( ai_ObjectToWorld[ 2 ].xyz );
				#if ( defined(SHADERPASS) && ((defined(SHADERPASS_SHADOWS) && SHADERPASS == SHADERPASS_SHADOWS) || (defined(SHADERPASS_SHADOWCASTER) && SHADERPASS == SHADERPASS_SHADOWCASTER)) ) || defined(UNITY_PASS_SHADOWCASTER)
				viewPos.z += depthOffset * _AI_ShadowView;
				viewPos.z += -_AI_ShadowBias;
				#else 
				viewPos.z += depthOffset;
				#endif
				positionWS = mul( UNITY_MATRIX_I_V, float4( viewPos.xyz, 1 ) ).xyz;
				positionCS = mul( UNITY_MATRIX_P, float4( viewPos, 1 ) );
				#if defined(UNITY_PASS_SHADOWCASTER) && !defined(SHADERPASS)
				#if UNITY_REVERSED_Z
				positionCS.z = min( positionCS.z, positionCS.w * UNITY_NEAR_CLIP_VALUE );
				#else
				positionCS.z = max( positionCS.z, positionCS.w * UNITY_NEAR_CLIP_VALUE );
				#endif
				#endif
				positionCS.xyz /= positionCS.w;
				if( UNITY_NEAR_CLIP_VALUE < 0 )
				positionCS = positionCS * 0.5 + 0.5;
			}
			
			float3 ASEGetEmissionHDRColor(float3 ldrColor, float luminanceIntensity, float exposureWeight, float inverseCurrentExposureMultiplier)
			{
				float3 hdrColor = ldrColor * luminanceIntensity;
				hdrColor = lerp( hdrColor* inverseCurrentExposureMultiplier, hdrColor, exposureWeight);
				return hdrColor;
			}
			

			void BuildSurfaceData(FragInputs fragInputs, inout GlobalSurfaceDescription surfaceDescription, float3 V, out SurfaceData surfaceData, out float3 bentNormalWS)
			{
				ZERO_INITIALIZE(SurfaceData, surfaceData);

				surfaceData.baseColor =                 surfaceDescription.Albedo;
				surfaceData.perceptualSmoothness =      surfaceDescription.Smoothness;
				#ifdef _SPECULAR_OCCLUSION_CUSTOM
					surfaceData.specularOcclusion =         surfaceDescription.SpecularOcclusion;
				#endif
				surfaceData.ambientOcclusion =          surfaceDescription.Occlusion;
				surfaceData.metallic =                  surfaceDescription.Metallic;
				surfaceData.coatMask =                  surfaceDescription.CoatMask;

				#if defined( _MATERIAL_FEATURE_SUBSURFACE_SCATTERING ) || defined( _MATERIAL_FEATURE_TRANSMISSION )
					surfaceData.diffusionProfileHash = asuint(surfaceDescription.DiffusionProfile);
				#endif

				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
					surfaceData.iridescenceMask =           surfaceDescription.IridescenceMask;
					surfaceData.iridescenceThickness =      surfaceDescription.IridescenceThickness;
				#endif

					surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;
				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
					surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
				#endif
				#ifdef _MATERIAL_FEATURE_TRANSMISSION
					surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
				#endif
				#ifdef _MATERIAL_FEATURE_ANISOTROPY
					surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;
				#endif

				#ifdef ASE_LIT_CLEAR_COAT
					surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_CLEAR_COAT;
				#endif

				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
					surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
				#endif
				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
					surfaceData.specularColor = surfaceDescription.Specular;
					surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
				#endif

				#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
					surfaceData.baseColor *= (1.0 - Max3(surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b));
				#endif

					GetNormalWS( fragInputs, float3( 0.0, 0.0, 1.0 ), surfaceData.normalWS, float3( 1.0, 1.0, 1.0 ) );

					bentNormalWS = surfaceData.normalWS;

				#ifdef ASE_BENT_NORMAL
					GetNormalWS(fragInputs, surfaceDescription.BentNormal, bentNormalWS, float3( 1, 1, 1 ) );
				#endif

				surfaceData.geomNormalWS = T2W(fragInputs, 2);

				#if defined(_HAS_REFRACTION) || defined(_MATERIAL_FEATURE_TRANSMISSION)
					surfaceData.thickness =	                 surfaceDescription.Thickness;
				#endif

				#ifdef _HAS_REFRACTION
					if (_EnableSSRefraction)
					{
						surfaceData.ior =                       surfaceDescription.RefractionIndex;
						surfaceData.transmittanceColor =        surfaceDescription.RefractionColor;
						surfaceData.atDistance =                surfaceDescription.RefractionDistance;

						surfaceData.transmittanceMask = (1.0 - surfaceDescription.Alpha);
						surfaceDescription.Alpha = 1.0;
					}
					else
					{
						surfaceData.ior = 1.0;
						surfaceData.transmittanceColor = float3(1.0, 1.0, 1.0);
						surfaceData.atDistance = 1.0;
						surfaceData.transmittanceMask = 0.0;
						surfaceDescription.Alpha = 1.0;
					}
				#else
					surfaceData.ior = 1.0;
					surfaceData.transmittanceColor = float3(1.0, 1.0, 1.0);
					surfaceData.atDistance = 1.0;
					surfaceData.transmittanceMask = 0.0;
				#endif

				#if defined(_HAS_REFRACTION) || defined(_MATERIAL_FEATURE_TRANSMISSION)
					surfaceData.thickness =	surfaceDescription.Thickness;
				#endif

				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
					surfaceData.subsurfaceMask = surfaceDescription.SubsurfaceMask;
				#endif

				#ifdef _MATERIAL_FEATURE_TRANSMISSION
					surfaceData.transmissionMask = surfaceDescription.TransmissionMask;
				#endif

				#if defined( _MATERIAL_FEATURE_SUBSURFACE_SCATTERING ) || defined( _MATERIAL_FEATURE_TRANSMISSION )
					surfaceData.diffusionProfileHash = asuint(surfaceDescription.DiffusionProfile);					
				#endif

					surfaceData.tangentWS = normalize(T2W(fragInputs, 0).xyz);    // The tangent is not normalize in worldToTangent for mikkt. TODO: Check if it expected that we normalize with Morten. Tag: SURFACE_GRADIENT
				#ifdef _MATERIAL_FEATURE_ANISOTROPY
					surfaceData.anisotropy = surfaceDescription.Anisotropy;
					surfaceData.tangentWS = TransformTangentToWorld(surfaceDescription.Tangent, fragInputs.worldToTangent);
				#endif
					surfaceData.tangentWS = Orthonormalize(surfaceData.tangentWS, surfaceData.normalWS);

				#if defined(_SPECULAR_OCCLUSION_CUSTOM)
				#elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
					surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO(V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness(surfaceData.perceptualSmoothness));
				#elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
					surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion(ClampNdotV(dot(surfaceData.normalWS, V)), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness(surfaceData.perceptualSmoothness));
				#else
					surfaceData.specularOcclusion = 1.0;
				#endif
				#ifdef _ENABLE_GEOMETRIC_SPECULAR_AA
					surfaceData.perceptualSmoothness = GeometricNormalFiltering(surfaceData.perceptualSmoothness, T2W(fragInputs, 2), surfaceDescription.SpecularAAScreenSpaceVariance, surfaceDescription.SpecularAAThreshold);
				#endif
			}

			void GetSurfaceAndBuiltinData(GlobalSurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
			{
				//#ifdef LOD_FADE_CROSSFADE
				//	uint3 fadeMaskSeed = asuint((int3)(V * _ScreenSize.xyx));
				//	LODDitheringTransition(fadeMaskSeed, unity_LODFade.x);
				//#endif

				#ifdef _ALPHATEST_ON
					DoAlphaTest(surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold);
				#endif

				float3 bentNormalWS;
				BuildSurfaceData(fragInputs, surfaceDescription, V, surfaceData, bentNormalWS);

				#if HAVE_DECALS
				if( _EnableDecals )
				{
					DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, surfaceDescription.Alpha);
					ApplyDecalToSurfaceData(decalSurfaceData, fragInputs.tangentToWorld[2], surfaceData);
				}
				#endif

				//#if defined( ASE_SRP_VERSION ) && ASE_SRP_VERSION <= 50702
					//InitBuiltinData( surfaceDescription.Alpha, bentNormalWS, -T2W(fragInputs, 2), fragInputs.positionRWS, fragInputs.texCoord1, fragInputs.texCoord2, builtinData );
				//#else
					InitBuiltinData( posInput, surfaceDescription.Alpha, bentNormalWS, -T2W(fragInputs, 2), fragInputs.texCoord1, fragInputs.texCoord2, builtinData );
				//#endif

				builtinData.emissiveColor = surfaceDescription.Emission;

				builtinData.depthOffset = 0.0;

				#if (SHADERPASS == SHADERPASS_DISTORTION)
					builtinData.distortion = surfaceDescription.Distortion;
					builtinData.distortionBlur = surfaceDescription.DistortionBlur;
				#else
					builtinData.distortion = float2(0.0, 0.0);
					builtinData.distortionBlur = 0.0;
				#endif

				PostInitBuiltinData(V, posInput, surfaceData, builtinData);
			}

			PackedVaryingsMeshToPS Vert(AttributesMesh inputMesh )
			{
				PackedVaryingsMeshToPS outputPackedVaryingsMeshToPS;

				UNITY_SETUP_INSTANCE_ID( inputMesh );
				UNITY_TRANSFER_INSTANCE_ID( inputMesh, outputPackedVaryingsMeshToPS );
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( outputPackedVaryingsMeshToPS );

				TVEModelData Data16_g158299 = (TVEModelData)0;
				float In_Dummy16_g158299 = 0.0;
				TVEModelData Data16_g158264 = (TVEModelData)0;
				half4 Dummy181_g158262 = ( ( _MotionWindCategory + _MotionWindEnd ) + _MotionWindElementMode + ( _MotionInteractionCategory + _MotionInteractionEnd ) + ( _InteractionLiteInfo + _InteractionColoring + _MotionPushIntensityValue + _MotionPushPivotValue + _MotionPushMaskValue + _MotionPushElementMode ) );
				float In_Dummy16_g158264 = Dummy181_g158262.r;
				TVEModelData Data16_g157153 = (TVEModelData)0;
				float In_Dummy16_g157153 = 0.0;
				OctaImpostorVertex( inputMesh.positionOS, inputMesh.normalOS, outputPackedVaryingsMeshToPS.UVsFrame122_g156549, outputPackedVaryingsMeshToPS.UVsFrame222_g156549, outputPackedVaryingsMeshToPS.UVsFrame322_g156549, outputPackedVaryingsMeshToPS.octaframe22_g156549, outputPackedVaryingsMeshToPS.viewPos22_g156549 );
				float3 worldPosOut22_g156549 = GetAbsolutePositionWS( mul( UNITY_MATRIX_I_V, float4( outputPackedVaryingsMeshToPS.viewPos22_g156549.xyz, 1.0 ) ).xyz );
				half3 Input_PositionWS218_g157146 = worldPosOut22_g156549;
				float3 worldToObj278_g157146 = mul( GetWorldToObjectMatrix(), float4( GetCameraRelativePositionWS(Input_PositionWS218_g157146), 1 ) ).xyz;
				half3 Model_PositionOS131_g157146 = worldToObj278_g157146;
				float3 In_PositionOS16_g157153 = Model_PositionOS131_g157146;
				half3 Model_PositionWS122_g157146 = Input_PositionWS218_g157146;
				float3 In_PositionWS16_g157153 = Model_PositionWS122_g157146;
				half3 Model_PositionWO132_g157146 = ( Model_PositionWS122_g157146 - TVE_WorldOrigin );
				float3 In_PositionWO16_g157153 = Model_PositionWO132_g157146;
				float3 In_PositionRawOS16_g157153 = Model_PositionOS131_g157146;
				float3 In_PositionAddOS16_g157153 = float3( 0,0,0 );
				float3 In_PivotOS16_g157153 = float3( 0,0,0 );
				float3 localObjectPosition_UNITY_MATRIX_M14_g157148 = ObjectPosition_UNITY_MATRIX_M();
				#ifdef SHADEROPTIONS_CAMERA_RELATIVE_RENDERING
				float3 staticSwitch13_g157148 = ( localObjectPosition_UNITY_MATRIX_M14_g157148 + _WorldSpaceCameraPos );
				#else
				float3 staticSwitch13_g157148 = localObjectPosition_UNITY_MATRIX_M14_g157148;
				#endif
				half3 ObjectData20_g157150 = staticSwitch13_g157148;
				float3 ase_worldPos = GetAbsolutePositionWS( TransformObjectToWorld( (inputMesh.positionOS).xyz ) );
				half3 WorldData19_g157150 = ase_worldPos;
				#ifdef TVE_OBJECT_BATCHED
				float3 staticSwitch14_g157150 = WorldData19_g157150;
				#else
				float3 staticSwitch14_g157150 = ObjectData20_g157150;
				#endif
				float3 temp_output_124_0_g157148 = staticSwitch14_g157150;
				float3 vertexToFrag281_g157146 = temp_output_124_0_g157148;
				half3 Model_PivotWS121_g157146 = vertexToFrag281_g157146;
				float3 In_PivotWS16_g157153 = Model_PivotWS121_g157146;
				half3 Model_PivotWO133_g157146 = ( Model_PivotWS121_g157146 - TVE_WorldOrigin );
				float3 In_PivotWO16_g157153 = Model_PivotWO133_g157146;
				half3 Model_NormalOS134_g157146 = inputMesh.normalOS;
				float3 In_NormalOS16_g157153 = Model_NormalOS134_g157146;
				float3 ase_worldNormal = TransformObjectToWorldNormal(inputMesh.normalOS);
				half3 Model_Normal_WS95_g157146 = ase_worldNormal;
				float3 In_NormalWS16_g157153 = Model_Normal_WS95_g157146;
				float3 In_NormalRawOS16_g157153 = Model_NormalOS134_g157146;
				float3 In_NormalRawWS16_g157153 = Model_Normal_WS95_g157146;
				float4 In_TangentOS16_g157153 = float4( 0,1,0,1 );
				float3 normalizeResult326_g157146 = normalize( ( _WorldSpaceCameraPos - Model_PositionWS122_g157146 ) );
				half3 Model_ViewDirWS322_g157146 = normalizeResult326_g157146;
				float3 In_ViewDirWS16_g157153 = Model_ViewDirWS322_g157146;
				float4 In_VertexData16_g157153 = float4( 1,1,1,1 );
				float4 In_MotionData16_g157153 = float4( 0,0,0,0 );
				float4 In_BoundsData16_g157153 = float4( 1,1,1,1 );
				float4 In_RotationData16_g157153 = float4( 0,0,0,0 );
				Data16_g157153.Dummy = In_Dummy16_g157153;
				Data16_g157153.PositionOS = In_PositionOS16_g157153;
				Data16_g157153.PositionWS = In_PositionWS16_g157153;
				Data16_g157153.PositionWO = In_PositionWO16_g157153;
				Data16_g157153.PositionRawOS = In_PositionRawOS16_g157153;
				Data16_g157153.PositionAddOS = In_PositionAddOS16_g157153;
				Data16_g157153.PivotOS = In_PivotOS16_g157153;
				Data16_g157153.PivotWS = In_PivotWS16_g157153;
				Data16_g157153.PivotWO = In_PivotWO16_g157153;
				Data16_g157153.NormalOS = In_NormalOS16_g157153;
				Data16_g157153.NormalWS = In_NormalWS16_g157153;
				Data16_g157153.NormalRawOS = In_NormalRawOS16_g157153;
				Data16_g157153.NormalRawWS = In_NormalRawWS16_g157153;
				Data16_g157153.TangentOS = In_TangentOS16_g157153;
				Data16_g157153.ViewDirWS = In_ViewDirWS16_g157153;
				Data16_g157153.VertexData = In_VertexData16_g157153;
				Data16_g157153.MotionData = In_MotionData16_g157153;
				Data16_g157153.BoundsData = In_BoundsData16_g157153;
				Data16_g157153.RotationData = In_RotationData16_g157153;
				TVEModelData Data15_g158263 = Data16_g157153;
				float Out_Dummy15_g158263 = 0;
				float3 Out_PositionOS15_g158263 = float3( 0,0,0 );
				float3 Out_PositionWS15_g158263 = float3( 0,0,0 );
				float3 Out_PositionWO15_g158263 = float3( 0,0,0 );
				float3 Out_PositionRawOS15_g158263 = float3( 0,0,0 );
				float3 Out_PositionAddOS15_g158263 = float3( 0,0,0 );
				float3 Out_PivotOS15_g158263 = float3( 0,0,0 );
				float3 Out_PivotWS15_g158263 = float3( 0,0,0 );
				float3 Out_PivotWO15_g158263 = float3( 0,0,0 );
				float3 Out_NormalOS15_g158263 = float3( 0,0,0 );
				float3 Out_NormalWS15_g158263 = float3( 0,0,0 );
				float3 Out_NormalRawOS15_g158263 = float3( 0,0,0 );
				float3 Out_NormalRawWS15_g158263 = float3( 0,0,0 );
				float4 Out_TangentOS15_g158263 = float4( 0,0,0,0 );
				float3 Out_ViewDirWS15_g158263 = float3( 0,0,0 );
				float4 Out_VertexData15_g158263 = float4( 0,0,0,0 );
				float4 Out_MotionData15_g158263 = float4( 0,0,0,0 );
				float4 Out_BoundsData15_g158263 = float4( 0,0,0,0 );
				float4 Out_RotationData15_g158263 = float4( 0,0,0,0 );
				Out_Dummy15_g158263 = Data15_g158263.Dummy;
				Out_PositionOS15_g158263 = Data15_g158263.PositionOS;
				Out_PositionWS15_g158263 = Data15_g158263.PositionWS;
				Out_PositionWO15_g158263 = Data15_g158263.PositionWO;
				Out_PositionRawOS15_g158263 = Data15_g158263.PositionRawOS;
				Out_PositionAddOS15_g158263 = Data15_g158263.PositionAddOS;
				Out_PivotOS15_g158263 = Data15_g158263.PivotOS;
				Out_PivotWS15_g158263 = Data15_g158263.PivotWS;
				Out_PivotWO15_g158263 = Data15_g158263.PivotWO;
				Out_NormalOS15_g158263 = Data15_g158263.NormalOS;
				Out_NormalWS15_g158263 = Data15_g158263.NormalWS;
				Out_NormalRawOS15_g158263 = Data15_g158263.NormalRawOS;
				Out_NormalRawWS15_g158263 = Data15_g158263.NormalRawWS;
				Out_TangentOS15_g158263 = Data15_g158263.TangentOS;
				Out_ViewDirWS15_g158263 = Data15_g158263.ViewDirWS;
				Out_VertexData15_g158263 = Data15_g158263.VertexData;
				Out_MotionData15_g158263 = Data15_g158263.MotionData;
				Out_BoundsData15_g158263 = Data15_g158263.BoundsData;
				Out_RotationData15_g158263 = Data15_g158263.RotationData;
				float3 temp_output_1567_0_g158262 = Out_PositionOS15_g158263;
				float3 In_PositionOS16_g158264 = temp_output_1567_0_g158262;
				float3 In_PositionWS16_g158264 = Out_PositionWS15_g158263;
				float3 temp_output_1567_17_g158262 = Out_PositionWO15_g158263;
				float3 In_PositionWO16_g158264 = temp_output_1567_17_g158262;
				float3 In_PositionRawOS16_g158264 = Out_PositionRawOS15_g158263;
				float3 In_PositionAddOS16_g158264 = Out_PositionAddOS15_g158263;
				float3 In_PivotOS16_g158264 = Out_PivotOS15_g158263;
				float3 In_PivotWS16_g158264 = Out_PivotWS15_g158263;
				float3 temp_output_1567_19_g158262 = Out_PivotWO15_g158263;
				float3 In_PivotWO16_g158264 = temp_output_1567_19_g158262;
				float3 In_NormalOS16_g158264 = Out_NormalOS15_g158263;
				float3 In_NormalWS16_g158264 = Out_NormalWS15_g158263;
				float3 In_NormalRawOS16_g158264 = Out_NormalRawOS15_g158263;
				float3 In_NormalRawWS16_g158264 = Out_NormalRawWS15_g158263;
				float4 In_TangentOS16_g158264 = Out_TangentOS15_g158263;
				float3 In_ViewDirWS16_g158264 = Out_ViewDirWS15_g158263;
				float4 In_VertexData16_g158264 = Out_VertexData15_g158263;
				float4 In_MotionData16_g158264 = Out_MotionData15_g158263;
				float4 In_BoundsData16_g158264 = Out_BoundsData15_g158263;
				float2 temp_cast_1 = (0.0).xx;
				half3 Model_PositionOS147_g158262 = temp_output_1567_0_g158262;
				half Base_Mask217_g158262 = saturate( ( Model_PositionOS147_g158262.y / _AI_Offset.y ) );
				half3 Model_PositionWO162_g158262 = temp_output_1567_17_g158262;
				half3 Model_PivotWO402_g158262 = temp_output_1567_19_g158262;
				float3 lerpResult829_g158262 = lerp( Model_PositionWO162_g158262 , Model_PivotWO402_g158262 , _MotionBasePivotValue);
				half3 Base_Position1394_g158262 = lerpResult829_g158262;
				half3 Input_PositionWO419_g158267 = Base_Position1394_g158262;
				half Flow_Tillling1397_g158262 = _MotionTillingValue;
				half Input_MotionTilling321_g158267 = ( Flow_Tillling1397_g158262 + 0.2 );
				half2 Noise_Coord515_g158267 = ( -(Input_PositionWO419_g158267).xz * Input_MotionTilling321_g158267 * 0.005 );
				half4 Noise_Params535_g158267 = SAMPLE_TEXTURE2D_LOD( _MotionNoiseTex, sampler_Linear_Repeat, Noise_Coord515_g158267, 0.0 );
				float2 temp_output_648_0_g158267 = (Noise_Params535_g158267).rg;
				half Flow_Value1602_g158262 = _MotionIntensityValue;
				half Input_MotionValue629_g158267 = Flow_Value1602_g158262;
				float2 lerpResult645_g158267 = lerp( float2( 0.5,0.5 ) , temp_output_648_0_g158267 , Input_MotionValue629_g158267);
				float3 appendResult566_g158267 = (float3(lerpResult645_g158267 , (Noise_Params535_g158267).b));
				float temp_output_136_0_g158268 = _global_wind_layer_value;
				float temp_output_19_0_g158270 = TVE_WindLayers[(int)temp_output_136_0_g158268];
				half3 Input_Position180_g158271 = Input_PositionWO419_g158267;
				float2 temp_output_75_0_g158271 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g158271).xz ) );
				float temp_output_82_0_g158271 = temp_output_136_0_g158268;
				float2 temp_output_119_0_g158271 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g158271).xz ) );
				float temp_output_7_0_g158276 = 1.0;
				float temp_output_10_0_g158276 = ( TVE_RenderNearFadeValue - temp_output_7_0_g158276 );
				float4 lerpResult131_g158271 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_WindBaseTex, sampler_Linear_Clamp, temp_output_75_0_g158271,temp_output_82_0_g158271, 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_WindNearTex, sampler_Linear_Repeat, temp_output_119_0_g158271,temp_output_82_0_g158271, 0.0 ) , saturate( ( ( saturate( ( distance( Input_Position180_g158271 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g158276 ) / temp_output_10_0_g158276 ) ));
				float4 temp_output_17_0_g158270 = lerpResult131_g158271;
				float4 temp_output_3_0_g158270 = TVE_WindParams;
				float4 ifLocalVar18_g158270 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g158270 >= 0.5 )
				ifLocalVar18_g158270 = temp_output_17_0_g158270;
				else
				ifLocalVar18_g158270 = temp_output_3_0_g158270;
				float4 lerpResult22_g158270 = lerp( temp_output_3_0_g158270 , temp_output_17_0_g158270 , temp_output_19_0_g158270);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g158270 = lerpResult22_g158270;
				#else
				float4 staticSwitch24_g158270 = ifLocalVar18_g158270;
				#endif
				float4 temp_output_610_0_g158267 = staticSwitch24_g158270;
				float3 appendResult643_g158267 = (float3((temp_output_610_0_g158267).rg , (temp_output_610_0_g158267).b));
				float3 lerpResult623_g158267 = lerp( appendResult566_g158267 , appendResult643_g158267 , (temp_output_610_0_g158267).a);
				#ifdef TVE_MOTION_WIND_ELEMENT
				float3 staticSwitch612_g158267 = lerpResult623_g158267;
				#else
				float3 staticSwitch612_g158267 = appendResult566_g158267;
				#endif
				float3 temp_output_1620_567_g158262 = staticSwitch612_g158267;
				half Base_Noise1590_g158262 = (temp_output_1620_567_g158262).z;
				float2 break83_g158266 = ((temp_output_1620_567_g158262).xy*2.0 + -1.0);
				float3 appendResult79_g158266 = (float3(break83_g158266.x , 0.0 , break83_g158266.y));
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				half2 Base_Direction893_g158262 = (( mul( GetWorldToObjectMatrix(), float4( appendResult79_g158266 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half Base_Intensity1615_g158262 = length( Base_Direction893_g158262 );
				half Flow_Delay1626_g158262 = _MotionDelayValue;
				float lerpResult1623_g158262 = lerp( 1.0 , ( Base_Intensity1615_g158262 * Base_Intensity1615_g158262 ) , Flow_Delay1626_g158262);
				#ifdef TVE_MOTION_BASE_BENDING
				float2 staticSwitch1573_g158262 = ( _MotionBaseIntensityValue * Base_Mask217_g158262 * Base_Noise1590_g158262 * Base_Direction893_g158262 * lerpResult1623_g158262 );
				#else
				float2 staticSwitch1573_g158262 = temp_cast_1;
				#endif
				half2 Base_Motion1440_g158262 = staticSwitch1573_g158262;
				half2 Final_RoationData1570_g158262 = Base_Motion1440_g158262;
				float4 In_RotationData16_g158264 = float4( Final_RoationData1570_g158262, 0.0 , 0.0 );
				Data16_g158264.Dummy = In_Dummy16_g158264;
				Data16_g158264.PositionOS = In_PositionOS16_g158264;
				Data16_g158264.PositionWS = In_PositionWS16_g158264;
				Data16_g158264.PositionWO = In_PositionWO16_g158264;
				Data16_g158264.PositionRawOS = In_PositionRawOS16_g158264;
				Data16_g158264.PositionAddOS = In_PositionAddOS16_g158264;
				Data16_g158264.PivotOS = In_PivotOS16_g158264;
				Data16_g158264.PivotWS = In_PivotWS16_g158264;
				Data16_g158264.PivotWO = In_PivotWO16_g158264;
				Data16_g158264.NormalOS = In_NormalOS16_g158264;
				Data16_g158264.NormalWS = In_NormalWS16_g158264;
				Data16_g158264.NormalRawOS = In_NormalRawOS16_g158264;
				Data16_g158264.NormalRawWS = In_NormalRawWS16_g158264;
				Data16_g158264.TangentOS = In_TangentOS16_g158264;
				Data16_g158264.ViewDirWS = In_ViewDirWS16_g158264;
				Data16_g158264.VertexData = In_VertexData16_g158264;
				Data16_g158264.MotionData = In_MotionData16_g158264;
				Data16_g158264.BoundsData = In_BoundsData16_g158264;
				Data16_g158264.RotationData = In_RotationData16_g158264;
				TVEModelData Data15_g158298 = Data16_g158264;
				float Out_Dummy15_g158298 = 0;
				float3 Out_PositionOS15_g158298 = float3( 0,0,0 );
				float3 Out_PositionWS15_g158298 = float3( 0,0,0 );
				float3 Out_PositionWO15_g158298 = float3( 0,0,0 );
				float3 Out_PositionRawOS15_g158298 = float3( 0,0,0 );
				float3 Out_PositionAddOS15_g158298 = float3( 0,0,0 );
				float3 Out_PivotOS15_g158298 = float3( 0,0,0 );
				float3 Out_PivotWS15_g158298 = float3( 0,0,0 );
				float3 Out_PivotWO15_g158298 = float3( 0,0,0 );
				float3 Out_NormalOS15_g158298 = float3( 0,0,0 );
				float3 Out_NormalWS15_g158298 = float3( 0,0,0 );
				float3 Out_NormalRawOS15_g158298 = float3( 0,0,0 );
				float3 Out_NormalRawWS15_g158298 = float3( 0,0,0 );
				float4 Out_TangentOS15_g158298 = float4( 0,0,0,0 );
				float3 Out_ViewDirWS15_g158298 = float3( 0,0,0 );
				float4 Out_VertexData15_g158298 = float4( 0,0,0,0 );
				float4 Out_MotionData15_g158298 = float4( 0,0,0,0 );
				float4 Out_BoundsData15_g158298 = float4( 0,0,0,0 );
				float4 Out_RotationData15_g158298 = float4( 0,0,0,0 );
				Out_Dummy15_g158298 = Data15_g158298.Dummy;
				Out_PositionOS15_g158298 = Data15_g158298.PositionOS;
				Out_PositionWS15_g158298 = Data15_g158298.PositionWS;
				Out_PositionWO15_g158298 = Data15_g158298.PositionWO;
				Out_PositionRawOS15_g158298 = Data15_g158298.PositionRawOS;
				Out_PositionAddOS15_g158298 = Data15_g158298.PositionAddOS;
				Out_PivotOS15_g158298 = Data15_g158298.PivotOS;
				Out_PivotWS15_g158298 = Data15_g158298.PivotWS;
				Out_PivotWO15_g158298 = Data15_g158298.PivotWO;
				Out_NormalOS15_g158298 = Data15_g158298.NormalOS;
				Out_NormalWS15_g158298 = Data15_g158298.NormalWS;
				Out_NormalRawOS15_g158298 = Data15_g158298.NormalRawOS;
				Out_NormalRawWS15_g158298 = Data15_g158298.NormalRawWS;
				Out_TangentOS15_g158298 = Data15_g158298.TangentOS;
				Out_ViewDirWS15_g158298 = Data15_g158298.ViewDirWS;
				Out_VertexData15_g158298 = Data15_g158298.VertexData;
				Out_MotionData15_g158298 = Data15_g158298.MotionData;
				Out_BoundsData15_g158298 = Data15_g158298.BoundsData;
				Out_RotationData15_g158298 = Data15_g158298.RotationData;
				half3 Model_PositionOS147_g158297 = Out_PositionOS15_g158298;
				half3 Input_False58_g158303 = Model_PositionOS147_g158297;
				half3 VertexPos40_g158300 = Model_PositionOS147_g158297;
				half3 VertexPos40_g158301 = VertexPos40_g158300;
				float3 appendResult74_g158301 = (float3(VertexPos40_g158301.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g158301 = appendResult74_g158301;
				float3 break84_g158301 = VertexPos40_g158301;
				float3 appendResult81_g158301 = (float3(0.0 , break84_g158301.y , break84_g158301.z));
				half3 VertexPosOtherAxis82_g158301 = appendResult81_g158301;
				float4 temp_output_1567_33_g158297 = Out_RotationData15_g158298;
				half4 Model_VertexBend1569_g158297 = temp_output_1567_33_g158297;
				half2 Angle44_g158300 = (Model_VertexBend1569_g158297).xy;
				half Angle44_g158301 = (Angle44_g158300).y;
				half3 VertexPos40_g158302 = ( VertexPosRotationAxis50_g158301 + ( VertexPosOtherAxis82_g158301 * cos( Angle44_g158301 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g158301 ) * sin( Angle44_g158301 ) ) );
				float3 appendResult74_g158302 = (float3(0.0 , 0.0 , VertexPos40_g158302.z));
				half3 VertexPosRotationAxis50_g158302 = appendResult74_g158302;
				float3 break84_g158302 = VertexPos40_g158302;
				float3 appendResult81_g158302 = (float3(break84_g158302.x , break84_g158302.y , 0.0));
				half3 VertexPosOtherAxis82_g158302 = appendResult81_g158302;
				half Angle44_g158302 = -(Angle44_g158300).x;
				half3 Input_True57_g158303 = ( VertexPosRotationAxis50_g158302 + ( VertexPosOtherAxis82_g158302 * cos( Angle44_g158302 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g158302 ) * sin( Angle44_g158302 ) ) );
				#ifdef TVE_MOTION_BASE_BENDING
				float3 staticSwitch65_g158303 = Input_True57_g158303;
				#else
				float3 staticSwitch65_g158303 = Input_False58_g158303;
				#endif
				#ifdef TVE_MOTION_PUSH_BENDING
				float3 staticSwitch67_g158303 = Input_True57_g158303;
				#else
				float3 staticSwitch67_g158303 = staticSwitch65_g158303;
				#endif
				#ifdef TVE_BLANKET_BENDING
				float3 staticSwitch69_g158303 = Input_True57_g158303;
				#else
				float3 staticSwitch69_g158303 = staticSwitch67_g158303;
				#endif
				float3 temp_output_1578_0_g158297 = staticSwitch69_g158303;
				float3 temp_output_1567_31_g158297 = Out_PositionAddOS15_g158298;
				half3 Model_PositionADD1568_g158297 = temp_output_1567_31_g158297;
				half3 Final_PositionOS178_g158297 = ( temp_output_1578_0_g158297 + Model_PositionADD1568_g158297 );
				float3 In_PositionOS16_g158299 = Final_PositionOS178_g158297;
				float3 In_PositionWS16_g158299 = Out_PositionWS15_g158298;
				float3 In_PositionWO16_g158299 = Out_PositionWO15_g158298;
				float3 In_PositionRawOS16_g158299 = Out_PositionRawOS15_g158298;
				float3 In_PositionAddOS16_g158299 = temp_output_1567_31_g158297;
				float3 In_PivotOS16_g158299 = Out_PivotOS15_g158298;
				float3 In_PivotWS16_g158299 = Out_PivotWS15_g158298;
				float3 In_PivotWO16_g158299 = Out_PivotWO15_g158298;
				float3 In_NormalOS16_g158299 = Out_NormalOS15_g158298;
				float3 In_NormalWS16_g158299 = Out_NormalWS15_g158298;
				float3 In_NormalRawOS16_g158299 = Out_NormalRawOS15_g158298;
				float3 In_NormalRawWS16_g158299 = Out_NormalRawWS15_g158298;
				float4 In_TangentOS16_g158299 = Out_TangentOS15_g158298;
				float3 In_ViewDirWS16_g158299 = Out_ViewDirWS15_g158298;
				float4 In_VertexData16_g158299 = Out_VertexData15_g158298;
				float4 In_MotionData16_g158299 = Out_MotionData15_g158298;
				float4 In_BoundsData16_g158299 = Out_BoundsData15_g158298;
				float4 In_RotationData16_g158299 = temp_output_1567_33_g158297;
				Data16_g158299.Dummy = In_Dummy16_g158299;
				Data16_g158299.PositionOS = In_PositionOS16_g158299;
				Data16_g158299.PositionWS = In_PositionWS16_g158299;
				Data16_g158299.PositionWO = In_PositionWO16_g158299;
				Data16_g158299.PositionRawOS = In_PositionRawOS16_g158299;
				Data16_g158299.PositionAddOS = In_PositionAddOS16_g158299;
				Data16_g158299.PivotOS = In_PivotOS16_g158299;
				Data16_g158299.PivotWS = In_PivotWS16_g158299;
				Data16_g158299.PivotWO = In_PivotWO16_g158299;
				Data16_g158299.NormalOS = In_NormalOS16_g158299;
				Data16_g158299.NormalWS = In_NormalWS16_g158299;
				Data16_g158299.NormalRawOS = In_NormalRawOS16_g158299;
				Data16_g158299.NormalRawWS = In_NormalRawWS16_g158299;
				Data16_g158299.TangentOS = In_TangentOS16_g158299;
				Data16_g158299.ViewDirWS = In_ViewDirWS16_g158299;
				Data16_g158299.VertexData = In_VertexData16_g158299;
				Data16_g158299.MotionData = In_MotionData16_g158299;
				Data16_g158299.BoundsData = In_BoundsData16_g158299;
				Data16_g158299.RotationData = In_RotationData16_g158299;
				TVEModelData Data15_g158319 = Data16_g158299;
				float Out_Dummy15_g158319 = 0;
				float3 Out_PositionOS15_g158319 = float3( 0,0,0 );
				float3 Out_PositionWS15_g158319 = float3( 0,0,0 );
				float3 Out_PositionWO15_g158319 = float3( 0,0,0 );
				float3 Out_PositionRawOS15_g158319 = float3( 0,0,0 );
				float3 Out_PositionAddOS15_g158319 = float3( 0,0,0 );
				float3 Out_PivotOS15_g158319 = float3( 0,0,0 );
				float3 Out_PivotWS15_g158319 = float3( 0,0,0 );
				float3 Out_PivotWO15_g158319 = float3( 0,0,0 );
				float3 Out_NormalOS15_g158319 = float3( 0,0,0 );
				float3 Out_NormalWS15_g158319 = float3( 0,0,0 );
				float3 Out_NormalRawOS15_g158319 = float3( 0,0,0 );
				float3 Out_NormalRawWS15_g158319 = float3( 0,0,0 );
				float4 Out_TangentOS15_g158319 = float4( 0,0,0,0 );
				float3 Out_ViewDirWS15_g158319 = float3( 0,0,0 );
				float4 Out_VertexData15_g158319 = float4( 0,0,0,0 );
				float4 Out_MotionData15_g158319 = float4( 0,0,0,0 );
				float4 Out_BoundsData15_g158319 = float4( 0,0,0,0 );
				float4 Out_RotationData15_g158319 = float4( 0,0,0,0 );
				Out_Dummy15_g158319 = Data15_g158319.Dummy;
				Out_PositionOS15_g158319 = Data15_g158319.PositionOS;
				Out_PositionWS15_g158319 = Data15_g158319.PositionWS;
				Out_PositionWO15_g158319 = Data15_g158319.PositionWO;
				Out_PositionRawOS15_g158319 = Data15_g158319.PositionRawOS;
				Out_PositionAddOS15_g158319 = Data15_g158319.PositionAddOS;
				Out_PivotOS15_g158319 = Data15_g158319.PivotOS;
				Out_PivotWS15_g158319 = Data15_g158319.PivotWS;
				Out_PivotWO15_g158319 = Data15_g158319.PivotWO;
				Out_NormalOS15_g158319 = Data15_g158319.NormalOS;
				Out_NormalWS15_g158319 = Data15_g158319.NormalWS;
				Out_NormalRawOS15_g158319 = Data15_g158319.NormalRawOS;
				Out_NormalRawWS15_g158319 = Data15_g158319.NormalRawWS;
				Out_TangentOS15_g158319 = Data15_g158319.TangentOS;
				Out_ViewDirWS15_g158319 = Data15_g158319.ViewDirWS;
				Out_VertexData15_g158319 = Data15_g158319.VertexData;
				Out_MotionData15_g158319 = Data15_g158319.MotionData;
				Out_BoundsData15_g158319 = Data15_g158319.BoundsData;
				Out_RotationData15_g158319 = Data15_g158319.RotationData;
				float3 temp_output_31_0_g158312 = Out_PositionOS15_g158319;
				float3 temp_output_6_0_g158326 = ( ( temp_output_31_0_g158312 - Out_PositionRawOS15_g158319 ) + _DisableSRPBatcher );
				half4 Dummy_Data505 = ( ( ( _VariationLiteInfo + _VariationColoring ) + ( _VariationCategory + _VariationEnd ) + ( _VariationIntensityValue + _VariationColorTwo + _VariationColorOne ) + ( _VariationMultiValue + _VariationNoiseRemap + _VariationNoisePivotsValue1 + _VariationNoiseTillingValue ) ) + ( ( _TintingLiteInfo + _TintingColoring ) + ( _TintingCategory + _TintingEnd + _TintingSpace + 0.0 + _TintingElementMode ) + ( _TintingIntensityValue + _TintingColor + _TintingGrayValue ) + ( _TintingMultiValue + _TintingLumaValue + _TintingLumaRemap ) + 0.0 + 0.0 ) + ( ( _DrynessLiteInfo + _DrynessColoring ) + ( _DrynessCategory + _DrynessEnd + _DrynessSpace + _DrynessElementMode + 0.0 ) + ( _DrynessIntensityValue + _DrynessColor + _DrynessGrayValue + _DrynessShiftValue + _DrynessSmoothnessValue + _DrynessSubsurfaceValue ) + ( _DrynessMultiValue + _DrynessLumaValue + _DrynessLumaRemap ) + 0.0 + 0.0 ) + ( ( _WetnessLiteInfo + _WetnessColoring ) + ( _WetnessCategory + _WetnessEnd + _WetnessElementMode + 0.0 ) + ( _WetnessIntensityValue + _WetnessContrastValue + _WetnessSmoothnessValue ) + float4( 0,0,0,0 ) + float4( 0,0,0,0 ) ) + ( ( _CutoutLiteInfo + _CutoutColoring ) + ( _CutoutCategory + _CutoutEnd + _CutoutSpace + _CutoutElementMode + 0.0 ) + ( _CutoutIntensityValue + _CutoutShadowMode ) + ( _CutoutMultiValue + _CutoutAlphaValue + _CutoutNoiseValue + _CutoutNoiseTillingValue ) + 0.0 ) + ( ( _DitherLiteInfo + _DitherColoring ) + ( _DitherCategory + _DitherEnd ) + ( _DitherConstantValue + 0.0 + 0.0 + ( _DitherDistanceValue + _DitherDistanceMaxValue + _DitherDistanceMinValue ) + _DitherShadowMode ) + ( _DitherMultiValue + _DitherNoiseTillingValue ) ) + ( ( _SizeFadeLiteInfo + _SizeFadeColoring ) + ( _SizeFadeCategory + _SizeFadeEnd + _SizeFadeElementMode ) + ( _SizeFadeIntensityValue + _SizeFadeScaleMode + _SizeFadeScaleValue + _SizeFadeDistMinValue + _SizeFadeDistMaxValue ) ) );
				#ifdef TVE_REGISTER
				float4 staticSwitch14_g158326 = ( float4( temp_output_6_0_g158326 , 0.0 ) + ( Dummy_Data505 * float4( 0,0,0,0 ) ) );
				#else
				float4 staticSwitch14_g158326 = float4( temp_output_6_0_g158326 , 0.0 );
				#endif
				
				outputPackedVaryingsMeshToPS.ase_texcoord10.xy = inputMesh.texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				outputPackedVaryingsMeshToPS.ase_texcoord10.zw = 0;
				inputMesh.positionOS.xyz += staticSwitch14_g158326.rgb;

				float3 positionRWS = TransformObjectToWorld(inputMesh.positionOS.xyz );
				float3 normalWS = TransformObjectToWorldNormal(inputMesh.normalOS );
				float4 tangentWS = float4(TransformObjectToWorldDir(inputMesh.tangentOS.xyz), inputMesh.tangentOS.w);

				outputPackedVaryingsMeshToPS.positionCS = TransformWorldToHClip(positionRWS);
				outputPackedVaryingsMeshToPS.interp00.xyz =	positionRWS;
				outputPackedVaryingsMeshToPS.interp01.xyz =	normalWS;
				outputPackedVaryingsMeshToPS.interp02.xyzw = tangentWS;
				outputPackedVaryingsMeshToPS.interp03.xyzw = inputMesh.uv1;
				outputPackedVaryingsMeshToPS.interp04.xyzw = inputMesh.uv2;

				return outputPackedVaryingsMeshToPS;
			}

			void Frag(  PackedVaryingsMeshToPS packedInput,	OUTPUT_GBUFFER(outGBuffer), out float outputDepth : SV_Depth  )
			{
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( packedInput );
				UNITY_SETUP_INSTANCE_ID( packedInput );

				#ifdef LOD_FADE_CROSSFADE
				float3 VC = GetWorldSpaceNormalizeViewDir(packedInput.interp00.xyz);
				LODDitheringTransition(ComputeFadeMaskSeed(VC, packedInput.positionCS.xy), unity_LODFade.x);
				#endif

				FragInputs input;

				ZERO_INITIALIZE( FragInputs, input );
				GlobalSurfaceDescription surfaceDescription = (GlobalSurfaceDescription)0;
				SurfaceOutput o = (SurfaceOutput)0;

				o.Normal = float3( 0, 0, 1 );
				float4 positionCS = 0;
				float3 positionWS = 0;

				float localBreakData4_g158315 = ( 0.0 );
				float localCompData3_g158307 = ( 0.0 );
				TVEVisualData Data3_g158307 = (TVEVisualData)0;
				half Dummy145_g158305 = ( _SubsurfaceCategory + _SubsurfaceEnd + ( _SubsurfaceDirectValue + _SubsurfaceNormalValue + _SubsurfaceAmbientValue + _SubsurfaceShadowValue ) + _SubsurfaceElementMode );
				float In_Dummy3_g158307 = Dummy145_g158305;
				float localBreakData4_g158306 = ( 0.0 );
				float localCompData3_g158259 = ( 0.0 );
				TVEVisualData Data3_g158259 = (TVEVisualData)0;
				half Dummy145_g158247 = ( _EmissiveCategory + _EmissiveEnd + ( _EmissivePowerMode + _EmissivePowerValue ) + _EmissiveElementMode + 0.0 );
				float In_Dummy3_g158259 = Dummy145_g158247;
				float localBreakData4_g158258 = ( 0.0 );
				float localCompData3_g158220 = ( 0.0 );
				TVEVisualData Data3_g158220 = (TVEVisualData)0;
				float2 uv_OverlayGlitterTex = packedInput.ase_texcoord10.xy * _OverlayGlitterTex_ST.xy + _OverlayGlitterTex_ST.zw;
				half4 Dummy594_g158217 = ( ( _OverlayCategory + _OverlayEnd + _OverlaySpace + _OverlayElementMode + _OverlayBakeInfo ) + ( _OverlayLiteInfo + _OverlayColoringOn + _OverlayColoringOff ) + ( SAMPLE_TEXTURE2D( _OverlayGlitterTex, sampler_OverlayGlitterTex, uv_OverlayGlitterTex ) + _OverlayGlitterTillingValue + _OverlayGlitterIntensityValue + _OverlayGlitterColor + _OverlayGlitterDistValue ) );
				float In_Dummy3_g158220 = Dummy594_g158217.r;
				float localBreakData4_g158218 = ( 0.0 );
				float localCompData3_g157221 = ( 0.0 );
				TVEVisualData Data3_g157221 = (TVEVisualData)0;
				float4 output0 = 0;
				float4 output1 = 0;
				OctaImpostorFragment( o, positionCS, positionWS, packedInput.UVsFrame122_g156549, packedInput.UVsFrame222_g156549, packedInput.UVsFrame322_g156549, packedInput.octaframe22_g156549, packedInput.viewPos22_g156549, output0, output1 );
				float In_Dummy3_g157221 = output1.r;
				float4 break227_g157220 = output0;
				half Local_MultiMask249_g157220 = break227_g157220.b;
				float lerpResult289_g157220 = lerp( 1.0 , Local_MultiMask249_g157220 , _ImpostorColorMode);
				float3 lerpResult292_g157220 = lerp( (_ImpostorColorTwo).rgb , (_ImpostorColor).rgb , lerpResult289_g157220);
				half3 Local_Albedo239_g157220 = ( o.Albedo * lerpResult292_g157220 );
				float3 In_Albedo3_g157221 = Local_Albedo239_g157220;
				float2 temp_cast_4 = (0.5).xx;
				float2 In_NormalTS3_g157221 = temp_cast_4;
				float3 In_NormalWS3_g157221 = o.Normal;
				half Local_Metallic247_g157220 = break227_g157220.r;
				half Final_Metallic238_g157220 = ( Local_Metallic247_g157220 * _ImpostorMetallicValue );
				half Local_Smoothness250_g157220 = break227_g157220.a;
				half Final_Smoothness233_g157220 = ( Local_Smoothness250_g157220 * _ImpostorSmoothnessValue );
				float4 appendResult257_g157220 = (float4(Final_Metallic238_g157220 , 1.0 , 1.0 , Final_Smoothness233_g157220));
				float4 In_Shader3_g157221 = appendResult257_g157220;
				half Local_EmissiveMask248_g157220 = break227_g157220.g;
				float4 appendResult286_g157220 = (float4(Local_EmissiveMask248_g157220 , Local_EmissiveMask248_g157220 , Local_EmissiveMask248_g157220 , 1.0));
				float4 In_Emissive3_g157221 = appendResult286_g157220;
				float3 temp_output_3_0_g157222 = Local_Albedo239_g157220;
				float dotResult20_g157222 = dot( temp_output_3_0_g157222 , float3(0.2126,0.7152,0.0722) );
				half Local_Grayscale268_g157220 = dotResult20_g157222;
				float In_Grayscale3_g157221 = Local_Grayscale268_g157220;
				float clampResult267_g157220 = clamp( saturate( ( Local_Grayscale268_g157220 * 5.0 ) ) , 0.2 , 1.0 );
				half Local_Luminosity269_g157220 = clampResult267_g157220;
				float In_Luminosity3_g157221 = Local_Luminosity269_g157220;
				float In_MultiMask3_g157221 = Local_MultiMask249_g157220;
				float In_AlphaClip3_g157221 = 0.0;
				float In_AlphaFade3_g157221 = 1.0;
				float3 temp_cast_5 = (1.0).xxx;
				float3 In_Translucency3_g157221 = temp_cast_5;
				float In_Transmission3_g157221 = 1.0;
				float In_Thickness3_g157221 = 0.0;
				float In_Diffusion3_g157221 = 0.0;
				Data3_g157221.Dummy = In_Dummy3_g157221;
				Data3_g157221.Albedo = In_Albedo3_g157221;
				Data3_g157221.NormalTS = In_NormalTS3_g157221;
				Data3_g157221.NormalWS = In_NormalWS3_g157221;
				Data3_g157221.Shader = In_Shader3_g157221;
				Data3_g157221.Emissive= In_Emissive3_g157221;
				Data3_g157221.MultiMask = In_MultiMask3_g157221;
				Data3_g157221.Grayscale = In_Grayscale3_g157221;
				Data3_g157221.Luminosity = In_Luminosity3_g157221;
				Data3_g157221.AlphaClip = In_AlphaClip3_g157221;
				Data3_g157221.AlphaFade = In_AlphaFade3_g157221;
				Data3_g157221.Translucency = In_Translucency3_g157221;
				Data3_g157221.Transmission = In_Transmission3_g157221;
				Data3_g157221.Thickness = In_Thickness3_g157221;
				Data3_g157221.Diffusion = In_Diffusion3_g157221;
				TVEVisualData Data4_g158218 = Data3_g157221;
				float Out_Dummy4_g158218 = 0;
				float3 Out_Albedo4_g158218 = float3( 0,0,0 );
				float2 Out_NormalTS4_g158218 = float2( 0,0 );
				float3 Out_NormalWS4_g158218 = float3( 0,0,0 );
				float4 Out_Shader4_g158218 = float4( 0,0,0,0 );
				float4 Out_Emissive4_g158218 = float4( 0,0,0,0 );
				float Out_MultiMask4_g158218 = 0;
				float Out_Grayscale4_g158218 = 0;
				float Out_Luminosity4_g158218 = 0;
				float Out_AlphaClip4_g158218 = 0;
				float Out_AlphaFade4_g158218 = 0;
				float3 Out_Translucency4_g158218 = float3( 0,0,0 );
				float Out_Transmission4_g158218 = 0;
				float Out_Thickness4_g158218 = 0;
				float Out_Diffusion4_g158218 = 0;
				Out_Dummy4_g158218 = Data4_g158218.Dummy;
				Out_Albedo4_g158218 = Data4_g158218.Albedo;
				Out_NormalTS4_g158218 = Data4_g158218.NormalTS;
				Out_NormalWS4_g158218 = Data4_g158218.NormalWS;
				Out_Shader4_g158218 = Data4_g158218.Shader;
				Out_Emissive4_g158218= Data4_g158218.Emissive;
				Out_MultiMask4_g158218 = Data4_g158218.MultiMask;
				Out_Grayscale4_g158218 = Data4_g158218.Grayscale;
				Out_Luminosity4_g158218= Data4_g158218.Luminosity;
				Out_AlphaClip4_g158218 = Data4_g158218.AlphaClip;
				Out_AlphaFade4_g158218 = Data4_g158218.AlphaFade;
				Out_Translucency4_g158218 = Data4_g158218.Translucency;
				Out_Transmission4_g158218 = Data4_g158218.Transmission;
				Out_Thickness4_g158218 = Data4_g158218.Thickness;
				Out_Diffusion4_g158218 = Data4_g158218.Diffusion;
				half3 Visual_Albedo127_g158217 = Out_Albedo4_g158218;
				float3 temp_output_622_0_g158217 = (_OverlayColor).rgb;
				half Overlay_TexMask906_g158217 = 1.0;
				float3 temp_output_739_21_g158217 = Out_NormalWS4_g158218;
				half3 Visual_NormalWS749_g158217 = temp_output_739_21_g158217;
				float clampResult17_g158237 = clamp( saturate( (Visual_NormalWS749_g158217).y ) , 0.0001 , 0.9999 );
				float temp_output_7_0_g158236 = _OverlayProjRemap.x;
				float temp_output_10_0_g158236 = ( _OverlayProjRemap.y - temp_output_7_0_g158236 );
				float lerpResult842_g158217 = lerp( 1.0 , saturate( ( ( clampResult17_g158237 - temp_output_7_0_g158236 ) / ( temp_output_10_0_g158236 + 0.0001 ) ) ) , _OverlayProjValue);
				half Overlay_MaskProj457_g158217 = lerpResult842_g158217;
				float temp_output_739_15_g158217 = Out_Luminosity4_g158218;
				half Visual_Luminosity654_g158217 = temp_output_739_15_g158217;
				float clampResult17_g158239 = clamp( Visual_Luminosity654_g158217 , 0.0001 , 0.9999 );
				float temp_output_7_0_g158238 = _OverlayLumaRemap.x;
				float temp_output_10_0_g158238 = ( _OverlayLumaRemap.y - temp_output_7_0_g158238 );
				float lerpResult587_g158217 = lerp( 1.0 , saturate( ( ( clampResult17_g158239 - temp_output_7_0_g158238 ) / ( temp_output_10_0_g158238 + 0.0001 ) ) ) , _OverlayLumaValue);
				half Overlay_MaskLuma438_g158217 = lerpResult587_g158217;
				half Overlay_VertMask801_g158217 = 1.0;
				half Overlay_MaskNoise427_g158217 = 1.0;
				float localBuildGlobalData204_g157155 = ( 0.0 );
				TVEGlobalData Data204_g157155 = (TVEGlobalData)0;
				half Dummy211_g157155 = ( _GlobalLiteInfo + ( _GlobalCategory + _GlobalEnd ) );
				float In_Dummy204_g157155 = Dummy211_g157155;
				float4 temp_output_362_164_g157155 = TVE_CoatParams;
				half4 Coat_Params302_g157155 = temp_output_362_164_g157155;
				float4 In_CoatParams204_g157155 = Coat_Params302_g157155;
				float4 temp_output_361_164_g157155 = TVE_PaintParams;
				half4 Paint_Params71_g157155 = temp_output_361_164_g157155;
				float4 In_PaintParams204_g157155 = Paint_Params71_g157155;
				float4 temp_output_365_163_g157155 = TVE_GlowParams;
				half4 Glow_Params248_g157155 = temp_output_365_163_g157155;
				float4 In_GlowParams204_g157155 = Glow_Params248_g157155;
				float4 temp_output_363_141_g157155 = TVE_AtmoParams;
				half4 Atmo_Params80_g157155 = temp_output_363_141_g157155;
				float4 In_AtmoParams204_g157155 = Atmo_Params80_g157155;
				float4 temp_output_364_139_g157155 = TVE_FormParams;
				half4 Form_Params112_g157155 = temp_output_364_139_g157155;
				float4 In_FormParams204_g157155 = Form_Params112_g157155;
				float4 temp_output_366_145_g157155 = TVE_WindParams;
				half4 Wind_Params88_g157155 = temp_output_366_145_g157155;
				float4 In_WindParams204_g157155 = Wind_Params88_g157155;
				float4 temp_output_367_145_g157155 = TVE_PushParams;
				half4 Push_Params335_g157155 = temp_output_367_145_g157155;
				float4 In_PushParams204_g157155 = Push_Params335_g157155;
				Data204_g157155.Dummy = In_Dummy204_g157155;
				Data204_g157155.CoatParams = In_CoatParams204_g157155;
				Data204_g157155.PaintParams = In_PaintParams204_g157155;
				Data204_g157155.GlowParams = In_GlowParams204_g157155;
				Data204_g157155.AtmoParams = In_AtmoParams204_g157155;
				Data204_g157155.FormParams= In_FormParams204_g157155;
				Data204_g157155.WindParams = In_WindParams204_g157155;
				Data204_g157155.PushParams = In_PushParams204_g157155;
				TVEGlobalData Data15_g158219 = Data204_g157155;
				float Out_Dummy15_g158219 = 0;
				float4 Out_CoatParams15_g158219 = float4( 0,0,0,0 );
				float4 Out_PaintParams15_g158219 = float4( 0,0,0,0 );
				float4 Out_GlowParams15_g158219 = float4( 0,0,0,0 );
				float4 Out_AtmoParams15_g158219 = float4( 0,0,0,0 );
				float4 Out_FadeParams15_g158219 = float4( 0,0,0,0 );
				float4 Out_FormParams15_g158219 = float4( 0,0,0,0 );
				float4 Out_LandParams15_g158219 = float4( 0,0,0,0 );
				float4 Out_WindParams15_g158219 = float4( 0,0,0,0 );
				float4 Out_PushParams15_g158219 = float4( 0,0,0,0 );
				Out_Dummy15_g158219 = Data15_g158219.Dummy;
				Out_CoatParams15_g158219 = Data15_g158219.CoatParams;
				Out_PaintParams15_g158219 = Data15_g158219.PaintParams;
				Out_GlowParams15_g158219 = Data15_g158219.GlowParams;
				Out_AtmoParams15_g158219= Data15_g158219.AtmoParams;
				Out_FadeParams15_g158219= Data15_g158219.FadeParams;
				Out_FormParams15_g158219 = Data15_g158219.FormParams;
				Out_LandParams15_g158219 = Data15_g158219.LandParams;
				Out_WindParams15_g158219 = Data15_g158219.WindParams;
				Out_PushParams15_g158219 = Data15_g158219.PushParams;
				half4 Global_AtmoParams516_g158217 = Out_AtmoParams15_g158219;
				#ifdef TVE_OVERLAY_ELEMENT
				float staticSwitch705_g158217 = (Global_AtmoParams516_g158217).z;
				#else
				float staticSwitch705_g158217 = 1.0;
				#endif
				half Overlay_MaskGlobal429_g158217 = staticSwitch705_g158217;
				half Custom_Mask646_g158217 = 1.0;
				float temp_output_7_0_g158244 = _OverlayBlendRemap1.x;
				float temp_output_10_0_g158244 = ( _OverlayBlendRemap1.y - temp_output_7_0_g158244 );
				half Overlay_Mask494_g158217 = saturate( ( ( ( _OverlayIntensityValue * Overlay_TexMask906_g158217 * Overlay_MaskProj457_g158217 * Overlay_MaskLuma438_g158217 * Overlay_VertMask801_g158217 * Overlay_MaskNoise427_g158217 * Overlay_MaskGlobal429_g158217 * Custom_Mask646_g158217 ) - temp_output_7_0_g158244 ) / ( temp_output_10_0_g158244 + 0.0001 ) ) );
				float3 lerpResult467_g158217 = lerp( Visual_Albedo127_g158217 , temp_output_622_0_g158217 , Overlay_Mask494_g158217);
				#ifdef TVE_OVERLAY
				float3 staticSwitch577_g158217 = lerpResult467_g158217;
				#else
				float3 staticSwitch577_g158217 = Visual_Albedo127_g158217;
				#endif
				half3 Final_Albedo493_g158217 = staticSwitch577_g158217;
				float3 In_Albedo3_g158220 = Final_Albedo493_g158217;
				half2 Visual_NormalTS535_g158217 = Out_NormalTS4_g158218;
				float2 lerpResult551_g158217 = lerp( Visual_NormalTS535_g158217 , ( Visual_NormalTS535_g158217 * _OverlayNormalValue ) , Overlay_Mask494_g158217);
				#ifdef TVE_OVERLAY
				float2 staticSwitch583_g158217 = lerpResult551_g158217;
				#else
				float2 staticSwitch583_g158217 = Visual_NormalTS535_g158217;
				#endif
				half2 Final_NormalTS499_g158217 = staticSwitch583_g158217;
				float2 In_NormalTS3_g158220 = Final_NormalTS499_g158217;
				float3 In_NormalWS3_g158220 = temp_output_739_21_g158217;
				half4 Visual_Masks536_g158217 = Out_Shader4_g158218;
				float4 appendResult585_g158217 = (float4(0.0 , 1.0 , 0.0 , _OverlaySmoothnessValue));
				float4 lerpResult584_g158217 = lerp( Visual_Masks536_g158217 , appendResult585_g158217 , Overlay_Mask494_g158217);
				#ifdef TVE_OVERLAY
				float4 staticSwitch586_g158217 = lerpResult584_g158217;
				#else
				float4 staticSwitch586_g158217 = Visual_Masks536_g158217;
				#endif
				half4 Final_Masks482_g158217 = staticSwitch586_g158217;
				float4 In_Shader3_g158220 = Final_Masks482_g158217;
				float4 In_Emissive3_g158220 = Out_Emissive4_g158218;
				float temp_output_739_12_g158217 = Out_Grayscale4_g158218;
				float In_Grayscale3_g158220 = temp_output_739_12_g158217;
				float In_Luminosity3_g158220 = temp_output_739_15_g158217;
				float In_MultiMask3_g158220 = Out_MultiMask4_g158218;
				float In_AlphaClip3_g158220 = Out_AlphaClip4_g158218;
				float In_AlphaFade3_g158220 = Out_AlphaFade4_g158218;
				float3 In_Translucency3_g158220 = Out_Translucency4_g158218;
				half Visual_Transmission699_g158217 = Out_Transmission4_g158218;
				float lerpResult746_g158217 = lerp( Visual_Transmission699_g158217 , ( Visual_Transmission699_g158217 * _OverlaySubsurfaceValue ) , ( Overlay_VertMask801_g158217 * Overlay_MaskNoise427_g158217 * Overlay_MaskGlobal429_g158217 ));
				#ifdef TVE_OVERLAY
				float staticSwitch703_g158217 = lerpResult746_g158217;
				#else
				float staticSwitch703_g158217 = Visual_Transmission699_g158217;
				#endif
				half Final_Transmission702_g158217 = staticSwitch703_g158217;
				float In_Transmission3_g158220 = Final_Transmission702_g158217;
				float In_Thickness3_g158220 = Out_Thickness4_g158218;
				float In_Diffusion3_g158220 = Out_Diffusion4_g158218;
				Data3_g158220.Dummy = In_Dummy3_g158220;
				Data3_g158220.Albedo = In_Albedo3_g158220;
				Data3_g158220.NormalTS = In_NormalTS3_g158220;
				Data3_g158220.NormalWS = In_NormalWS3_g158220;
				Data3_g158220.Shader = In_Shader3_g158220;
				Data3_g158220.Emissive= In_Emissive3_g158220;
				Data3_g158220.MultiMask = In_MultiMask3_g158220;
				Data3_g158220.Grayscale = In_Grayscale3_g158220;
				Data3_g158220.Luminosity = In_Luminosity3_g158220;
				Data3_g158220.AlphaClip = In_AlphaClip3_g158220;
				Data3_g158220.AlphaFade = In_AlphaFade3_g158220;
				Data3_g158220.Translucency = In_Translucency3_g158220;
				Data3_g158220.Transmission = In_Transmission3_g158220;
				Data3_g158220.Thickness = In_Thickness3_g158220;
				Data3_g158220.Diffusion = In_Diffusion3_g158220;
				TVEVisualData Data4_g158258 = Data3_g158220;
				float Out_Dummy4_g158258 = 0;
				float3 Out_Albedo4_g158258 = float3( 0,0,0 );
				float2 Out_NormalTS4_g158258 = float2( 0,0 );
				float3 Out_NormalWS4_g158258 = float3( 0,0,0 );
				float4 Out_Shader4_g158258 = float4( 0,0,0,0 );
				float4 Out_Emissive4_g158258 = float4( 0,0,0,0 );
				float Out_MultiMask4_g158258 = 0;
				float Out_Grayscale4_g158258 = 0;
				float Out_Luminosity4_g158258 = 0;
				float Out_AlphaClip4_g158258 = 0;
				float Out_AlphaFade4_g158258 = 0;
				float3 Out_Translucency4_g158258 = float3( 0,0,0 );
				float Out_Transmission4_g158258 = 0;
				float Out_Thickness4_g158258 = 0;
				float Out_Diffusion4_g158258 = 0;
				Out_Dummy4_g158258 = Data4_g158258.Dummy;
				Out_Albedo4_g158258 = Data4_g158258.Albedo;
				Out_NormalTS4_g158258 = Data4_g158258.NormalTS;
				Out_NormalWS4_g158258 = Data4_g158258.NormalWS;
				Out_Shader4_g158258 = Data4_g158258.Shader;
				Out_Emissive4_g158258= Data4_g158258.Emissive;
				Out_MultiMask4_g158258 = Data4_g158258.MultiMask;
				Out_Grayscale4_g158258 = Data4_g158258.Grayscale;
				Out_Luminosity4_g158258= Data4_g158258.Luminosity;
				Out_AlphaClip4_g158258 = Data4_g158258.AlphaClip;
				Out_AlphaFade4_g158258 = Data4_g158258.AlphaFade;
				Out_Translucency4_g158258 = Data4_g158258.Translucency;
				Out_Transmission4_g158258 = Data4_g158258.Transmission;
				Out_Thickness4_g158258 = Data4_g158258.Thickness;
				Out_Diffusion4_g158258 = Data4_g158258.Diffusion;
				float3 temp_output_297_0_g158247 = Out_Albedo4_g158258;
				float3 In_Albedo3_g158259 = temp_output_297_0_g158247;
				float2 In_NormalTS3_g158259 = Out_NormalTS4_g158258;
				float3 In_NormalWS3_g158259 = Out_NormalWS4_g158258;
				float4 In_Shader3_g158259 = Out_Shader4_g158258;
				float4 temp_cast_6 = (0.0).xxxx;
				half4 Visual_Emissive255_g158247 = Out_Emissive4_g158258;
				half Emissive_MeshMask221_g158247 = 1.0;
				half Emissive_Mask103_g158247 = 1.0;
				float temp_output_279_0_g158247 = ( Emissive_MeshMask221_g158247 * Emissive_Mask103_g158247 );
				float3 appendResult293_g158247 = (float3(temp_output_279_0_g158247 , temp_output_279_0_g158247 , temp_output_279_0_g158247));
				half3 Local_EmissiveColor278_g158247 = appendResult293_g158247;
				float3 temp_cast_7 = (1.0).xxx;
				TVEGlobalData Data15_g158249 = Data204_g157155;
				float Out_Dummy15_g158249 = 0;
				float4 Out_CoatParams15_g158249 = float4( 0,0,0,0 );
				float4 Out_PaintParams15_g158249 = float4( 0,0,0,0 );
				float4 Out_GlowParams15_g158249 = float4( 0,0,0,0 );
				float4 Out_AtmoParams15_g158249 = float4( 0,0,0,0 );
				float4 Out_FadeParams15_g158249 = float4( 0,0,0,0 );
				float4 Out_FormParams15_g158249 = float4( 0,0,0,0 );
				float4 Out_LandParams15_g158249 = float4( 0,0,0,0 );
				float4 Out_WindParams15_g158249 = float4( 0,0,0,0 );
				float4 Out_PushParams15_g158249 = float4( 0,0,0,0 );
				Out_Dummy15_g158249 = Data15_g158249.Dummy;
				Out_CoatParams15_g158249 = Data15_g158249.CoatParams;
				Out_PaintParams15_g158249 = Data15_g158249.PaintParams;
				Out_GlowParams15_g158249 = Data15_g158249.GlowParams;
				Out_AtmoParams15_g158249= Data15_g158249.AtmoParams;
				Out_FadeParams15_g158249= Data15_g158249.FadeParams;
				Out_FormParams15_g158249 = Data15_g158249.FormParams;
				Out_LandParams15_g158249 = Data15_g158249.LandParams;
				Out_WindParams15_g158249 = Data15_g158249.WindParams;
				Out_PushParams15_g158249 = Data15_g158249.PushParams;
				half4 Global_GlowParams179_g158247 = Out_GlowParams15_g158249;
				float3 lerpResult299_g158247 = lerp( float3( 1,1,1 ) , (Global_GlowParams179_g158247).xyz , TVE_IsEnabled);
				#ifdef TVE_EMISSIVE_ELEMENT
				float3 staticSwitch228_g158247 = lerpResult299_g158247;
				#else
				float3 staticSwitch228_g158247 = temp_cast_7;
				#endif
				half3 Emissive_GlobalMask248_g158247 = staticSwitch228_g158247;
				half3 Local_EmissiveValue88_g158247 = ( _EmissiveIntensityValue * (_EmissiveColor).rgb * Emissive_GlobalMask248_g158247 );
				half3 Emissive_Blend260_g158247 = ( ( (Visual_Emissive255_g158247).xyz * Local_EmissiveColor278_g158247 ) * Local_EmissiveValue88_g158247 );
				float3 temp_output_3_0_g158257 = Emissive_Blend260_g158247;
				float temp_output_15_0_g158257 = _emissive_power_value;
				float3 hdEmission22_g158257 = ASEGetEmissionHDRColor(temp_output_3_0_g158257,temp_output_15_0_g158257,_EmissiveExposureValue,GetInverseCurrentExposureMultiplier());
				float4 appendResult295_g158247 = (float4(hdEmission22_g158257 , Emissive_Mask103_g158247));
				#ifdef TVE_EMISSIVE
				float4 staticSwitch129_g158247 = appendResult295_g158247;
				#else
				float4 staticSwitch129_g158247 = temp_cast_6;
				#endif
				half4 Final_Emissive184_g158247 = staticSwitch129_g158247;
				float4 In_Emissive3_g158259 = Final_Emissive184_g158247;
				float In_Grayscale3_g158259 = Out_Grayscale4_g158258;
				float In_Luminosity3_g158259 = Out_Luminosity4_g158258;
				float temp_output_297_11_g158247 = Out_MultiMask4_g158258;
				float In_MultiMask3_g158259 = temp_output_297_11_g158247;
				float In_AlphaClip3_g158259 = Out_AlphaClip4_g158258;
				float In_AlphaFade3_g158259 = Out_AlphaFade4_g158258;
				float3 In_Translucency3_g158259 = Out_Translucency4_g158258;
				float In_Transmission3_g158259 = Out_Transmission4_g158258;
				float In_Thickness3_g158259 = Out_Thickness4_g158258;
				float In_Diffusion3_g158259 = Out_Diffusion4_g158258;
				Data3_g158259.Dummy = In_Dummy3_g158259;
				Data3_g158259.Albedo = In_Albedo3_g158259;
				Data3_g158259.NormalTS = In_NormalTS3_g158259;
				Data3_g158259.NormalWS = In_NormalWS3_g158259;
				Data3_g158259.Shader = In_Shader3_g158259;
				Data3_g158259.Emissive= In_Emissive3_g158259;
				Data3_g158259.MultiMask = In_MultiMask3_g158259;
				Data3_g158259.Grayscale = In_Grayscale3_g158259;
				Data3_g158259.Luminosity = In_Luminosity3_g158259;
				Data3_g158259.AlphaClip = In_AlphaClip3_g158259;
				Data3_g158259.AlphaFade = In_AlphaFade3_g158259;
				Data3_g158259.Translucency = In_Translucency3_g158259;
				Data3_g158259.Transmission = In_Transmission3_g158259;
				Data3_g158259.Thickness = In_Thickness3_g158259;
				Data3_g158259.Diffusion = In_Diffusion3_g158259;
				TVEVisualData Data4_g158306 = Data3_g158259;
				float Out_Dummy4_g158306 = 0;
				float3 Out_Albedo4_g158306 = float3( 0,0,0 );
				float2 Out_NormalTS4_g158306 = float2( 0,0 );
				float3 Out_NormalWS4_g158306 = float3( 0,0,0 );
				float4 Out_Shader4_g158306 = float4( 0,0,0,0 );
				float4 Out_Emissive4_g158306 = float4( 0,0,0,0 );
				float Out_MultiMask4_g158306 = 0;
				float Out_Grayscale4_g158306 = 0;
				float Out_Luminosity4_g158306 = 0;
				float Out_AlphaClip4_g158306 = 0;
				float Out_AlphaFade4_g158306 = 0;
				float3 Out_Translucency4_g158306 = float3( 0,0,0 );
				float Out_Transmission4_g158306 = 0;
				float Out_Thickness4_g158306 = 0;
				float Out_Diffusion4_g158306 = 0;
				Out_Dummy4_g158306 = Data4_g158306.Dummy;
				Out_Albedo4_g158306 = Data4_g158306.Albedo;
				Out_NormalTS4_g158306 = Data4_g158306.NormalTS;
				Out_NormalWS4_g158306 = Data4_g158306.NormalWS;
				Out_Shader4_g158306 = Data4_g158306.Shader;
				Out_Emissive4_g158306= Data4_g158306.Emissive;
				Out_MultiMask4_g158306 = Data4_g158306.MultiMask;
				Out_Grayscale4_g158306 = Data4_g158306.Grayscale;
				Out_Luminosity4_g158306= Data4_g158306.Luminosity;
				Out_AlphaClip4_g158306 = Data4_g158306.AlphaClip;
				Out_AlphaFade4_g158306 = Data4_g158306.AlphaFade;
				Out_Translucency4_g158306 = Data4_g158306.Translucency;
				Out_Transmission4_g158306 = Data4_g158306.Transmission;
				Out_Thickness4_g158306 = Data4_g158306.Thickness;
				Out_Diffusion4_g158306 = Data4_g158306.Diffusion;
				half3 Visual_Albedo199_g158305 = Out_Albedo4_g158306;
				half3 Final_Albedo312_g158305 = Visual_Albedo199_g158305;
				float3 In_Albedo3_g158307 = Final_Albedo312_g158305;
				float2 In_NormalTS3_g158307 = Out_NormalTS4_g158306;
				float3 In_NormalWS3_g158307 = Out_NormalWS4_g158306;
				float4 In_Shader3_g158307 = Out_Shader4_g158306;
				float4 In_Emissive3_g158307 = Out_Emissive4_g158306;
				float In_Grayscale3_g158307 = Out_Grayscale4_g158306;
				float In_Luminosity3_g158307 = Out_Luminosity4_g158306;
				float temp_output_301_11_g158305 = Out_MultiMask4_g158306;
				float In_MultiMask3_g158307 = temp_output_301_11_g158305;
				float In_AlphaClip3_g158307 = Out_AlphaClip4_g158306;
				float In_AlphaFade3_g158307 = Out_AlphaFade4_g158306;
				float3 temp_cast_8 = (0.0).xxx;
				half3 Subsurface_Color264_g158305 = ( (_SubsurfaceColor).rgb * Visual_Albedo199_g158305 );
				half Visual_Transmission138_g158305 = Out_Transmission4_g158306;
				half Subsurface_Value268_g158305 = _SubsurfaceIntensityValue;
				TVEGlobalData Data15_g158309 = Data204_g157155;
				float Out_Dummy15_g158309 = 0;
				float4 Out_CoatParams15_g158309 = float4( 0,0,0,0 );
				float4 Out_PaintParams15_g158309 = float4( 0,0,0,0 );
				float4 Out_GlowParams15_g158309 = float4( 0,0,0,0 );
				float4 Out_AtmoParams15_g158309 = float4( 0,0,0,0 );
				float4 Out_FadeParams15_g158309 = float4( 0,0,0,0 );
				float4 Out_FormParams15_g158309 = float4( 0,0,0,0 );
				float4 Out_LandParams15_g158309 = float4( 0,0,0,0 );
				float4 Out_WindParams15_g158309 = float4( 0,0,0,0 );
				float4 Out_PushParams15_g158309 = float4( 0,0,0,0 );
				Out_Dummy15_g158309 = Data15_g158309.Dummy;
				Out_CoatParams15_g158309 = Data15_g158309.CoatParams;
				Out_PaintParams15_g158309 = Data15_g158309.PaintParams;
				Out_GlowParams15_g158309 = Data15_g158309.GlowParams;
				Out_AtmoParams15_g158309= Data15_g158309.AtmoParams;
				Out_FadeParams15_g158309= Data15_g158309.FadeParams;
				Out_FormParams15_g158309 = Data15_g158309.FormParams;
				Out_LandParams15_g158309 = Data15_g158309.LandParams;
				Out_WindParams15_g158309 = Data15_g158309.WindParams;
				Out_PushParams15_g158309 = Data15_g158309.PushParams;
				half4 Global_GlowParams373_g158305 = Out_GlowParams15_g158309;
				float lerpResult403_g158305 = lerp( 1.0 , saturate( (Global_GlowParams373_g158305).w ) , TVE_IsEnabled);
				#ifdef TVE_SUBSURFACE_ELEMENT
				float staticSwitch367_g158305 = lerpResult403_g158305;
				#else
				float staticSwitch367_g158305 = 1.0;
				#endif
				half Subsurface_GlobalMask369_g158305 = staticSwitch367_g158305;
				half Visual_MultiMask292_g158305 = temp_output_301_11_g158305;
				float lerpResult293_g158305 = lerp( 1.0 , Visual_MultiMask292_g158305 , _SubsurfaceMultiValue);
				half Subsurface_MultiMask296_g158305 = lerpResult293_g158305;
				half Custom_Mask363_g158305 = 1.0;
				#ifdef TVE_SUBSURFACE
				float staticSwitch345_g158305 = ( Visual_Transmission138_g158305 * Subsurface_Value268_g158305 * Subsurface_GlobalMask369_g158305 * Subsurface_MultiMask296_g158305 * Custom_Mask363_g158305 );
				#else
				float staticSwitch345_g158305 = 0.0;
				#endif
				half Final_Transmission269_g158305 = staticSwitch345_g158305;
				#ifdef TVE_SUBSURFACE
				float3 staticSwitch348_g158305 = ( Subsurface_Color264_g158305 * Final_Transmission269_g158305 * 10.0 );
				#else
				float3 staticSwitch348_g158305 = temp_cast_8;
				#endif
				half3 Final_Translucency254_g158305 = staticSwitch348_g158305;
				float3 In_Translucency3_g158307 = Final_Translucency254_g158305;
				float In_Transmission3_g158307 = Final_Transmission269_g158305;
				#ifdef TVE_SUBSURFACE
				float staticSwitch351_g158305 = _SubsurfaceThicknessValue;
				#else
				float staticSwitch351_g158305 = 1.0;
				#endif
				half Final_Thickness275_g158305 = staticSwitch351_g158305;
				float In_Thickness3_g158307 = Final_Thickness275_g158305;
				float Final_Diffusion340_g158305 = _SubsurfaceDiffusion;
				float In_Diffusion3_g158307 = Final_Diffusion340_g158305;
				Data3_g158307.Dummy = In_Dummy3_g158307;
				Data3_g158307.Albedo = In_Albedo3_g158307;
				Data3_g158307.NormalTS = In_NormalTS3_g158307;
				Data3_g158307.NormalWS = In_NormalWS3_g158307;
				Data3_g158307.Shader = In_Shader3_g158307;
				Data3_g158307.Emissive= In_Emissive3_g158307;
				Data3_g158307.MultiMask = In_MultiMask3_g158307;
				Data3_g158307.Grayscale = In_Grayscale3_g158307;
				Data3_g158307.Luminosity = In_Luminosity3_g158307;
				Data3_g158307.AlphaClip = In_AlphaClip3_g158307;
				Data3_g158307.AlphaFade = In_AlphaFade3_g158307;
				Data3_g158307.Translucency = In_Translucency3_g158307;
				Data3_g158307.Transmission = In_Transmission3_g158307;
				Data3_g158307.Thickness = In_Thickness3_g158307;
				Data3_g158307.Diffusion = In_Diffusion3_g158307;
				TVEVisualData Data4_g158315 = Data3_g158307;
				float Out_Dummy4_g158315 = 0;
				float3 Out_Albedo4_g158315 = float3( 0,0,0 );
				float2 Out_NormalTS4_g158315 = float2( 0,0 );
				float3 Out_NormalWS4_g158315 = float3( 0,0,0 );
				float4 Out_Shader4_g158315 = float4( 0,0,0,0 );
				float4 Out_Emissive4_g158315 = float4( 0,0,0,0 );
				float Out_MultiMask4_g158315 = 0;
				float Out_Grayscale4_g158315 = 0;
				float Out_Luminosity4_g158315 = 0;
				float Out_AlphaClip4_g158315 = 0;
				float Out_AlphaFade4_g158315 = 0;
				float3 Out_Translucency4_g158315 = float3( 0,0,0 );
				float Out_Transmission4_g158315 = 0;
				float Out_Thickness4_g158315 = 0;
				float Out_Diffusion4_g158315 = 0;
				Out_Dummy4_g158315 = Data4_g158315.Dummy;
				Out_Albedo4_g158315 = Data4_g158315.Albedo;
				Out_NormalTS4_g158315 = Data4_g158315.NormalTS;
				Out_NormalWS4_g158315 = Data4_g158315.NormalWS;
				Out_Shader4_g158315 = Data4_g158315.Shader;
				Out_Emissive4_g158315= Data4_g158315.Emissive;
				Out_MultiMask4_g158315 = Data4_g158315.MultiMask;
				Out_Grayscale4_g158315 = Data4_g158315.Grayscale;
				Out_Luminosity4_g158315= Data4_g158315.Luminosity;
				Out_AlphaClip4_g158315 = Data4_g158315.AlphaClip;
				Out_AlphaFade4_g158315 = Data4_g158315.AlphaFade;
				Out_Translucency4_g158315 = Data4_g158315.Translucency;
				Out_Transmission4_g158315 = Data4_g158315.Transmission;
				Out_Thickness4_g158315 = Data4_g158315.Thickness;
				Out_Diffusion4_g158315 = Data4_g158315.Diffusion;
				half3 Input_Albedo24_g158313 = Out_Albedo4_g158315;
				#ifdef UNITY_COLORSPACE_GAMMA
				float4 staticSwitch22_g158313 = half4(0.2209163,0.2209163,0.2209163,0.7790837);
				#else
				float4 staticSwitch22_g158313 = half4(0.04,0.04,0.04,0.96);
				#endif
				half4 ColorSpaceDielectricSpec23_g158313 = staticSwitch22_g158313;
				float4 break24_g158312 = Out_Shader4_g158315;
				half Metallic117_g158312 = break24_g158312.x;
				half Input_Metallic25_g158313 = Metallic117_g158312;
				half OneMinusReflectivity31_g158313 = ( (ColorSpaceDielectricSpec23_g158313).w - ( (ColorSpaceDielectricSpec23_g158313).w * Input_Metallic25_g158313 ) );
				float3 lerpResult87_g158312 = lerp( half3(1,0,0) , ( Input_Albedo24_g158313 * OneMinusReflectivity31_g158313 ) , _IsInitialized);
				

				surfaceDescription.Albedo = lerpResult87_g158312;
				o.Normal = Out_NormalWS4_g158315;
				surfaceDescription.BentNormal = float3( 0, 0, 1 );
				surfaceDescription.CoatMask = 0;
				surfaceDescription.Metallic = 0;

				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceDescription.Specular = 0;
				#endif

				surfaceDescription.Emission = (Out_Emissive4_g158315).xyz;
				surfaceDescription.Smoothness = break24_g158312.w;
				surfaceDescription.Occlusion = 1;
				surfaceDescription.Alpha = 1;

				#ifdef _ALPHATEST_ON
				surfaceDescription.AlphaClipThreshold = 0;
				#endif

				#ifdef _ENABLE_GEOMETRIC_SPECULAR_AA
				surfaceDescription.SpecularAAScreenSpaceVariance = 0;
				surfaceDescription.SpecularAAThreshold = 0;
				#endif

				#ifdef _SPECULAR_OCCLUSION_CUSTOM
				surfaceDescription.SpecularOcclusion = 0;
				#endif

				#if defined(_HAS_REFRACTION) || defined(_MATERIAL_FEATURE_TRANSMISSION)
				surfaceDescription.Thickness = Out_Thickness4_g158315;
				#endif

				#ifdef _HAS_REFRACTION
				surfaceDescription.RefractionIndex = 1;
				surfaceDescription.RefractionColor = float3(1,1,1);
				surfaceDescription.RefractionDistance = 0;
				#endif

				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceDescription.SubsurfaceMask = 1;
				#endif

				#ifdef _MATERIAL_FEATURE_TRANSMISSION
				surfaceDescription.TransmissionMask = Out_Transmission4_g158315;
				#endif

				#if defined( _MATERIAL_FEATURE_SUBSURFACE_SCATTERING ) || defined( _MATERIAL_FEATURE_TRANSMISSION )
				surfaceDescription.DiffusionProfile = Out_Diffusion4_g158315;
				#endif

				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceDescription.Anisotropy = 1;
				surfaceDescription.Tangent = float3(1,0,0);
				#endif

				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceDescription.IridescenceMask = 0;
				surfaceDescription.IridescenceThickness = 0;
				#endif

				float4 bakedGI = float4( 0, 0, 0, 0 );

				packedInput.positionCS.zw = positionCS.zw;
				float3 positionRWS = positionWS;
				float3 normalWS = o.Normal;
				float4 tangentWS = packedInput.interp02.xyzw;

				input.positionSS = packedInput.positionCS;
				input.positionRWS = positionRWS;
				//#if defined( ASE_SRP_VERSION ) && ASE_SRP_VERSION < 60900
				//input.worldToTangent = BuildWorldToTangent( tangentWS, normalWS );
				//#else
				input.tangentToWorld = BuildTangentToWorld( tangentWS, normalWS );
				//#endif
				input.texCoord1 = packedInput.interp03.xyzw;
				input.texCoord2 = packedInput.interp04.xyzw;

				PositionInputs posInput = GetPositionInput( input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS );
				SurfaceData surfaceData;
				BuiltinData builtinData;

				float3 normalizedWorldViewDir = GetWorldSpaceNormalizeViewDir( input.positionRWS );

				GetSurfaceAndBuiltinData(surfaceDescription,input, normalizedWorldViewDir, posInput, surfaceData, builtinData);

				#ifdef CUSTOM_BAKED_GI
					BSDFData bsdfData = ConvertSurfaceDataToBSDFData( posInput.positionSS, surfaceData );
					half4 decodeInstructions = half4( LIGHTMAP_HDR_MULTIPLIER, LIGHTMAP_HDR_EXPONENT, 0.0h, 0.0h );
					builtinData.bakeDiffuseLighting = UnpackLightmapRGBM( bakedGI, decodeInstructions ) * EMISSIVE_RGBM_SCALE * bsdfData.diffuseColor;
				#endif

				ENCODE_INTO_GBUFFER(surfaceData, builtinData, posInput.positionSS, outGBuffer);

				outputDepth = posInput.deviceDepth;
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "SceneSelectionPass"
			Tags { "LightMode"="SceneSelectionPass" }
			ColorMask 0

			HLSLPROGRAM
			#pragma shader_feature_local_fragment _DISABLE_DECALS
			#pragma shader_feature_local_fragment _DISABLE_SSR
			#define _MATERIAL_FEATURE_TRANSMISSION 1
			#define ASE_SRP_VERSION 140011
			#define ASE_USING_SAMPLING_MACROS 1

			#pragma vertex Vert
			#pragma fragment Frag

			#if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define OUTPUT_SPLIT_LIGHTING
			#endif

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			//#if defined( ASE_SRP_VERSION ) && ASE_SRP_VERSION < 60900
			//#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Wind.hlsl"
			//#endif
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"


			#define SHADERPASS SHADERPASS_DEPTH_ONLY
			#define SCENESELECTIONPASS 1

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"

			//#if defined( ASE_SRP_VERSION ) && ASE_SRP_VERSION < 60900
			//#define T2W(var, index) var.worldToTangent[index]
			//#else
			#define T2W(var, index) var.tangentToWorld[index]
			//#endif

			int _ObjectId;
			int _PassValue;

			#define ai_ObjectToWorld GetObjectToWorldMatrix()
			#define ai_WorldToObject GetWorldToObjectMatrix()
			#define AI_INV_TWO_PI  INV_TWO_PI
			#define AI_PI          PI
			#define AI_INV_PI      INV_PI
			#define ASE_NEEDS_VERT_NORMAL
			#pragma shader_feature_local_fragment TVE_PIPELINE_STANDARD TVE_PIPELINE_UNIVERSAL TVE_PIPELINE_HD
			#pragma shader_feature_local_vertex TVE_MOTION_BASE_BENDING
			#pragma shader_feature_local_vertex TVE_MOTION_WIND_ELEMENT
			  
			struct TVEVisualData
			{  
				half Dummy;  
				half3 Albedo;
				half2 NormalTS;
				half3 NormalWS; 
				half4 Shader;
				half4 Emissive;
				half AlphaClip;
				half AlphaFade;
				half MultiMask;
				half Grayscale;
				half Luminosity;
				half3 Translucency;
				half Transmission;
				half Thickness;
				float Diffusion;
			};  
			    
			struct TVEModelData
			{    
				half Dummy;    
				half3 PositionOS;
				half3 PositionWS;
				half3 PositionWO;
				half3 PositionRawOS;
				half3 PositionAddOS;
				half3 PivotOS;
				half3 PivotWS;
				half3 PivotWO;
				half3 NormalOS;
				half3 NormalWS;
				half3 NormalRawOS;
				half3 NormalRawWS;
				half4 TangentOS;
				half3 ViewDirWS;
				half4 VertexData;
				half4 MotionData;
				half4 BoundsData;
				half4 RotationData;
			};    
			      
			struct TVEGlobalData
			{      
				half Dummy;      
				half4 CoatParams;
				half4 PaintParams;
				half4 GlowParams;
				half4 AtmoParams;
				half4 FadeParams;
				half4 FormParams;
				half4 LandParams;
				half4 WindParams;
				half4 PushParams;
			};      
			        
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END
			//#pragma editor_sync_compilation


			struct AttributesMesh
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				
			};

			struct PackedVaryingsMeshToPS
			{
				float4 positionCS : SV_Position;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				float4 UVsFrame122_g156549 : TEXCOORD0;
				float4 UVsFrame222_g156549 : TEXCOORD1;
				float4 UVsFrame322_g156549 : TEXCOORD2;
				float4 octaframe22_g156549 : TEXCOORD3;
				float4 viewPos22_g156549 : TEXCOORD4;
			};

			CBUFFER_START( UnityPerMaterial )
			float4 _DrynessColor;
			half4 _ImpostorColor;
			half4 _ImpostorColorTwo;
			float4 _OverlayGlitterTex_ST;
			half4 _InteractionColoring;
			float4 _AI_SizeOffset;
			half4 _SizeFadeColoring;
			half4 _VariationColoring;
			half4 _VariationColorTwo;
			half4 _VariationColorOne;
			half4 _VariationNoiseRemap;
			half4 _DitherColoring;
			half4 _TintingColoring;
			float4 _TintingColor;
			half4 _TintingLumaRemap;
			half4 _DrynessColoring;
			half4 _CutoutColoring;
			half4 _WetnessColoring;
			half4 _OverlayColor;
			half4 _OverlayProjRemap;
			half4 _DrynessLumaRemap;
			half4 _OverlayLumaRemap;
			half4 _OverlayColoringOn;
			half4 _OverlayColoringOff;
			half4 _SubsurfaceColor;
			half4 _OverlayGlitterColor;
			half4 _EmissiveColor;
			float4 _SubsurfaceDiffusion_Asset;
			half4 _OverlayBlendRemap1;
			float3 _AI_Offset;
			half _GlobalEnd;
			half _CutoutMultiValue;
			half _CutoutAlphaValue;
			half _CutoutNoiseValue;
			half _CutoutNoiseTillingValue;
			half _DitherLiteInfo;
			half _ImpostorMetallicValue;
			half _EmissiveExposureValue;
			float _emissive_power_value;
			half _DitherEnd;
			half _ImpostorColorMode;
			half _DitherConstantValue;
			half _EmissiveIntensityValue;
			half _GlobalLiteInfo;
			half _DitherDistanceValue;
			half _DitherCategory;
			half _DitherDistanceMaxValue;
			half _CutoutShadowMode;
			half _CutoutElementMode;
			half _OverlayIntensityValue;
			half _WetnessCategory;
			half _WetnessEnd;
			half _WetnessElementMode;
			half _WetnessIntensityValue;
			half _WetnessContrastValue;
			half _CutoutIntensityValue;
			half _WetnessSmoothnessValue;
			half _OverlayLumaValue;
			half _CutoutCategory;
			half _CutoutEnd;
			half _SubsurfaceIntensityValue;
			half _CutoutSpace;
			half _ImpostorSmoothnessValue;
			half _CutoutLiteInfo;
			half _OverlayGlitterDistValue;
			half _DitherDistanceMinValue;
			half _DitherShadowMode;
			half _SubsurfaceAmbientValue;
			half _SubsurfaceShadowValue;
			half _SubsurfaceElementMode;
			half _EmissiveCategory;
			half _GlobalCategory;
			half _EmissiveEnd;
			half _SubsurfaceNormalValue;
			half _EmissivePowerMode;
			half _EmissiveElementMode;
			half _OverlayCategory;
			half _OverlayEnd;
			half _OverlaySpace;
			half _OverlayElementMode;
			half _OverlayBakeInfo;
			half _EmissivePowerValue;
			half _OverlaySubsurfaceValue;
			half _SubsurfaceDirectValue;
			half _SubsurfaceCategory;
			half _DitherMultiValue;
			half _DitherNoiseTillingValue;
			half _OverlayProjValue;
			half _OverlaySmoothnessValue;
			half _SizeFadeCategory;
			half _SizeFadeEnd;
			half _SubsurfaceEnd;
			half _SizeFadeElementMode;
			half _SizeFadeScaleMode;
			half _SizeFadeScaleValue;
			half _SizeFadeDistMinValue;
			half _OverlayNormalValue;
			half _WetnessLiteInfo;
			half _SizeFadeDistMaxValue;
			half _SizeFadeIntensityValue;
			half _SizeFadeLiteInfo;
			half _ImpostorAlphaClipValue;
			half _DrynessMultiValue;
			half _RenderMotion;
			half _RenderShadow;
			half _ImpostorCategory;
			half _IsImpostorShader;
			half _IsSubsurfaceShader;
			half _IsLiteShader;
			half _ImpostorEnd;
			half _MotionWindCategory;
			half _MotionWindEnd;
			half _MotionWindElementMode;
			half _MotionInteractionCategory;
			half _MotionInteractionEnd;
			half _InteractionLiteInfo;
			half _MotionPushIntensityValue;
			half _MotionPushPivotValue;
			half _MotionPushMaskValue;
			half _MotionPushElementMode;
			half _IsIdentifier;
			half _IsConverted;
			half _IsCollected;
			half _HasDefaultTextures;
			half _OverlayGlitterTillingValue;
			half _OverlayGlitterIntensityValue;
			half _OverlayLiteInfo;
			half _SubsurfaceScatteringValue;
			half _SubsurfaceAngleValue;
			float _SubsurfaceDiffusion;
			half _SubsurfaceSpace;
			half _IsVersion;
			float _AI_Frames;
			half _RenderDecals;
			half _CategoryRender;
			half _EndRender;
			half _NoiseCategory;
			half _NoiseEnd;
			half _IsInitialized;
			half _IsTVEShader;
			half _IsCustomShader;
			half _IsShared;
			half _RenderSSR;
			half _DrynessLumaValue;
			float _AI_FramesX;
			float _AI_ImpostorSize;
			half _TintingSpace;
			half _TintingElementMode;
			half _TintingIntensityValue;
			half _TintingGrayValue;
			half _TintingMultiValue;
			half _TintingLumaValue;
			half _DrynessLiteInfo;
			half _DrynessCategory;
			half _DrynessEnd;
			half _DrynessSpace;
			half _DrynessElementMode;
			half _DrynessIntensityValue;
			half _SubsurfaceMultiValue;
			half _DrynessGrayValue;
			half _DrynessShiftValue;
			half _DrynessSmoothnessValue;
			half _DrynessSubsurfaceValue;
			half _TintingEnd;
			half _TintingCategory;
			half _TintingLiteInfo;
			half _VariationNoiseTillingValue;
			float _AI_Parallax;
			float _AI_TextureBias;
			float _AI_DepthSize;
			float _AI_ShadowBias;
			float _AI_ShadowView;
			float _AI_Clip;
			half _MotionBaseIntensityValue;
			half _MotionBasePivotValue;
			float _AI_FramesY;
			half _MotionTillingValue;
			half _global_wind_layer_value;
			half _MotionDelayValue;
			half _VariationLiteInfo;
			half _VariationCategory;
			half _VariationEnd;
			half _VariationIntensityValue;
			half _VariationMultiValue;
			half _VariationNoisePivotsValue1;
			half _MotionIntensityValue;
			half _SubsurfaceThicknessValue;
			float _BlendMode;
			CBUFFER_END

			TEXTURE2D(_OverlayGlitterTex);
			SAMPLER(sampler_OverlayGlitterTex);
			TEXTURE3D(_NoiseTex3D);
			SAMPLER(sampler_NoiseTex3D);
			float4x4 unity_CameraProjection;
			float4x4 unity_CameraInvProjection;
			float4x4 unity_WorldToCamera;
			float4x4 unity_CameraToWorld;
			TEXTURE2D(_Albedo);
			SAMPLER(sampler_Albedo);
			TEXTURE2D(_Normals);
			SAMPLER(sampler_Normals);
			float3 TVE_WorldOrigin;
			TEXTURE2D(_MotionNoiseTex);
			SAMPLER(sampler_Linear_Repeat);
			float TVE_WindLayers[10];
			TEXTURE2D_ARRAY(TVE_WindBaseTex);
			half4 TVE_RenderBaseCoords;
			SAMPLER(sampler_Linear_Clamp);
			TEXTURE2D_ARRAY(TVE_WindNearTex);
			half4 TVE_RenderNearCoords;
			float4 TVE_RenderNearPositionR;
			half TVE_RenderNearFadeValue;
			half4 TVE_WindParams;
			half _DisableSRPBatcher;


			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"

			float2 VectortoOctahedron( float3 N )
			{
				N /= dot( 1.0, abs( N ) );
				if( N.z <= 0 )
				{
				N.xy = ( 1 - abs( N.yx ) ) * ( N.xy >= 0 ? 1.0 : -1.0 );
				}
				return N.xy;
			}
			
			float3 OctahedronToVector( float2 Oct )
			{
				float3 N = float3( Oct, 1.0 - dot( 1.0, abs( Oct ) ) );
				if(N.z< 0 )
				{
				N.xy = ( 1 - abs( N.yx) ) * (N.xy >= 0 ? 1.0 : -1.0 );
				}
				return normalize( N);
			}
			
			inline void RayPlaneIntersectionUV( float3 normalOS, float3 rayPosition, float3 rayDirection, inout float2 uvs, inout float3 localNormal )
			{
				float lDotN = dot( rayDirection, normalOS ); 
				float p0l0DotN = dot( -rayPosition, normalOS );
				float t = p0l0DotN / lDotN;
				float3 p = rayDirection * t + rayPosition;
				float3 upVector = float3( 0, 1, 0 );
				float3 tangent = normalize( cross( upVector, normalOS ) + float3( -0.001, 0, 0 ) );
				float3 bitangent = cross( tangent, normalOS );
				float frameX = dot( p, tangent );
				float frameZ = dot( p, bitangent );
				uvs = -float2( frameX, frameZ );
				if( t <= 0.0 )
				uvs = 0;
				float3x3 worldToLocal = float3x3( tangent, bitangent, normalOS );
				localNormal = normalize( mul( worldToLocal, rayDirection ) );
			}
			
			inline void OctaImpostorVertex( inout float4 positionOS, inout float3 normalOS, inout float4 uvsFrame1, inout float4 uvsFrame2, inout float4 uvsFrame3, inout float4 octaFrame, inout float4 viewPos )
			{
				float2 uvOffset = _AI_SizeOffset.zw;
				float parallax = -_AI_Parallax; 
				float UVscale = _AI_ImpostorSize;
				float framesXY = _AI_Frames;
				float prevFrame = framesXY - 1;
				float3 fractions = 1.0 / float3( framesXY, prevFrame, UVscale );
				float fractionsFrame = fractions.x;
				float fractionsPrevFrame = fractions.y;
				float fractionsUVscale = fractions.z;
				float3 worldCameraPos;
				#if defined(UNITY_PASS_SHADOWCASTER)
				float3 worldOrigin = 0;
				float4 perspective = float4( 0, 0, 0, 1 );
				if ( UNITY_MATRIX_P[ 3 ][ 3 ] == 1 )
				{
				perspective = float4( 0, 0, 5000, 0 );
				worldOrigin = ai_ObjectToWorld._m03_m13_m23;
				}
				worldCameraPos = worldOrigin + mul( UNITY_MATRIX_I_V, perspective ).xyz;
				#else
				if ( UNITY_MATRIX_P[ 3 ][ 3 ] == 1 )
				{
				worldCameraPos = ai_ObjectToWorld._m03_m13_m23 + UNITY_MATRIX_I_V._m02_m12_m22 * 5000;
				}
				else
				{
				worldCameraPos = GetCameraRelativePositionWS( _WorldSpaceCameraPos );
				}
				#endif
				float3 objectCameraPosition = mul( ai_WorldToObject, float4( worldCameraPos, 1 ) ).xyz - _AI_Offset.xyz; 
				float3 objectCameraDirection = normalize( objectCameraPosition );
				float3 upVector = float3( 0,1,0 );
				float3 objectHorizontalVector = normalize( cross( objectCameraDirection, upVector ) );
				float3 objectVerticalVector = cross( objectHorizontalVector, objectCameraDirection );
				float2 uvExpansion = positionOS.xy;
				float3 billboard = objectHorizontalVector * uvExpansion.x + objectVerticalVector * uvExpansion.y;
				float3 localDir = billboard - objectCameraPosition; 
				objectCameraDirection = trunc( objectCameraDirection * 65536.0 ) / 65536.0;
				float2 frameOcta = VectortoOctahedron( objectCameraDirection.xzy ) * 0.5 + 0.5;
				float2 prevOctaFrame = frameOcta * prevFrame;
				float2 baseOctaFrame = floor( prevOctaFrame );
				float2 fractionOctaFrame = ( baseOctaFrame * fractionsFrame );
				float2 octaFrame1 = ( baseOctaFrame * fractionsPrevFrame ) * 2.0 - 1.0;
				float3 octa1WorldY = OctahedronToVector( octaFrame1 ).xzy;
				float3 octa1LocalY;
				float2 uvFrame1;
				RayPlaneIntersectionUV( octa1WorldY, objectCameraPosition, localDir, /*inout*/ uvFrame1, /*inout*/ octa1LocalY );
				float2 uvParallax1 = octa1LocalY.xy * fractionsFrame * parallax;
				uvFrame1 = ( uvFrame1 * fractionsUVscale + 0.5 ) * fractionsFrame + fractionOctaFrame;
				uvsFrame1 = float4( uvParallax1, uvFrame1) - float4( 0, 0, uvOffset );
				float2 fractPrevOctaFrame = frac( prevOctaFrame );
				float2 cornerDifference = lerp( float2( 0,1 ) , float2( 1,0 ) , saturate( ceil( ( fractPrevOctaFrame.x - fractPrevOctaFrame.y ) ) ));
				float2 octaFrame2 = ( ( baseOctaFrame + cornerDifference ) * fractionsPrevFrame ) * 2.0 - 1.0;
				float3 octa2WorldY = OctahedronToVector( octaFrame2 ).xzy;
				float3 octa2LocalY;
				float2 uvFrame2;
				RayPlaneIntersectionUV( octa2WorldY, objectCameraPosition, localDir, /*inout*/ uvFrame2, /*inout*/ octa2LocalY );
				float2 uvParallax2 = octa2LocalY.xy * fractionsFrame * parallax;
				uvFrame2 = ( uvFrame2 * fractionsUVscale + 0.5 ) * fractionsFrame + ( ( cornerDifference * fractionsFrame ) + fractionOctaFrame );
				uvsFrame2 = float4( uvParallax2, uvFrame2) - float4( 0, 0, uvOffset );
				float2 octaFrame3 = ( ( baseOctaFrame + 1 ) * fractionsPrevFrame  ) * 2.0 - 1.0;
				float3 octa3WorldY = OctahedronToVector( octaFrame3 ).xzy;
				float3 octa3LocalY;
				float2 uvFrame3;
				RayPlaneIntersectionUV( octa3WorldY, objectCameraPosition, localDir, /*inout*/ uvFrame3, /*inout*/ octa3LocalY );
				float2 uvParallax3 = octa3LocalY.xy * fractionsFrame * parallax;
				uvFrame3 = ( uvFrame3 * fractionsUVscale + 0.5 ) * fractionsFrame + ( fractionOctaFrame + fractionsFrame );
				uvsFrame3 = float4( uvParallax3, uvFrame3) - float4( 0, 0, uvOffset );
				octaFrame = 0;
				octaFrame.xy = prevOctaFrame;
				octaFrame.zw = fractionOctaFrame;
				positionOS.xyz = billboard + _AI_Offset.xyz;
				normalOS.xyz = objectCameraDirection;
				viewPos = 0;
				viewPos.xyz = TransformWorldToView( TransformObjectToWorld( positionOS.xyz ) );
			}
			
			float3 ObjectPosition_UNITY_MATRIX_M(  )
			{
				return float3(UNITY_MATRIX_M[0].w, UNITY_MATRIX_M[1].w, UNITY_MATRIX_M[2].w );
			}
			

			void BuildSurfaceData(FragInputs fragInputs, inout AlphaSurfaceDescription surfaceDescription, float3 V, out SurfaceData surfaceData, out float3 bentNormalWS)
			{
				ZERO_INITIALIZE(SurfaceData, surfaceData);

				surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;
				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
					surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
				#endif
				#ifdef _MATERIAL_FEATURE_TRANSMISSION
					surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
				#endif
				#ifdef _MATERIAL_FEATURE_ANISOTROPY
					surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;
				#endif

				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
					surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
				#endif
				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
					surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
				#endif

				#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
					surfaceData.baseColor *= (1.0 - Max3(surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b));
				#endif

				GetNormalWS( fragInputs, float3( 0.0f, 0.0f, 1.0f ), surfaceData.normalWS, float3( 1.0, 1.0, 1.0 ) );

				bentNormalWS = surfaceData.normalWS;

				#ifdef _HAS_REFRACTION
					if (_EnableSSRefraction)
					{

						surfaceData.transmittanceMask = (1.0 - surfaceDescription.Alpha);
						surfaceDescription.Alpha = 1.0;
					}
					else
					{
						surfaceData.ior = 1.0;
						surfaceData.transmittanceColor = float3(1.0, 1.0, 1.0);
						surfaceData.atDistance = 1.0;
						surfaceData.transmittanceMask = 0.0;
						surfaceDescription.Alpha = 1.0;
					}
				#else
					surfaceData.ior = 1.0;
					surfaceData.transmittanceColor = float3(1.0, 1.0, 1.0);
					surfaceData.atDistance = 1.0;
					surfaceData.transmittanceMask = 0.0;
				#endif

				surfaceData.tangentWS = normalize(T2W(fragInputs, 0).xyz);    // The tangent is not normalize in worldToTangent for mikkt. TODO: Check if it expected that we normalize with Morten. Tag: SURFACE_GRADIENT
				surfaceData.tangentWS = Orthonormalize(surfaceData.tangentWS, surfaceData.normalWS);

				#if defined(_SPECULAR_OCCLUSION_CUSTOM)
				#elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
					surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO(V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness(surfaceData.perceptualSmoothness));
				#elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
					surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion(ClampNdotV(dot(surfaceData.normalWS, V)), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness(surfaceData.perceptualSmoothness));
				#else
					surfaceData.specularOcclusion = 1.0;
				#endif
				#ifdef _ENABLE_GEOMETRIC_SPECULAR_AA
					surfaceData.perceptualSmoothness = GeometricNormalFiltering(surfaceData.perceptualSmoothness, T2W(fragInputs, 2), surfaceDescription.SpecularAAScreenSpaceVariance, surfaceDescription.SpecularAAThreshold);
				#endif
			}

			void GetSurfaceAndBuiltinData(AlphaSurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
			{
				//#ifdef LOD_FADE_CROSSFADE
				//	uint3 fadeMaskSeed = asuint((int3)(V * _ScreenSize.xyx));
				//	LODDitheringTransition(fadeMaskSeed, unity_LODFade.x);
				//#endif

				#ifdef _ALPHATEST_ON
					DoAlphaTest ( surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold );
				#endif

				float3 bentNormalWS;
				BuildSurfaceData(fragInputs, surfaceDescription, V, surfaceData, bentNormalWS);

				#if HAVE_DECALS
				if( _EnableDecals )
				{
					DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, surfaceDescription.Alpha);
					ApplyDecalToSurfaceData(decalSurfaceData, fragInputs.tangentToWorld[2], surfaceData);
				}
				#endif

				//#if defined( ASE_SRP_VERSION ) && ASE_SRP_VERSION <= 50702
					//InitBuiltinData( surfaceDescription.Alpha, bentNormalWS, -T2W(fragInputs, 2), fragInputs.positionRWS, fragInputs.texCoord1, fragInputs.texCoord2, builtinData );
				//#else
					InitBuiltinData( posInput, surfaceDescription.Alpha, bentNormalWS, -T2W(fragInputs, 2), fragInputs.texCoord1, fragInputs.texCoord2, builtinData );
				//#endif

				builtinData.depthOffset = 0.0;

				#if (SHADERPASS == SHADERPASS_DISTORTION)
					builtinData.distortion = surfaceDescription.Distortion;
					builtinData.distortionBlur = surfaceDescription.DistortionBlur;
				#else
					builtinData.distortion = float2(0.0, 0.0);
					builtinData.distortionBlur = 0.0;
				#endif

				PostInitBuiltinData(V, posInput, surfaceData, builtinData);
			}

			PackedVaryingsMeshToPS Vert(AttributesMesh inputMesh  )
			{
				UNITY_SETUP_INSTANCE_ID( inputMesh );
				PackedVaryingsMeshToPS outputPackedVaryingsMeshToPS;
				UNITY_TRANSFER_INSTANCE_ID( inputMesh, outputPackedVaryingsMeshToPS );

				TVEModelData Data16_g158299 = (TVEModelData)0;
				float In_Dummy16_g158299 = 0.0;
				TVEModelData Data16_g158264 = (TVEModelData)0;
				half4 Dummy181_g158262 = ( ( _MotionWindCategory + _MotionWindEnd ) + _MotionWindElementMode + ( _MotionInteractionCategory + _MotionInteractionEnd ) + ( _InteractionLiteInfo + _InteractionColoring + _MotionPushIntensityValue + _MotionPushPivotValue + _MotionPushMaskValue + _MotionPushElementMode ) );
				float In_Dummy16_g158264 = Dummy181_g158262.r;
				TVEModelData Data16_g157153 = (TVEModelData)0;
				float In_Dummy16_g157153 = 0.0;
				OctaImpostorVertex( inputMesh.positionOS, inputMesh.normalOS, outputPackedVaryingsMeshToPS.UVsFrame122_g156549, outputPackedVaryingsMeshToPS.UVsFrame222_g156549, outputPackedVaryingsMeshToPS.UVsFrame322_g156549, outputPackedVaryingsMeshToPS.octaframe22_g156549, outputPackedVaryingsMeshToPS.viewPos22_g156549 );
				float3 worldPosOut22_g156549 = GetAbsolutePositionWS( mul( UNITY_MATRIX_I_V, float4( outputPackedVaryingsMeshToPS.viewPos22_g156549.xyz, 1.0 ) ).xyz );
				half3 Input_PositionWS218_g157146 = worldPosOut22_g156549;
				float3 worldToObj278_g157146 = mul( GetWorldToObjectMatrix(), float4( GetCameraRelativePositionWS(Input_PositionWS218_g157146), 1 ) ).xyz;
				half3 Model_PositionOS131_g157146 = worldToObj278_g157146;
				float3 In_PositionOS16_g157153 = Model_PositionOS131_g157146;
				half3 Model_PositionWS122_g157146 = Input_PositionWS218_g157146;
				float3 In_PositionWS16_g157153 = Model_PositionWS122_g157146;
				half3 Model_PositionWO132_g157146 = ( Model_PositionWS122_g157146 - TVE_WorldOrigin );
				float3 In_PositionWO16_g157153 = Model_PositionWO132_g157146;
				float3 In_PositionRawOS16_g157153 = Model_PositionOS131_g157146;
				float3 In_PositionAddOS16_g157153 = float3( 0,0,0 );
				float3 In_PivotOS16_g157153 = float3( 0,0,0 );
				float3 localObjectPosition_UNITY_MATRIX_M14_g157148 = ObjectPosition_UNITY_MATRIX_M();
				#ifdef SHADEROPTIONS_CAMERA_RELATIVE_RENDERING
				float3 staticSwitch13_g157148 = ( localObjectPosition_UNITY_MATRIX_M14_g157148 + _WorldSpaceCameraPos );
				#else
				float3 staticSwitch13_g157148 = localObjectPosition_UNITY_MATRIX_M14_g157148;
				#endif
				half3 ObjectData20_g157150 = staticSwitch13_g157148;
				float3 ase_worldPos = GetAbsolutePositionWS( TransformObjectToWorld( (inputMesh.positionOS).xyz ) );
				half3 WorldData19_g157150 = ase_worldPos;
				#ifdef TVE_OBJECT_BATCHED
				float3 staticSwitch14_g157150 = WorldData19_g157150;
				#else
				float3 staticSwitch14_g157150 = ObjectData20_g157150;
				#endif
				float3 temp_output_124_0_g157148 = staticSwitch14_g157150;
				float3 vertexToFrag281_g157146 = temp_output_124_0_g157148;
				half3 Model_PivotWS121_g157146 = vertexToFrag281_g157146;
				float3 In_PivotWS16_g157153 = Model_PivotWS121_g157146;
				half3 Model_PivotWO133_g157146 = ( Model_PivotWS121_g157146 - TVE_WorldOrigin );
				float3 In_PivotWO16_g157153 = Model_PivotWO133_g157146;
				half3 Model_NormalOS134_g157146 = inputMesh.normalOS;
				float3 In_NormalOS16_g157153 = Model_NormalOS134_g157146;
				float3 ase_worldNormal = TransformObjectToWorldNormal(inputMesh.normalOS);
				half3 Model_Normal_WS95_g157146 = ase_worldNormal;
				float3 In_NormalWS16_g157153 = Model_Normal_WS95_g157146;
				float3 In_NormalRawOS16_g157153 = Model_NormalOS134_g157146;
				float3 In_NormalRawWS16_g157153 = Model_Normal_WS95_g157146;
				float4 In_TangentOS16_g157153 = float4( 0,1,0,1 );
				float3 normalizeResult326_g157146 = normalize( ( _WorldSpaceCameraPos - Model_PositionWS122_g157146 ) );
				half3 Model_ViewDirWS322_g157146 = normalizeResult326_g157146;
				float3 In_ViewDirWS16_g157153 = Model_ViewDirWS322_g157146;
				float4 In_VertexData16_g157153 = float4( 1,1,1,1 );
				float4 In_MotionData16_g157153 = float4( 0,0,0,0 );
				float4 In_BoundsData16_g157153 = float4( 1,1,1,1 );
				float4 In_RotationData16_g157153 = float4( 0,0,0,0 );
				Data16_g157153.Dummy = In_Dummy16_g157153;
				Data16_g157153.PositionOS = In_PositionOS16_g157153;
				Data16_g157153.PositionWS = In_PositionWS16_g157153;
				Data16_g157153.PositionWO = In_PositionWO16_g157153;
				Data16_g157153.PositionRawOS = In_PositionRawOS16_g157153;
				Data16_g157153.PositionAddOS = In_PositionAddOS16_g157153;
				Data16_g157153.PivotOS = In_PivotOS16_g157153;
				Data16_g157153.PivotWS = In_PivotWS16_g157153;
				Data16_g157153.PivotWO = In_PivotWO16_g157153;
				Data16_g157153.NormalOS = In_NormalOS16_g157153;
				Data16_g157153.NormalWS = In_NormalWS16_g157153;
				Data16_g157153.NormalRawOS = In_NormalRawOS16_g157153;
				Data16_g157153.NormalRawWS = In_NormalRawWS16_g157153;
				Data16_g157153.TangentOS = In_TangentOS16_g157153;
				Data16_g157153.ViewDirWS = In_ViewDirWS16_g157153;
				Data16_g157153.VertexData = In_VertexData16_g157153;
				Data16_g157153.MotionData = In_MotionData16_g157153;
				Data16_g157153.BoundsData = In_BoundsData16_g157153;
				Data16_g157153.RotationData = In_RotationData16_g157153;
				TVEModelData Data15_g158263 = Data16_g157153;
				float Out_Dummy15_g158263 = 0;
				float3 Out_PositionOS15_g158263 = float3( 0,0,0 );
				float3 Out_PositionWS15_g158263 = float3( 0,0,0 );
				float3 Out_PositionWO15_g158263 = float3( 0,0,0 );
				float3 Out_PositionRawOS15_g158263 = float3( 0,0,0 );
				float3 Out_PositionAddOS15_g158263 = float3( 0,0,0 );
				float3 Out_PivotOS15_g158263 = float3( 0,0,0 );
				float3 Out_PivotWS15_g158263 = float3( 0,0,0 );
				float3 Out_PivotWO15_g158263 = float3( 0,0,0 );
				float3 Out_NormalOS15_g158263 = float3( 0,0,0 );
				float3 Out_NormalWS15_g158263 = float3( 0,0,0 );
				float3 Out_NormalRawOS15_g158263 = float3( 0,0,0 );
				float3 Out_NormalRawWS15_g158263 = float3( 0,0,0 );
				float4 Out_TangentOS15_g158263 = float4( 0,0,0,0 );
				float3 Out_ViewDirWS15_g158263 = float3( 0,0,0 );
				float4 Out_VertexData15_g158263 = float4( 0,0,0,0 );
				float4 Out_MotionData15_g158263 = float4( 0,0,0,0 );
				float4 Out_BoundsData15_g158263 = float4( 0,0,0,0 );
				float4 Out_RotationData15_g158263 = float4( 0,0,0,0 );
				Out_Dummy15_g158263 = Data15_g158263.Dummy;
				Out_PositionOS15_g158263 = Data15_g158263.PositionOS;
				Out_PositionWS15_g158263 = Data15_g158263.PositionWS;
				Out_PositionWO15_g158263 = Data15_g158263.PositionWO;
				Out_PositionRawOS15_g158263 = Data15_g158263.PositionRawOS;
				Out_PositionAddOS15_g158263 = Data15_g158263.PositionAddOS;
				Out_PivotOS15_g158263 = Data15_g158263.PivotOS;
				Out_PivotWS15_g158263 = Data15_g158263.PivotWS;
				Out_PivotWO15_g158263 = Data15_g158263.PivotWO;
				Out_NormalOS15_g158263 = Data15_g158263.NormalOS;
				Out_NormalWS15_g158263 = Data15_g158263.NormalWS;
				Out_NormalRawOS15_g158263 = Data15_g158263.NormalRawOS;
				Out_NormalRawWS15_g158263 = Data15_g158263.NormalRawWS;
				Out_TangentOS15_g158263 = Data15_g158263.TangentOS;
				Out_ViewDirWS15_g158263 = Data15_g158263.ViewDirWS;
				Out_VertexData15_g158263 = Data15_g158263.VertexData;
				Out_MotionData15_g158263 = Data15_g158263.MotionData;
				Out_BoundsData15_g158263 = Data15_g158263.BoundsData;
				Out_RotationData15_g158263 = Data15_g158263.RotationData;
				float3 temp_output_1567_0_g158262 = Out_PositionOS15_g158263;
				float3 In_PositionOS16_g158264 = temp_output_1567_0_g158262;
				float3 In_PositionWS16_g158264 = Out_PositionWS15_g158263;
				float3 temp_output_1567_17_g158262 = Out_PositionWO15_g158263;
				float3 In_PositionWO16_g158264 = temp_output_1567_17_g158262;
				float3 In_PositionRawOS16_g158264 = Out_PositionRawOS15_g158263;
				float3 In_PositionAddOS16_g158264 = Out_PositionAddOS15_g158263;
				float3 In_PivotOS16_g158264 = Out_PivotOS15_g158263;
				float3 In_PivotWS16_g158264 = Out_PivotWS15_g158263;
				float3 temp_output_1567_19_g158262 = Out_PivotWO15_g158263;
				float3 In_PivotWO16_g158264 = temp_output_1567_19_g158262;
				float3 In_NormalOS16_g158264 = Out_NormalOS15_g158263;
				float3 In_NormalWS16_g158264 = Out_NormalWS15_g158263;
				float3 In_NormalRawOS16_g158264 = Out_NormalRawOS15_g158263;
				float3 In_NormalRawWS16_g158264 = Out_NormalRawWS15_g158263;
				float4 In_TangentOS16_g158264 = Out_TangentOS15_g158263;
				float3 In_ViewDirWS16_g158264 = Out_ViewDirWS15_g158263;
				float4 In_VertexData16_g158264 = Out_VertexData15_g158263;
				float4 In_MotionData16_g158264 = Out_MotionData15_g158263;
				float4 In_BoundsData16_g158264 = Out_BoundsData15_g158263;
				float2 temp_cast_1 = (0.0).xx;
				half3 Model_PositionOS147_g158262 = temp_output_1567_0_g158262;
				half Base_Mask217_g158262 = saturate( ( Model_PositionOS147_g158262.y / _AI_Offset.y ) );
				half3 Model_PositionWO162_g158262 = temp_output_1567_17_g158262;
				half3 Model_PivotWO402_g158262 = temp_output_1567_19_g158262;
				float3 lerpResult829_g158262 = lerp( Model_PositionWO162_g158262 , Model_PivotWO402_g158262 , _MotionBasePivotValue);
				half3 Base_Position1394_g158262 = lerpResult829_g158262;
				half3 Input_PositionWO419_g158267 = Base_Position1394_g158262;
				half Flow_Tillling1397_g158262 = _MotionTillingValue;
				half Input_MotionTilling321_g158267 = ( Flow_Tillling1397_g158262 + 0.2 );
				half2 Noise_Coord515_g158267 = ( -(Input_PositionWO419_g158267).xz * Input_MotionTilling321_g158267 * 0.005 );
				half4 Noise_Params535_g158267 = SAMPLE_TEXTURE2D_LOD( _MotionNoiseTex, sampler_Linear_Repeat, Noise_Coord515_g158267, 0.0 );
				float2 temp_output_648_0_g158267 = (Noise_Params535_g158267).rg;
				half Flow_Value1602_g158262 = _MotionIntensityValue;
				half Input_MotionValue629_g158267 = Flow_Value1602_g158262;
				float2 lerpResult645_g158267 = lerp( float2( 0.5,0.5 ) , temp_output_648_0_g158267 , Input_MotionValue629_g158267);
				float3 appendResult566_g158267 = (float3(lerpResult645_g158267 , (Noise_Params535_g158267).b));
				float temp_output_136_0_g158268 = _global_wind_layer_value;
				float temp_output_19_0_g158270 = TVE_WindLayers[(int)temp_output_136_0_g158268];
				half3 Input_Position180_g158271 = Input_PositionWO419_g158267;
				float2 temp_output_75_0_g158271 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g158271).xz ) );
				float temp_output_82_0_g158271 = temp_output_136_0_g158268;
				float2 temp_output_119_0_g158271 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g158271).xz ) );
				float temp_output_7_0_g158276 = 1.0;
				float temp_output_10_0_g158276 = ( TVE_RenderNearFadeValue - temp_output_7_0_g158276 );
				float4 lerpResult131_g158271 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_WindBaseTex, sampler_Linear_Clamp, temp_output_75_0_g158271,temp_output_82_0_g158271, 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_WindNearTex, sampler_Linear_Repeat, temp_output_119_0_g158271,temp_output_82_0_g158271, 0.0 ) , saturate( ( ( saturate( ( distance( Input_Position180_g158271 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g158276 ) / temp_output_10_0_g158276 ) ));
				float4 temp_output_17_0_g158270 = lerpResult131_g158271;
				float4 temp_output_3_0_g158270 = TVE_WindParams;
				float4 ifLocalVar18_g158270 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g158270 >= 0.5 )
				ifLocalVar18_g158270 = temp_output_17_0_g158270;
				else
				ifLocalVar18_g158270 = temp_output_3_0_g158270;
				float4 lerpResult22_g158270 = lerp( temp_output_3_0_g158270 , temp_output_17_0_g158270 , temp_output_19_0_g158270);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g158270 = lerpResult22_g158270;
				#else
				float4 staticSwitch24_g158270 = ifLocalVar18_g158270;
				#endif
				float4 temp_output_610_0_g158267 = staticSwitch24_g158270;
				float3 appendResult643_g158267 = (float3((temp_output_610_0_g158267).rg , (temp_output_610_0_g158267).b));
				float3 lerpResult623_g158267 = lerp( appendResult566_g158267 , appendResult643_g158267 , (temp_output_610_0_g158267).a);
				#ifdef TVE_MOTION_WIND_ELEMENT
				float3 staticSwitch612_g158267 = lerpResult623_g158267;
				#else
				float3 staticSwitch612_g158267 = appendResult566_g158267;
				#endif
				float3 temp_output_1620_567_g158262 = staticSwitch612_g158267;
				half Base_Noise1590_g158262 = (temp_output_1620_567_g158262).z;
				float2 break83_g158266 = ((temp_output_1620_567_g158262).xy*2.0 + -1.0);
				float3 appendResult79_g158266 = (float3(break83_g158266.x , 0.0 , break83_g158266.y));
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				half2 Base_Direction893_g158262 = (( mul( GetWorldToObjectMatrix(), float4( appendResult79_g158266 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half Base_Intensity1615_g158262 = length( Base_Direction893_g158262 );
				half Flow_Delay1626_g158262 = _MotionDelayValue;
				float lerpResult1623_g158262 = lerp( 1.0 , ( Base_Intensity1615_g158262 * Base_Intensity1615_g158262 ) , Flow_Delay1626_g158262);
				#ifdef TVE_MOTION_BASE_BENDING
				float2 staticSwitch1573_g158262 = ( _MotionBaseIntensityValue * Base_Mask217_g158262 * Base_Noise1590_g158262 * Base_Direction893_g158262 * lerpResult1623_g158262 );
				#else
				float2 staticSwitch1573_g158262 = temp_cast_1;
				#endif
				half2 Base_Motion1440_g158262 = staticSwitch1573_g158262;
				half2 Final_RoationData1570_g158262 = Base_Motion1440_g158262;
				float4 In_RotationData16_g158264 = float4( Final_RoationData1570_g158262, 0.0 , 0.0 );
				Data16_g158264.Dummy = In_Dummy16_g158264;
				Data16_g158264.PositionOS = In_PositionOS16_g158264;
				Data16_g158264.PositionWS = In_PositionWS16_g158264;
				Data16_g158264.PositionWO = In_PositionWO16_g158264;
				Data16_g158264.PositionRawOS = In_PositionRawOS16_g158264;
				Data16_g158264.PositionAddOS = In_PositionAddOS16_g158264;
				Data16_g158264.PivotOS = In_PivotOS16_g158264;
				Data16_g158264.PivotWS = In_PivotWS16_g158264;
				Data16_g158264.PivotWO = In_PivotWO16_g158264;
				Data16_g158264.NormalOS = In_NormalOS16_g158264;
				Data16_g158264.NormalWS = In_NormalWS16_g158264;
				Data16_g158264.NormalRawOS = In_NormalRawOS16_g158264;
				Data16_g158264.NormalRawWS = In_NormalRawWS16_g158264;
				Data16_g158264.TangentOS = In_TangentOS16_g158264;
				Data16_g158264.ViewDirWS = In_ViewDirWS16_g158264;
				Data16_g158264.VertexData = In_VertexData16_g158264;
				Data16_g158264.MotionData = In_MotionData16_g158264;
				Data16_g158264.BoundsData = In_BoundsData16_g158264;
				Data16_g158264.RotationData = In_RotationData16_g158264;
				TVEModelData Data15_g158298 = Data16_g158264;
				float Out_Dummy15_g158298 = 0;
				float3 Out_PositionOS15_g158298 = float3( 0,0,0 );
				float3 Out_PositionWS15_g158298 = float3( 0,0,0 );
				float3 Out_PositionWO15_g158298 = float3( 0,0,0 );
				float3 Out_PositionRawOS15_g158298 = float3( 0,0,0 );
				float3 Out_PositionAddOS15_g158298 = float3( 0,0,0 );
				float3 Out_PivotOS15_g158298 = float3( 0,0,0 );
				float3 Out_PivotWS15_g158298 = float3( 0,0,0 );
				float3 Out_PivotWO15_g158298 = float3( 0,0,0 );
				float3 Out_NormalOS15_g158298 = float3( 0,0,0 );
				float3 Out_NormalWS15_g158298 = float3( 0,0,0 );
				float3 Out_NormalRawOS15_g158298 = float3( 0,0,0 );
				float3 Out_NormalRawWS15_g158298 = float3( 0,0,0 );
				float4 Out_TangentOS15_g158298 = float4( 0,0,0,0 );
				float3 Out_ViewDirWS15_g158298 = float3( 0,0,0 );
				float4 Out_VertexData15_g158298 = float4( 0,0,0,0 );
				float4 Out_MotionData15_g158298 = float4( 0,0,0,0 );
				float4 Out_BoundsData15_g158298 = float4( 0,0,0,0 );
				float4 Out_RotationData15_g158298 = float4( 0,0,0,0 );
				Out_Dummy15_g158298 = Data15_g158298.Dummy;
				Out_PositionOS15_g158298 = Data15_g158298.PositionOS;
				Out_PositionWS15_g158298 = Data15_g158298.PositionWS;
				Out_PositionWO15_g158298 = Data15_g158298.PositionWO;
				Out_PositionRawOS15_g158298 = Data15_g158298.PositionRawOS;
				Out_PositionAddOS15_g158298 = Data15_g158298.PositionAddOS;
				Out_PivotOS15_g158298 = Data15_g158298.PivotOS;
				Out_PivotWS15_g158298 = Data15_g158298.PivotWS;
				Out_PivotWO15_g158298 = Data15_g158298.PivotWO;
				Out_NormalOS15_g158298 = Data15_g158298.NormalOS;
				Out_NormalWS15_g158298 = Data15_g158298.NormalWS;
				Out_NormalRawOS15_g158298 = Data15_g158298.NormalRawOS;
				Out_NormalRawWS15_g158298 = Data15_g158298.NormalRawWS;
				Out_TangentOS15_g158298 = Data15_g158298.TangentOS;
				Out_ViewDirWS15_g158298 = Data15_g158298.ViewDirWS;
				Out_VertexData15_g158298 = Data15_g158298.VertexData;
				Out_MotionData15_g158298 = Data15_g158298.MotionData;
				Out_BoundsData15_g158298 = Data15_g158298.BoundsData;
				Out_RotationData15_g158298 = Data15_g158298.RotationData;
				half3 Model_PositionOS147_g158297 = Out_PositionOS15_g158298;
				half3 Input_False58_g158303 = Model_PositionOS147_g158297;
				half3 VertexPos40_g158300 = Model_PositionOS147_g158297;
				half3 VertexPos40_g158301 = VertexPos40_g158300;
				float3 appendResult74_g158301 = (float3(VertexPos40_g158301.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g158301 = appendResult74_g158301;
				float3 break84_g158301 = VertexPos40_g158301;
				float3 appendResult81_g158301 = (float3(0.0 , break84_g158301.y , break84_g158301.z));
				half3 VertexPosOtherAxis82_g158301 = appendResult81_g158301;
				float4 temp_output_1567_33_g158297 = Out_RotationData15_g158298;
				half4 Model_VertexBend1569_g158297 = temp_output_1567_33_g158297;
				half2 Angle44_g158300 = (Model_VertexBend1569_g158297).xy;
				half Angle44_g158301 = (Angle44_g158300).y;
				half3 VertexPos40_g158302 = ( VertexPosRotationAxis50_g158301 + ( VertexPosOtherAxis82_g158301 * cos( Angle44_g158301 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g158301 ) * sin( Angle44_g158301 ) ) );
				float3 appendResult74_g158302 = (float3(0.0 , 0.0 , VertexPos40_g158302.z));
				half3 VertexPosRotationAxis50_g158302 = appendResult74_g158302;
				float3 break84_g158302 = VertexPos40_g158302;
				float3 appendResult81_g158302 = (float3(break84_g158302.x , break84_g158302.y , 0.0));
				half3 VertexPosOtherAxis82_g158302 = appendResult81_g158302;
				half Angle44_g158302 = -(Angle44_g158300).x;
				half3 Input_True57_g158303 = ( VertexPosRotationAxis50_g158302 + ( VertexPosOtherAxis82_g158302 * cos( Angle44_g158302 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g158302 ) * sin( Angle44_g158302 ) ) );
				#ifdef TVE_MOTION_BASE_BENDING
				float3 staticSwitch65_g158303 = Input_True57_g158303;
				#else
				float3 staticSwitch65_g158303 = Input_False58_g158303;
				#endif
				#ifdef TVE_MOTION_PUSH_BENDING
				float3 staticSwitch67_g158303 = Input_True57_g158303;
				#else
				float3 staticSwitch67_g158303 = staticSwitch65_g158303;
				#endif
				#ifdef TVE_BLANKET_BENDING
				float3 staticSwitch69_g158303 = Input_True57_g158303;
				#else
				float3 staticSwitch69_g158303 = staticSwitch67_g158303;
				#endif
				float3 temp_output_1578_0_g158297 = staticSwitch69_g158303;
				float3 temp_output_1567_31_g158297 = Out_PositionAddOS15_g158298;
				half3 Model_PositionADD1568_g158297 = temp_output_1567_31_g158297;
				half3 Final_PositionOS178_g158297 = ( temp_output_1578_0_g158297 + Model_PositionADD1568_g158297 );
				float3 In_PositionOS16_g158299 = Final_PositionOS178_g158297;
				float3 In_PositionWS16_g158299 = Out_PositionWS15_g158298;
				float3 In_PositionWO16_g158299 = Out_PositionWO15_g158298;
				float3 In_PositionRawOS16_g158299 = Out_PositionRawOS15_g158298;
				float3 In_PositionAddOS16_g158299 = temp_output_1567_31_g158297;
				float3 In_PivotOS16_g158299 = Out_PivotOS15_g158298;
				float3 In_PivotWS16_g158299 = Out_PivotWS15_g158298;
				float3 In_PivotWO16_g158299 = Out_PivotWO15_g158298;
				float3 In_NormalOS16_g158299 = Out_NormalOS15_g158298;
				float3 In_NormalWS16_g158299 = Out_NormalWS15_g158298;
				float3 In_NormalRawOS16_g158299 = Out_NormalRawOS15_g158298;
				float3 In_NormalRawWS16_g158299 = Out_NormalRawWS15_g158298;
				float4 In_TangentOS16_g158299 = Out_TangentOS15_g158298;
				float3 In_ViewDirWS16_g158299 = Out_ViewDirWS15_g158298;
				float4 In_VertexData16_g158299 = Out_VertexData15_g158298;
				float4 In_MotionData16_g158299 = Out_MotionData15_g158298;
				float4 In_BoundsData16_g158299 = Out_BoundsData15_g158298;
				float4 In_RotationData16_g158299 = temp_output_1567_33_g158297;
				Data16_g158299.Dummy = In_Dummy16_g158299;
				Data16_g158299.PositionOS = In_PositionOS16_g158299;
				Data16_g158299.PositionWS = In_PositionWS16_g158299;
				Data16_g158299.PositionWO = In_PositionWO16_g158299;
				Data16_g158299.PositionRawOS = In_PositionRawOS16_g158299;
				Data16_g158299.PositionAddOS = In_PositionAddOS16_g158299;
				Data16_g158299.PivotOS = In_PivotOS16_g158299;
				Data16_g158299.PivotWS = In_PivotWS16_g158299;
				Data16_g158299.PivotWO = In_PivotWO16_g158299;
				Data16_g158299.NormalOS = In_NormalOS16_g158299;
				Data16_g158299.NormalWS = In_NormalWS16_g158299;
				Data16_g158299.NormalRawOS = In_NormalRawOS16_g158299;
				Data16_g158299.NormalRawWS = In_NormalRawWS16_g158299;
				Data16_g158299.TangentOS = In_TangentOS16_g158299;
				Data16_g158299.ViewDirWS = In_ViewDirWS16_g158299;
				Data16_g158299.VertexData = In_VertexData16_g158299;
				Data16_g158299.MotionData = In_MotionData16_g158299;
				Data16_g158299.BoundsData = In_BoundsData16_g158299;
				Data16_g158299.RotationData = In_RotationData16_g158299;
				TVEModelData Data15_g158319 = Data16_g158299;
				float Out_Dummy15_g158319 = 0;
				float3 Out_PositionOS15_g158319 = float3( 0,0,0 );
				float3 Out_PositionWS15_g158319 = float3( 0,0,0 );
				float3 Out_PositionWO15_g158319 = float3( 0,0,0 );
				float3 Out_PositionRawOS15_g158319 = float3( 0,0,0 );
				float3 Out_PositionAddOS15_g158319 = float3( 0,0,0 );
				float3 Out_PivotOS15_g158319 = float3( 0,0,0 );
				float3 Out_PivotWS15_g158319 = float3( 0,0,0 );
				float3 Out_PivotWO15_g158319 = float3( 0,0,0 );
				float3 Out_NormalOS15_g158319 = float3( 0,0,0 );
				float3 Out_NormalWS15_g158319 = float3( 0,0,0 );
				float3 Out_NormalRawOS15_g158319 = float3( 0,0,0 );
				float3 Out_NormalRawWS15_g158319 = float3( 0,0,0 );
				float4 Out_TangentOS15_g158319 = float4( 0,0,0,0 );
				float3 Out_ViewDirWS15_g158319 = float3( 0,0,0 );
				float4 Out_VertexData15_g158319 = float4( 0,0,0,0 );
				float4 Out_MotionData15_g158319 = float4( 0,0,0,0 );
				float4 Out_BoundsData15_g158319 = float4( 0,0,0,0 );
				float4 Out_RotationData15_g158319 = float4( 0,0,0,0 );
				Out_Dummy15_g158319 = Data15_g158319.Dummy;
				Out_PositionOS15_g158319 = Data15_g158319.PositionOS;
				Out_PositionWS15_g158319 = Data15_g158319.PositionWS;
				Out_PositionWO15_g158319 = Data15_g158319.PositionWO;
				Out_PositionRawOS15_g158319 = Data15_g158319.PositionRawOS;
				Out_PositionAddOS15_g158319 = Data15_g158319.PositionAddOS;
				Out_PivotOS15_g158319 = Data15_g158319.PivotOS;
				Out_PivotWS15_g158319 = Data15_g158319.PivotWS;
				Out_PivotWO15_g158319 = Data15_g158319.PivotWO;
				Out_NormalOS15_g158319 = Data15_g158319.NormalOS;
				Out_NormalWS15_g158319 = Data15_g158319.NormalWS;
				Out_NormalRawOS15_g158319 = Data15_g158319.NormalRawOS;
				Out_NormalRawWS15_g158319 = Data15_g158319.NormalRawWS;
				Out_TangentOS15_g158319 = Data15_g158319.TangentOS;
				Out_ViewDirWS15_g158319 = Data15_g158319.ViewDirWS;
				Out_VertexData15_g158319 = Data15_g158319.VertexData;
				Out_MotionData15_g158319 = Data15_g158319.MotionData;
				Out_BoundsData15_g158319 = Data15_g158319.BoundsData;
				Out_RotationData15_g158319 = Data15_g158319.RotationData;
				float3 temp_output_31_0_g158312 = Out_PositionOS15_g158319;
				float3 temp_output_6_0_g158326 = ( ( temp_output_31_0_g158312 - Out_PositionRawOS15_g158319 ) + _DisableSRPBatcher );
				half4 Dummy_Data505 = ( ( ( _VariationLiteInfo + _VariationColoring ) + ( _VariationCategory + _VariationEnd ) + ( _VariationIntensityValue + _VariationColorTwo + _VariationColorOne ) + ( _VariationMultiValue + _VariationNoiseRemap + _VariationNoisePivotsValue1 + _VariationNoiseTillingValue ) ) + ( ( _TintingLiteInfo + _TintingColoring ) + ( _TintingCategory + _TintingEnd + _TintingSpace + 0.0 + _TintingElementMode ) + ( _TintingIntensityValue + _TintingColor + _TintingGrayValue ) + ( _TintingMultiValue + _TintingLumaValue + _TintingLumaRemap ) + 0.0 + 0.0 ) + ( ( _DrynessLiteInfo + _DrynessColoring ) + ( _DrynessCategory + _DrynessEnd + _DrynessSpace + _DrynessElementMode + 0.0 ) + ( _DrynessIntensityValue + _DrynessColor + _DrynessGrayValue + _DrynessShiftValue + _DrynessSmoothnessValue + _DrynessSubsurfaceValue ) + ( _DrynessMultiValue + _DrynessLumaValue + _DrynessLumaRemap ) + 0.0 + 0.0 ) + ( ( _WetnessLiteInfo + _WetnessColoring ) + ( _WetnessCategory + _WetnessEnd + _WetnessElementMode + 0.0 ) + ( _WetnessIntensityValue + _WetnessContrastValue + _WetnessSmoothnessValue ) + float4( 0,0,0,0 ) + float4( 0,0,0,0 ) ) + ( ( _CutoutLiteInfo + _CutoutColoring ) + ( _CutoutCategory + _CutoutEnd + _CutoutSpace + _CutoutElementMode + 0.0 ) + ( _CutoutIntensityValue + _CutoutShadowMode ) + ( _CutoutMultiValue + _CutoutAlphaValue + _CutoutNoiseValue + _CutoutNoiseTillingValue ) + 0.0 ) + ( ( _DitherLiteInfo + _DitherColoring ) + ( _DitherCategory + _DitherEnd ) + ( _DitherConstantValue + 0.0 + 0.0 + ( _DitherDistanceValue + _DitherDistanceMaxValue + _DitherDistanceMinValue ) + _DitherShadowMode ) + ( _DitherMultiValue + _DitherNoiseTillingValue ) ) + ( ( _SizeFadeLiteInfo + _SizeFadeColoring ) + ( _SizeFadeCategory + _SizeFadeEnd + _SizeFadeElementMode ) + ( _SizeFadeIntensityValue + _SizeFadeScaleMode + _SizeFadeScaleValue + _SizeFadeDistMinValue + _SizeFadeDistMaxValue ) ) );
				#ifdef TVE_REGISTER
				float4 staticSwitch14_g158326 = ( float4( temp_output_6_0_g158326 , 0.0 ) + ( Dummy_Data505 * float4( 0,0,0,0 ) ) );
				#else
				float4 staticSwitch14_g158326 = float4( temp_output_6_0_g158326 , 0.0 );
				#endif
				
				inputMesh.positionOS.xyz += staticSwitch14_g158326.rgb;

				float3 positionRWS = TransformObjectToWorld(inputMesh.positionOS.xyz );
				outputPackedVaryingsMeshToPS.positionCS = TransformWorldToHClip(positionRWS);
				return outputPackedVaryingsMeshToPS;
			}

			void Frag(  PackedVaryingsMeshToPS packedInput
				#ifdef WRITE_NORMAL_BUFFER
				, out float4 outNormalBuffer : SV_Target0
					#ifdef WRITE_MSAA_DEPTH
				, out float1 depthColor : SV_Target1
					#endif
				#elif defined(SCENESELECTIONPASS)
				, out float4 outColor : SV_Target0
				#endif
				, out float outputDepth : SV_Depth
				
			)
			{
				UNITY_SETUP_INSTANCE_ID( packedInput );

				//#ifdef LOD_FADE_CROSSFADE
				//float3 VC = GetWorldSpaceNormalizeViewDir(packedInput.interp00.xyz);
				//LODDitheringTransition(ComputeFadeMaskSeed(VC, packedInput.positionCS.xy), unity_LODFade.x);
				//#endif

				FragInputs input;
				ZERO_INITIALIZE(FragInputs, input);
				AlphaSurfaceDescription surfaceDescription = (AlphaSurfaceDescription)0;
				SurfaceOutput o = (SurfaceOutput)0;

				o.Normal = float3( 0, 0, 1 );
				float4 positionCS = 0;
				float3 positionWS = 0;
				
				surfaceDescription.Alpha = 1;

				#ifdef _ALPHATEST_ON
				surfaceDescription.AlphaClipThreshold = 0;
				#endif

				packedInput.positionCS.zw = positionCS.zw;
				float3 positionRWS = positionWS;

				//#if defined( ASE_SRP_VERSION ) && ASE_SRP_VERSION < 60900
				//input.worldToTangent = k_identity3x3;
				//#else
				input.tangentToWorld = k_identity3x3;
				//#endif

				input.positionSS = packedInput.positionCS;
				input.positionRWS = positionRWS;
				PositionInputs posInput = GetPositionInput( input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS );

				float3 normalizedWorldViewDir = GetWorldSpaceNormalizeViewDir( input.positionRWS );

				SurfaceData surfaceData;
				BuiltinData builtinData;

				GetSurfaceAndBuiltinData(surfaceDescription,input, normalizedWorldViewDir, posInput, surfaceData, builtinData);

				outputDepth = posInput.deviceDepth;

				#ifdef WRITE_NORMAL_BUFFER
					EncodeIntoNormalBuffer(ConvertSurfaceDataToNormalData(surfaceData), posInput.positionSS, outNormalBuffer);
					#ifdef WRITE_MSAA_DEPTH
					depthColor = packedInput.positionCS.z;
					#endif
				#elif defined(SCENESELECTIONPASS)
					outColor = float4(_ObjectId, _PassValue, 1.0, 1.0);
				#endif
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "META"
			Tags { "LightMode"="Meta" }
			Cull Off

			HLSLPROGRAM

			#pragma shader_feature_local_fragment _DISABLE_DECALS
			#pragma shader_feature_local_fragment _DISABLE_SSR
			#define _MATERIAL_FEATURE_TRANSMISSION 1
			#define ASE_SRP_VERSION 140011
			#ifdef UNITY_COLORSPACE_GAMMA//AI_SRP
			#define unity_ColorSpaceDielectricSpec half4(0.220916301, 0.220916301, 0.220916301, 1.0 - 0.220916301)//AI_SRP
			#else//AI_SRP
			#define unity_ColorSpaceDielectricSpec half4(0.04, 0.04, 0.04, 1.0 - 0.04) //AI_SRP
			#endif//AI_SRP
			#define ASE_USING_SAMPLING_MACROS 1


			#pragma vertex Vert
			#pragma fragment Frag

			#if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define OUTPUT_SPLIT_LIGHTING
			#endif

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			//#if defined( ASE_SRP_VERSION ) && ASE_SRP_VERSION < 60900
			//#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Wind.hlsl"
			//#endif
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"

			#define SHADERPASS SHADERPASS_LIGHT_TRANSPORT

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"


			//#if defined( ASE_SRP_VERSION ) && ASE_SRP_VERSION < 60900
			//#define T2W(var, index) var.worldToTangent[index]
			//#else
			#define T2W(var, index) var.tangentToWorld[index]
			//#endif

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/CommonLighting.hlsl"
			#define ai_ObjectToWorld GetObjectToWorldMatrix()
			#define ai_WorldToObject GetWorldToObjectMatrix()
			#define AI_INV_TWO_PI  INV_TWO_PI
			#define AI_PI          PI
			#define AI_INV_PI      INV_PI
			#define ASE_NEEDS_VERT_NORMAL
			#pragma shader_feature_local_fragment TVE_PIPELINE_STANDARD TVE_PIPELINE_UNIVERSAL TVE_PIPELINE_HD
			#pragma shader_feature_local_vertex TVE_MOTION_BASE_BENDING
			#pragma shader_feature_local_vertex TVE_MOTION_WIND_ELEMENT
			#pragma shader_feature_local_fragment TVE_OVERLAY
			#pragma shader_feature_local_fragment TVE_OVERLAY_ELEMENT
			#pragma shader_feature_local_fragment TVE_EMISSIVE
			#pragma shader_feature_local_fragment TVE_EMISSIVE_ELEMENT
			#pragma shader_feature_local_fragment TVE_SUBSURFACE
			#pragma shader_feature_local_fragment TVE_SUBSURFACE_ELEMENT
			  
			struct TVEVisualData
			{  
				half Dummy;  
				half3 Albedo;
				half2 NormalTS;
				half3 NormalWS; 
				half4 Shader;
				half4 Emissive;
				half AlphaClip;
				half AlphaFade;
				half MultiMask;
				half Grayscale;
				half Luminosity;
				half3 Translucency;
				half Transmission;
				half Thickness;
				float Diffusion;
			};  
			    
			struct TVEModelData
			{    
				half Dummy;    
				half3 PositionOS;
				half3 PositionWS;
				half3 PositionWO;
				half3 PositionRawOS;
				half3 PositionAddOS;
				half3 PivotOS;
				half3 PivotWS;
				half3 PivotWO;
				half3 NormalOS;
				half3 NormalWS;
				half3 NormalRawOS;
				half3 NormalRawWS;
				half4 TangentOS;
				half3 ViewDirWS;
				half4 VertexData;
				half4 MotionData;
				half4 BoundsData;
				half4 RotationData;
			};    
			      
			struct TVEGlobalData
			{      
				half Dummy;      
				half4 CoatParams;
				half4 PaintParams;
				half4 GlowParams;
				half4 AtmoParams;
				half4 FadeParams;
				half4 FormParams;
				half4 LandParams;
				half4 WindParams;
				half4 PushParams;
			};      
			        
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END
			//#pragma editor_sync_compilation


			struct AttributesMesh
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 texcoord : TEXCOORD0;
				float4 uv1 : TEXCOORD1;
				float4 uv2 : TEXCOORD2;
				float4 color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				
			};

			struct PackedVaryingsMeshToPS
			{
				float4 positionCS : SV_Position;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				float4 UVsFrame122_g156549 : TEXCOORD0;
				float4 UVsFrame222_g156549 : TEXCOORD1;
				float4 UVsFrame322_g156549 : TEXCOORD2;
				float4 octaframe22_g156549 : TEXCOORD3;
				float4 viewPos22_g156549 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
			};

			CBUFFER_START( UnityPerMaterial )
			float4 _DrynessColor;
			half4 _ImpostorColor;
			half4 _ImpostorColorTwo;
			float4 _OverlayGlitterTex_ST;
			half4 _InteractionColoring;
			float4 _AI_SizeOffset;
			half4 _SizeFadeColoring;
			half4 _VariationColoring;
			half4 _VariationColorTwo;
			half4 _VariationColorOne;
			half4 _VariationNoiseRemap;
			half4 _DitherColoring;
			half4 _TintingColoring;
			float4 _TintingColor;
			half4 _TintingLumaRemap;
			half4 _DrynessColoring;
			half4 _CutoutColoring;
			half4 _WetnessColoring;
			half4 _OverlayColor;
			half4 _OverlayProjRemap;
			half4 _DrynessLumaRemap;
			half4 _OverlayLumaRemap;
			half4 _OverlayColoringOn;
			half4 _OverlayColoringOff;
			half4 _SubsurfaceColor;
			half4 _OverlayGlitterColor;
			half4 _EmissiveColor;
			float4 _SubsurfaceDiffusion_Asset;
			half4 _OverlayBlendRemap1;
			float3 _AI_Offset;
			half _GlobalEnd;
			half _CutoutMultiValue;
			half _CutoutAlphaValue;
			half _CutoutNoiseValue;
			half _CutoutNoiseTillingValue;
			half _DitherLiteInfo;
			half _ImpostorMetallicValue;
			half _EmissiveExposureValue;
			float _emissive_power_value;
			half _DitherEnd;
			half _ImpostorColorMode;
			half _DitherConstantValue;
			half _EmissiveIntensityValue;
			half _GlobalLiteInfo;
			half _DitherDistanceValue;
			half _DitherCategory;
			half _DitherDistanceMaxValue;
			half _CutoutShadowMode;
			half _CutoutElementMode;
			half _OverlayIntensityValue;
			half _WetnessCategory;
			half _WetnessEnd;
			half _WetnessElementMode;
			half _WetnessIntensityValue;
			half _WetnessContrastValue;
			half _CutoutIntensityValue;
			half _WetnessSmoothnessValue;
			half _OverlayLumaValue;
			half _CutoutCategory;
			half _CutoutEnd;
			half _SubsurfaceIntensityValue;
			half _CutoutSpace;
			half _ImpostorSmoothnessValue;
			half _CutoutLiteInfo;
			half _OverlayGlitterDistValue;
			half _DitherDistanceMinValue;
			half _DitherShadowMode;
			half _SubsurfaceAmbientValue;
			half _SubsurfaceShadowValue;
			half _SubsurfaceElementMode;
			half _EmissiveCategory;
			half _GlobalCategory;
			half _EmissiveEnd;
			half _SubsurfaceNormalValue;
			half _EmissivePowerMode;
			half _EmissiveElementMode;
			half _OverlayCategory;
			half _OverlayEnd;
			half _OverlaySpace;
			half _OverlayElementMode;
			half _OverlayBakeInfo;
			half _EmissivePowerValue;
			half _OverlaySubsurfaceValue;
			half _SubsurfaceDirectValue;
			half _SubsurfaceCategory;
			half _DitherMultiValue;
			half _DitherNoiseTillingValue;
			half _OverlayProjValue;
			half _OverlaySmoothnessValue;
			half _SizeFadeCategory;
			half _SizeFadeEnd;
			half _SubsurfaceEnd;
			half _SizeFadeElementMode;
			half _SizeFadeScaleMode;
			half _SizeFadeScaleValue;
			half _SizeFadeDistMinValue;
			half _OverlayNormalValue;
			half _WetnessLiteInfo;
			half _SizeFadeDistMaxValue;
			half _SizeFadeIntensityValue;
			half _SizeFadeLiteInfo;
			half _ImpostorAlphaClipValue;
			half _DrynessMultiValue;
			half _RenderMotion;
			half _RenderShadow;
			half _ImpostorCategory;
			half _IsImpostorShader;
			half _IsSubsurfaceShader;
			half _IsLiteShader;
			half _ImpostorEnd;
			half _MotionWindCategory;
			half _MotionWindEnd;
			half _MotionWindElementMode;
			half _MotionInteractionCategory;
			half _MotionInteractionEnd;
			half _InteractionLiteInfo;
			half _MotionPushIntensityValue;
			half _MotionPushPivotValue;
			half _MotionPushMaskValue;
			half _MotionPushElementMode;
			half _IsIdentifier;
			half _IsConverted;
			half _IsCollected;
			half _HasDefaultTextures;
			half _OverlayGlitterTillingValue;
			half _OverlayGlitterIntensityValue;
			half _OverlayLiteInfo;
			half _SubsurfaceScatteringValue;
			half _SubsurfaceAngleValue;
			float _SubsurfaceDiffusion;
			half _SubsurfaceSpace;
			half _IsVersion;
			float _AI_Frames;
			half _RenderDecals;
			half _CategoryRender;
			half _EndRender;
			half _NoiseCategory;
			half _NoiseEnd;
			half _IsInitialized;
			half _IsTVEShader;
			half _IsCustomShader;
			half _IsShared;
			half _RenderSSR;
			half _DrynessLumaValue;
			float _AI_FramesX;
			float _AI_ImpostorSize;
			half _TintingSpace;
			half _TintingElementMode;
			half _TintingIntensityValue;
			half _TintingGrayValue;
			half _TintingMultiValue;
			half _TintingLumaValue;
			half _DrynessLiteInfo;
			half _DrynessCategory;
			half _DrynessEnd;
			half _DrynessSpace;
			half _DrynessElementMode;
			half _DrynessIntensityValue;
			half _SubsurfaceMultiValue;
			half _DrynessGrayValue;
			half _DrynessShiftValue;
			half _DrynessSmoothnessValue;
			half _DrynessSubsurfaceValue;
			half _TintingEnd;
			half _TintingCategory;
			half _TintingLiteInfo;
			half _VariationNoiseTillingValue;
			float _AI_Parallax;
			float _AI_TextureBias;
			float _AI_DepthSize;
			float _AI_ShadowBias;
			float _AI_ShadowView;
			float _AI_Clip;
			half _MotionBaseIntensityValue;
			half _MotionBasePivotValue;
			float _AI_FramesY;
			half _MotionTillingValue;
			half _global_wind_layer_value;
			half _MotionDelayValue;
			half _VariationLiteInfo;
			half _VariationCategory;
			half _VariationEnd;
			half _VariationIntensityValue;
			half _VariationMultiValue;
			half _VariationNoisePivotsValue1;
			half _MotionIntensityValue;
			half _SubsurfaceThicknessValue;
			float _BlendMode;
			CBUFFER_END

			TEXTURE2D(_OverlayGlitterTex);
			SAMPLER(sampler_OverlayGlitterTex);
			TEXTURE3D(_NoiseTex3D);
			SAMPLER(sampler_NoiseTex3D);
			float4x4 unity_CameraProjection;
			float4x4 unity_CameraInvProjection;
			float4x4 unity_WorldToCamera;
			float4x4 unity_CameraToWorld;
			TEXTURE2D(_Albedo);
			SAMPLER(sampler_Albedo);
			TEXTURE2D(_Normals);
			SAMPLER(sampler_Normals);
			float3 TVE_WorldOrigin;
			TEXTURE2D(_MotionNoiseTex);
			SAMPLER(sampler_Linear_Repeat);
			float TVE_WindLayers[10];
			TEXTURE2D_ARRAY(TVE_WindBaseTex);
			half4 TVE_RenderBaseCoords;
			SAMPLER(sampler_Linear_Clamp);
			TEXTURE2D_ARRAY(TVE_WindNearTex);
			half4 TVE_RenderNearCoords;
			float4 TVE_RenderNearPositionR;
			half TVE_RenderNearFadeValue;
			half4 TVE_WindParams;
			half _DisableSRPBatcher;
			TEXTURE2D(_MasksA);
			TEXTURE2D(_MasksB);
			SAMPLER(sampler_MasksA);
			SAMPLER(sampler_MasksB);
			half4 TVE_CoatParams;
			half4 TVE_PaintParams;
			half4 TVE_GlowParams;
			half4 TVE_AtmoParams;
			half4 TVE_FormParams;
			half4 TVE_PushParams;
			half TVE_IsEnabled;


			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"

			float2 VectortoOctahedron( float3 N )
			{
				N /= dot( 1.0, abs( N ) );
				if( N.z <= 0 )
				{
				N.xy = ( 1 - abs( N.yx ) ) * ( N.xy >= 0 ? 1.0 : -1.0 );
				}
				return N.xy;
			}
			
			float3 OctahedronToVector( float2 Oct )
			{
				float3 N = float3( Oct, 1.0 - dot( 1.0, abs( Oct ) ) );
				if(N.z< 0 )
				{
				N.xy = ( 1 - abs( N.yx) ) * (N.xy >= 0 ? 1.0 : -1.0 );
				}
				return normalize( N);
			}
			
			inline void RayPlaneIntersectionUV( float3 normalOS, float3 rayPosition, float3 rayDirection, inout float2 uvs, inout float3 localNormal )
			{
				float lDotN = dot( rayDirection, normalOS ); 
				float p0l0DotN = dot( -rayPosition, normalOS );
				float t = p0l0DotN / lDotN;
				float3 p = rayDirection * t + rayPosition;
				float3 upVector = float3( 0, 1, 0 );
				float3 tangent = normalize( cross( upVector, normalOS ) + float3( -0.001, 0, 0 ) );
				float3 bitangent = cross( tangent, normalOS );
				float frameX = dot( p, tangent );
				float frameZ = dot( p, bitangent );
				uvs = -float2( frameX, frameZ );
				if( t <= 0.0 )
				uvs = 0;
				float3x3 worldToLocal = float3x3( tangent, bitangent, normalOS );
				localNormal = normalize( mul( worldToLocal, rayDirection ) );
			}
			
			inline void OctaImpostorVertex( inout float4 positionOS, inout float3 normalOS, inout float4 uvsFrame1, inout float4 uvsFrame2, inout float4 uvsFrame3, inout float4 octaFrame, inout float4 viewPos )
			{
				float2 uvOffset = _AI_SizeOffset.zw;
				float parallax = -_AI_Parallax; 
				float UVscale = _AI_ImpostorSize;
				float framesXY = _AI_Frames;
				float prevFrame = framesXY - 1;
				float3 fractions = 1.0 / float3( framesXY, prevFrame, UVscale );
				float fractionsFrame = fractions.x;
				float fractionsPrevFrame = fractions.y;
				float fractionsUVscale = fractions.z;
				float3 worldCameraPos;
				#if defined(UNITY_PASS_SHADOWCASTER)
				float3 worldOrigin = 0;
				float4 perspective = float4( 0, 0, 0, 1 );
				if ( UNITY_MATRIX_P[ 3 ][ 3 ] == 1 )
				{
				perspective = float4( 0, 0, 5000, 0 );
				worldOrigin = ai_ObjectToWorld._m03_m13_m23;
				}
				worldCameraPos = worldOrigin + mul( UNITY_MATRIX_I_V, perspective ).xyz;
				#else
				if ( UNITY_MATRIX_P[ 3 ][ 3 ] == 1 )
				{
				worldCameraPos = ai_ObjectToWorld._m03_m13_m23 + UNITY_MATRIX_I_V._m02_m12_m22 * 5000;
				}
				else
				{
				worldCameraPos = GetCameraRelativePositionWS( _WorldSpaceCameraPos );
				}
				#endif
				float3 objectCameraPosition = mul( ai_WorldToObject, float4( worldCameraPos, 1 ) ).xyz - _AI_Offset.xyz; 
				float3 objectCameraDirection = normalize( objectCameraPosition );
				float3 upVector = float3( 0,1,0 );
				float3 objectHorizontalVector = normalize( cross( objectCameraDirection, upVector ) );
				float3 objectVerticalVector = cross( objectHorizontalVector, objectCameraDirection );
				float2 uvExpansion = positionOS.xy;
				float3 billboard = objectHorizontalVector * uvExpansion.x + objectVerticalVector * uvExpansion.y;
				float3 localDir = billboard - objectCameraPosition; 
				objectCameraDirection = trunc( objectCameraDirection * 65536.0 ) / 65536.0;
				float2 frameOcta = VectortoOctahedron( objectCameraDirection.xzy ) * 0.5 + 0.5;
				float2 prevOctaFrame = frameOcta * prevFrame;
				float2 baseOctaFrame = floor( prevOctaFrame );
				float2 fractionOctaFrame = ( baseOctaFrame * fractionsFrame );
				float2 octaFrame1 = ( baseOctaFrame * fractionsPrevFrame ) * 2.0 - 1.0;
				float3 octa1WorldY = OctahedronToVector( octaFrame1 ).xzy;
				float3 octa1LocalY;
				float2 uvFrame1;
				RayPlaneIntersectionUV( octa1WorldY, objectCameraPosition, localDir, /*inout*/ uvFrame1, /*inout*/ octa1LocalY );
				float2 uvParallax1 = octa1LocalY.xy * fractionsFrame * parallax;
				uvFrame1 = ( uvFrame1 * fractionsUVscale + 0.5 ) * fractionsFrame + fractionOctaFrame;
				uvsFrame1 = float4( uvParallax1, uvFrame1) - float4( 0, 0, uvOffset );
				float2 fractPrevOctaFrame = frac( prevOctaFrame );
				float2 cornerDifference = lerp( float2( 0,1 ) , float2( 1,0 ) , saturate( ceil( ( fractPrevOctaFrame.x - fractPrevOctaFrame.y ) ) ));
				float2 octaFrame2 = ( ( baseOctaFrame + cornerDifference ) * fractionsPrevFrame ) * 2.0 - 1.0;
				float3 octa2WorldY = OctahedronToVector( octaFrame2 ).xzy;
				float3 octa2LocalY;
				float2 uvFrame2;
				RayPlaneIntersectionUV( octa2WorldY, objectCameraPosition, localDir, /*inout*/ uvFrame2, /*inout*/ octa2LocalY );
				float2 uvParallax2 = octa2LocalY.xy * fractionsFrame * parallax;
				uvFrame2 = ( uvFrame2 * fractionsUVscale + 0.5 ) * fractionsFrame + ( ( cornerDifference * fractionsFrame ) + fractionOctaFrame );
				uvsFrame2 = float4( uvParallax2, uvFrame2) - float4( 0, 0, uvOffset );
				float2 octaFrame3 = ( ( baseOctaFrame + 1 ) * fractionsPrevFrame  ) * 2.0 - 1.0;
				float3 octa3WorldY = OctahedronToVector( octaFrame3 ).xzy;
				float3 octa3LocalY;
				float2 uvFrame3;
				RayPlaneIntersectionUV( octa3WorldY, objectCameraPosition, localDir, /*inout*/ uvFrame3, /*inout*/ octa3LocalY );
				float2 uvParallax3 = octa3LocalY.xy * fractionsFrame * parallax;
				uvFrame3 = ( uvFrame3 * fractionsUVscale + 0.5 ) * fractionsFrame + ( fractionOctaFrame + fractionsFrame );
				uvsFrame3 = float4( uvParallax3, uvFrame3) - float4( 0, 0, uvOffset );
				octaFrame = 0;
				octaFrame.xy = prevOctaFrame;
				octaFrame.zw = fractionOctaFrame;
				positionOS.xyz = billboard + _AI_Offset.xyz;
				normalOS.xyz = objectCameraDirection;
				viewPos = 0;
				viewPos.xyz = TransformWorldToView( TransformObjectToWorld( positionOS.xyz ) );
			}
			
			float3 ObjectPosition_UNITY_MATRIX_M(  )
			{
				return float3(UNITY_MATRIX_M[0].w, UNITY_MATRIX_M[1].w, UNITY_MATRIX_M[2].w );
			}
			
			inline void OctaImpostorFragment( inout SurfaceOutput o, out float4 positionCS, out float3 positionWS, float4 uvsFrame1, float4 uvsFrame2, float4 uvsFrame3, float4 octaFrame, float4 interpViewPos, out float4 output0, out float4 output1 )
			{
				float depthBias = -1.0;
				float textureBias = _AI_TextureBias;
				float2 fraction = frac( octaFrame.xy );
				float2 invFraction = 1 - fraction;
				float3 weights;
				weights.x = min( invFraction.x, invFraction.y );
				weights.y = abs( fraction.x - fraction.y );
				weights.z = min( fraction.x, fraction.y );
				float4 parallaxSample1 = SAMPLE_TEXTURE2D_BIAS( _Normals, sampler_Normals, uvsFrame1.zw, depthBias );
				float2 parallax1 = ( ( 0.5 - parallaxSample1.a ) * uvsFrame1.xy ) + uvsFrame1.zw;
				float4 parallaxSample2 = SAMPLE_TEXTURE2D_BIAS( _Normals, sampler_Normals, uvsFrame2.zw, depthBias );
				float2 parallax2 = ( ( 0.5 - parallaxSample2.a ) * uvsFrame2.xy ) + uvsFrame2.zw;
				float4 parallaxSample3 = SAMPLE_TEXTURE2D_BIAS( _Normals, sampler_Normals, uvsFrame3.zw, depthBias );
				float2 parallax3 = ( ( 0.5 - parallaxSample3.a ) * uvsFrame3.xy ) + uvsFrame3.zw;
				float4 albedo1 = SAMPLE_TEXTURE2D_BIAS( _Albedo, sampler_Albedo, parallax1, textureBias );
				float4 albedo2 = SAMPLE_TEXTURE2D_BIAS( _Albedo, sampler_Albedo, parallax2, textureBias );
				float4 albedo3 = SAMPLE_TEXTURE2D_BIAS( _Albedo, sampler_Albedo, parallax3, textureBias );
				float4 blendedAlbedo = albedo1 * weights.x + albedo2 * weights.y + albedo3 * weights.z;
				o.Alpha = ( blendedAlbedo.a - _AI_Clip );
				clip( o.Alpha );
				float t = ceil( fraction.x - fraction.y );
				float4 cornerDifference = float4( t, 1 - t, 1, 1 );
				float2 step_1 = ( parallax1 - octaFrame.zw ) * _AI_Frames;
				float4 step23 = ( float4( parallax2, parallax3 ) -  octaFrame.zwzw ) * _AI_Frames - cornerDifference;
				step_1 = step_1 * (1-step_1);
				step23 = step23 * (1-step23);
				float3 steps;
				steps.x = step_1.x * step_1.y;
				steps.y = step23.x * step23.y;
				steps.z = step23.z * step23.w;
				steps = step(-steps, 0);
				float final = dot( steps, weights );
				clip( final - 0.5 );
				o.Albedo = blendedAlbedo.rgb;
				#if defined(AI_HD_RENDERPIPELINE)
				float4 feat1 = _Features.SampleLevel( SamplerState_Point_Repeat, parallax1, 0);
				o.Diffusion = feat1.rgb;
				o.Features = feat1.a;
				float4 test1 = _Specular.SampleLevel( SamplerState_Point_Repeat, parallax1, 0);
				o.MetalTangent = test1.b;
				#endif
				float4 normals1 = SAMPLE_TEXTURE2D_BIAS( _Normals, sampler_Normals, parallax1, textureBias );
				float4 normals2 = SAMPLE_TEXTURE2D_BIAS( _Normals, sampler_Normals, parallax2, textureBias );
				float4 normals3 = SAMPLE_TEXTURE2D_BIAS( _Normals, sampler_Normals, parallax3, textureBias );
				float4 blendedNormal = normals1 * weights.x  + normals2 * weights.y + normals3 * weights.z;
				float4 output0a = SAMPLE_TEXTURE2D_BIAS( _MasksA, sampler_MasksA, parallax1, textureBias );
				float4 output0b = SAMPLE_TEXTURE2D_BIAS( _MasksA, sampler_MasksA, parallax2, textureBias );
				float4 output0c = SAMPLE_TEXTURE2D_BIAS( _MasksA, sampler_MasksA, parallax3, textureBias );
				output0 = output0a * weights.x  + output0b * weights.y + output0c * weights.z; 
				float4 output1a = SAMPLE_TEXTURE2D_BIAS( _MasksB, sampler_MasksB, parallax1, textureBias );
				float4 output1b = SAMPLE_TEXTURE2D_BIAS( _MasksB, sampler_MasksB, parallax2, textureBias );
				float4 output1c = SAMPLE_TEXTURE2D_BIAS( _MasksB, sampler_MasksB, parallax3, textureBias );
				output1 = output1a * weights.x  + output1b * weights.y + output1c * weights.z; 
				float3 localNormal = blendedNormal.rgb * 2.0 - 1.0;
				float3 worldNormal = normalize( mul( (float3x3)ai_ObjectToWorld, localNormal ) );
				o.Normal = worldNormal;
				float3 viewPos = interpViewPos.xyz;
				float depthOffset = ( ( parallaxSample1.a * weights.x + parallaxSample2.a * weights.y + parallaxSample3.a * weights.z ) - 0.5 /** 2.0 - 1.0*/ ) /** 0.5*/ * _AI_DepthSize * length( ai_ObjectToWorld[ 2 ].xyz );
				#if ( defined(SHADERPASS) && ((defined(SHADERPASS_SHADOWS) && SHADERPASS == SHADERPASS_SHADOWS) || (defined(SHADERPASS_SHADOWCASTER) && SHADERPASS == SHADERPASS_SHADOWCASTER)) ) || defined(UNITY_PASS_SHADOWCASTER)
				viewPos.z += depthOffset * _AI_ShadowView;
				viewPos.z += -_AI_ShadowBias;
				#else 
				viewPos.z += depthOffset;
				#endif
				positionWS = mul( UNITY_MATRIX_I_V, float4( viewPos.xyz, 1 ) ).xyz;
				positionCS = mul( UNITY_MATRIX_P, float4( viewPos, 1 ) );
				#if defined(UNITY_PASS_SHADOWCASTER) && !defined(SHADERPASS)
				#if UNITY_REVERSED_Z
				positionCS.z = min( positionCS.z, positionCS.w * UNITY_NEAR_CLIP_VALUE );
				#else
				positionCS.z = max( positionCS.z, positionCS.w * UNITY_NEAR_CLIP_VALUE );
				#endif
				#endif
				positionCS.xyz /= positionCS.w;
				if( UNITY_NEAR_CLIP_VALUE < 0 )
				positionCS = positionCS * 0.5 + 0.5;
			}
			
			float3 ASEGetEmissionHDRColor(float3 ldrColor, float luminanceIntensity, float exposureWeight, float inverseCurrentExposureMultiplier)
			{
				float3 hdrColor = ldrColor * luminanceIntensity;
				hdrColor = lerp( hdrColor* inverseCurrentExposureMultiplier, hdrColor, exposureWeight);
				return hdrColor;
			}
			

			void BuildSurfaceData( FragInputs fragInputs, inout GlobalSurfaceDescription surfaceDescription, float3 V, out SurfaceData surfaceData, out float3 bentNormalWS )
			{
				ZERO_INITIALIZE( SurfaceData, surfaceData );
				surfaceData.baseColor = surfaceDescription.Albedo;
				surfaceData.perceptualSmoothness = surfaceDescription.Smoothness;
				#ifdef _SPECULAR_OCCLUSION_CUSTOM
					surfaceData.specularOcclusion = surfaceDescription.SpecularOcclusion;
				#endif
					surfaceData.ambientOcclusion = surfaceDescription.Occlusion;
					surfaceData.metallic = surfaceDescription.Metallic;
					surfaceData.coatMask = surfaceDescription.CoatMask;

				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
					surfaceData.iridescenceMask = surfaceDescription.IridescenceMask;
					surfaceData.iridescenceThickness = surfaceDescription.IridescenceThickness;
				#endif
					surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;
				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
					surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
				#endif
				#ifdef _MATERIAL_FEATURE_TRANSMISSION
					surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
				#endif
				#ifdef _MATERIAL_FEATURE_ANISOTROPY
					surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;
				#endif

				#ifdef ASE_LIT_CLEAR_COAT
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_CLEAR_COAT;
				#endif

				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
					surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
				#endif
				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
					surfaceData.specularColor = surfaceDescription.Specular;
					surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
				#endif

				#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
					surfaceData.baseColor *= ( 1.0 - Max3( surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b ) );
				#endif
					//float3 normalTS = float3( 0.0f, 0.0f, 1.0f );
					//normalTS = surfaceDescription.Normal;
					GetNormalWS( fragInputs, float3( 0.0, 0.0, 1.0 ), surfaceData.normalWS, float3( 1.0, 1.0, 1.0 ) );
					bentNormalWS = surfaceData.normalWS;

				#ifdef ASE_BENT_NORMAL
					GetNormalWS( fragInputs, surfaceDescription.BentNormal, bentNormalWS, float4( 1, 1, -1, 0 ) );
				#endif

				surfaceData.geomNormalWS = T2W(fragInputs, 2);

				#ifdef _HAS_REFRACTION
					if( _EnableSSRefraction )
					{
						surfaceData.ior = surfaceDescription.RefractionIndex;
						surfaceData.transmittanceColor = surfaceDescription.RefractionColor;
						surfaceData.atDistance = surfaceDescription.RefractionDistance;

						surfaceData.transmittanceMask = ( 1.0 - surfaceDescription.Alpha );
						surfaceDescription.Alpha = 1.0;
					}
					else
					{
						surfaceData.ior = 1.0;
						surfaceData.transmittanceColor = float3( 1.0, 1.0, 1.0 );
						surfaceData.atDistance = 1.0;
						surfaceData.transmittanceMask = 0.0;
						surfaceDescription.Alpha = 1.0;
					}
				#else
					surfaceData.ior = 1.0;
					surfaceData.transmittanceColor = float3( 1.0, 1.0, 1.0 );
					surfaceData.atDistance = 1.0;
					surfaceData.transmittanceMask = 0.0;
				#endif

				#if defined(_HAS_REFRACTION) || defined(_MATERIAL_FEATURE_TRANSMISSION)
					surfaceData.thickness = surfaceDescription.Thickness;
				#endif

				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceData.subsurfaceMask = surfaceDescription.SubsurfaceMask;
				#endif

				#ifdef _MATERIAL_FEATURE_TRANSMISSION
				surfaceData.transmissionMask = surfaceDescription.TransmissionMask;
				#endif

				#if defined( _MATERIAL_FEATURE_SUBSURFACE_SCATTERING ) || defined( _MATERIAL_FEATURE_TRANSMISSION )
				surfaceData.diffusionProfileHash = asuint(surfaceDescription.DiffusionProfile);
				#endif

					surfaceData.tangentWS = normalize( T2W(fragInputs, 0).xyz );    // The tangent is not normalize in worldToTangent for mikkt. TODO: Check if it expected that we normalize with Morten. Tag: SURFACE_GRADIENT
				#ifdef _MATERIAL_FEATURE_ANISOTROPY
					surfaceData.anisotropy = surfaceDescription.Anisotropy;
					surfaceData.tangentWS = TransformTangentToWorld( surfaceDescription.Tangent, fragInputs.worldToTangent );
				#endif
					surfaceData.tangentWS = Orthonormalize( surfaceData.tangentWS, surfaceData.normalWS );
				#if defined(_SPECULAR_OCCLUSION_CUSTOM)
				#elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
					surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO( V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness( surfaceData.perceptualSmoothness ) );
				#elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
					surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion( ClampNdotV( dot( surfaceData.normalWS, V ) ), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness( surfaceData.perceptualSmoothness ) );
				#else
					surfaceData.specularOcclusion = 1.0;
				#endif
				#ifdef _ENABLE_GEOMETRIC_SPECULAR_AA
					surfaceData.perceptualSmoothness = GeometricNormalFiltering( surfaceData.perceptualSmoothness, T2W(fragInputs, 2), surfaceDescription.SpecularAAScreenSpaceVariance, surfaceDescription.SpecularAAThreshold );
				#endif

			}

			void GetSurfaceAndBuiltinData( GlobalSurfaceDescription surfaceDescription,FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData )
			{
				//#ifdef LOD_FADE_CROSSFADE
				//	uint3 fadeMaskSeed = asuint( ( int3 )( V * _ScreenSize.xyx ) ); // Quantize V to _ScreenSize values
				//	LODDitheringTransition( fadeMaskSeed, unity_LODFade.x );
				//#endif

				#ifdef _ALPHATEST_ON
					DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold );
				#endif

				float3 bentNormalWS;
				BuildSurfaceData( fragInputs, surfaceDescription, V, surfaceData, bentNormalWS );

				#if HAVE_DECALS
				if( _EnableDecals )
				{
					DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, surfaceDescription.Alpha);
					ApplyDecalToSurfaceData(decalSurfaceData, fragInputs.tangentToWorld[2], surfaceData);
				}
				#endif

				//#if defined( ASE_SRP_VERSION ) && ASE_SRP_VERSION <= 50702
					//InitBuiltinData( surfaceDescription.Alpha, bentNormalWS, -T2W(fragInputs, 2), fragInputs.positionRWS, fragInputs.texCoord1, fragInputs.texCoord2, builtinData );
				//#else
					InitBuiltinData( posInput, surfaceDescription.Alpha, bentNormalWS, -T2W(fragInputs, 2), fragInputs.texCoord1, fragInputs.texCoord2, builtinData );
				//#endif

				builtinData.emissiveColor = surfaceDescription.Emission;

				builtinData.depthOffset = 0.0;

				#if (SHADERPASS == SHADERPASS_DISTORTION)
					builtinData.distortion = surfaceDescription.Distortion;
					builtinData.distortionBlur = surfaceDescription.DistortionBlur;
				#else
					builtinData.distortion = float2( 0.0, 0.0 );
					builtinData.distortionBlur = 0.0;
				#endif

				PostInitBuiltinData( V, posInput, surfaceData, builtinData );
			}

			CBUFFER_START( UnityMetaPass )
			bool4 unity_MetaVertexControl;
			bool4 unity_MetaFragmentControl;
			CBUFFER_END

			float unity_OneOverOutputBoost;
			float unity_MaxOutputValue;

			PackedVaryingsMeshToPS Vert( AttributesMesh inputMesh  )
			{
				UNITY_SETUP_INSTANCE_ID( inputMesh );
				PackedVaryingsMeshToPS outputPackedVaryingsMeshToPS;
				UNITY_TRANSFER_INSTANCE_ID( inputMesh, outputPackedVaryingsMeshToPS );

				TVEModelData Data16_g158299 = (TVEModelData)0;
				float In_Dummy16_g158299 = 0.0;
				TVEModelData Data16_g158264 = (TVEModelData)0;
				half4 Dummy181_g158262 = ( ( _MotionWindCategory + _MotionWindEnd ) + _MotionWindElementMode + ( _MotionInteractionCategory + _MotionInteractionEnd ) + ( _InteractionLiteInfo + _InteractionColoring + _MotionPushIntensityValue + _MotionPushPivotValue + _MotionPushMaskValue + _MotionPushElementMode ) );
				float In_Dummy16_g158264 = Dummy181_g158262.r;
				TVEModelData Data16_g157153 = (TVEModelData)0;
				float In_Dummy16_g157153 = 0.0;
				OctaImpostorVertex( inputMesh.positionOS, inputMesh.normalOS, outputPackedVaryingsMeshToPS.UVsFrame122_g156549, outputPackedVaryingsMeshToPS.UVsFrame222_g156549, outputPackedVaryingsMeshToPS.UVsFrame322_g156549, outputPackedVaryingsMeshToPS.octaframe22_g156549, outputPackedVaryingsMeshToPS.viewPos22_g156549 );
				float3 worldPosOut22_g156549 = GetAbsolutePositionWS( mul( UNITY_MATRIX_I_V, float4( outputPackedVaryingsMeshToPS.viewPos22_g156549.xyz, 1.0 ) ).xyz );
				half3 Input_PositionWS218_g157146 = worldPosOut22_g156549;
				float3 worldToObj278_g157146 = mul( GetWorldToObjectMatrix(), float4( GetCameraRelativePositionWS(Input_PositionWS218_g157146), 1 ) ).xyz;
				half3 Model_PositionOS131_g157146 = worldToObj278_g157146;
				float3 In_PositionOS16_g157153 = Model_PositionOS131_g157146;
				half3 Model_PositionWS122_g157146 = Input_PositionWS218_g157146;
				float3 In_PositionWS16_g157153 = Model_PositionWS122_g157146;
				half3 Model_PositionWO132_g157146 = ( Model_PositionWS122_g157146 - TVE_WorldOrigin );
				float3 In_PositionWO16_g157153 = Model_PositionWO132_g157146;
				float3 In_PositionRawOS16_g157153 = Model_PositionOS131_g157146;
				float3 In_PositionAddOS16_g157153 = float3( 0,0,0 );
				float3 In_PivotOS16_g157153 = float3( 0,0,0 );
				float3 localObjectPosition_UNITY_MATRIX_M14_g157148 = ObjectPosition_UNITY_MATRIX_M();
				#ifdef SHADEROPTIONS_CAMERA_RELATIVE_RENDERING
				float3 staticSwitch13_g157148 = ( localObjectPosition_UNITY_MATRIX_M14_g157148 + _WorldSpaceCameraPos );
				#else
				float3 staticSwitch13_g157148 = localObjectPosition_UNITY_MATRIX_M14_g157148;
				#endif
				half3 ObjectData20_g157150 = staticSwitch13_g157148;
				float3 ase_worldPos = GetAbsolutePositionWS( TransformObjectToWorld( (inputMesh.positionOS).xyz ) );
				half3 WorldData19_g157150 = ase_worldPos;
				#ifdef TVE_OBJECT_BATCHED
				float3 staticSwitch14_g157150 = WorldData19_g157150;
				#else
				float3 staticSwitch14_g157150 = ObjectData20_g157150;
				#endif
				float3 temp_output_124_0_g157148 = staticSwitch14_g157150;
				float3 vertexToFrag281_g157146 = temp_output_124_0_g157148;
				half3 Model_PivotWS121_g157146 = vertexToFrag281_g157146;
				float3 In_PivotWS16_g157153 = Model_PivotWS121_g157146;
				half3 Model_PivotWO133_g157146 = ( Model_PivotWS121_g157146 - TVE_WorldOrigin );
				float3 In_PivotWO16_g157153 = Model_PivotWO133_g157146;
				half3 Model_NormalOS134_g157146 = inputMesh.normalOS;
				float3 In_NormalOS16_g157153 = Model_NormalOS134_g157146;
				float3 ase_worldNormal = TransformObjectToWorldNormal(inputMesh.normalOS);
				half3 Model_Normal_WS95_g157146 = ase_worldNormal;
				float3 In_NormalWS16_g157153 = Model_Normal_WS95_g157146;
				float3 In_NormalRawOS16_g157153 = Model_NormalOS134_g157146;
				float3 In_NormalRawWS16_g157153 = Model_Normal_WS95_g157146;
				float4 In_TangentOS16_g157153 = float4( 0,1,0,1 );
				float3 normalizeResult326_g157146 = normalize( ( _WorldSpaceCameraPos - Model_PositionWS122_g157146 ) );
				half3 Model_ViewDirWS322_g157146 = normalizeResult326_g157146;
				float3 In_ViewDirWS16_g157153 = Model_ViewDirWS322_g157146;
				float4 In_VertexData16_g157153 = float4( 1,1,1,1 );
				float4 In_MotionData16_g157153 = float4( 0,0,0,0 );
				float4 In_BoundsData16_g157153 = float4( 1,1,1,1 );
				float4 In_RotationData16_g157153 = float4( 0,0,0,0 );
				Data16_g157153.Dummy = In_Dummy16_g157153;
				Data16_g157153.PositionOS = In_PositionOS16_g157153;
				Data16_g157153.PositionWS = In_PositionWS16_g157153;
				Data16_g157153.PositionWO = In_PositionWO16_g157153;
				Data16_g157153.PositionRawOS = In_PositionRawOS16_g157153;
				Data16_g157153.PositionAddOS = In_PositionAddOS16_g157153;
				Data16_g157153.PivotOS = In_PivotOS16_g157153;
				Data16_g157153.PivotWS = In_PivotWS16_g157153;
				Data16_g157153.PivotWO = In_PivotWO16_g157153;
				Data16_g157153.NormalOS = In_NormalOS16_g157153;
				Data16_g157153.NormalWS = In_NormalWS16_g157153;
				Data16_g157153.NormalRawOS = In_NormalRawOS16_g157153;
				Data16_g157153.NormalRawWS = In_NormalRawWS16_g157153;
				Data16_g157153.TangentOS = In_TangentOS16_g157153;
				Data16_g157153.ViewDirWS = In_ViewDirWS16_g157153;
				Data16_g157153.VertexData = In_VertexData16_g157153;
				Data16_g157153.MotionData = In_MotionData16_g157153;
				Data16_g157153.BoundsData = In_BoundsData16_g157153;
				Data16_g157153.RotationData = In_RotationData16_g157153;
				TVEModelData Data15_g158263 = Data16_g157153;
				float Out_Dummy15_g158263 = 0;
				float3 Out_PositionOS15_g158263 = float3( 0,0,0 );
				float3 Out_PositionWS15_g158263 = float3( 0,0,0 );
				float3 Out_PositionWO15_g158263 = float3( 0,0,0 );
				float3 Out_PositionRawOS15_g158263 = float3( 0,0,0 );
				float3 Out_PositionAddOS15_g158263 = float3( 0,0,0 );
				float3 Out_PivotOS15_g158263 = float3( 0,0,0 );
				float3 Out_PivotWS15_g158263 = float3( 0,0,0 );
				float3 Out_PivotWO15_g158263 = float3( 0,0,0 );
				float3 Out_NormalOS15_g158263 = float3( 0,0,0 );
				float3 Out_NormalWS15_g158263 = float3( 0,0,0 );
				float3 Out_NormalRawOS15_g158263 = float3( 0,0,0 );
				float3 Out_NormalRawWS15_g158263 = float3( 0,0,0 );
				float4 Out_TangentOS15_g158263 = float4( 0,0,0,0 );
				float3 Out_ViewDirWS15_g158263 = float3( 0,0,0 );
				float4 Out_VertexData15_g158263 = float4( 0,0,0,0 );
				float4 Out_MotionData15_g158263 = float4( 0,0,0,0 );
				float4 Out_BoundsData15_g158263 = float4( 0,0,0,0 );
				float4 Out_RotationData15_g158263 = float4( 0,0,0,0 );
				Out_Dummy15_g158263 = Data15_g158263.Dummy;
				Out_PositionOS15_g158263 = Data15_g158263.PositionOS;
				Out_PositionWS15_g158263 = Data15_g158263.PositionWS;
				Out_PositionWO15_g158263 = Data15_g158263.PositionWO;
				Out_PositionRawOS15_g158263 = Data15_g158263.PositionRawOS;
				Out_PositionAddOS15_g158263 = Data15_g158263.PositionAddOS;
				Out_PivotOS15_g158263 = Data15_g158263.PivotOS;
				Out_PivotWS15_g158263 = Data15_g158263.PivotWS;
				Out_PivotWO15_g158263 = Data15_g158263.PivotWO;
				Out_NormalOS15_g158263 = Data15_g158263.NormalOS;
				Out_NormalWS15_g158263 = Data15_g158263.NormalWS;
				Out_NormalRawOS15_g158263 = Data15_g158263.NormalRawOS;
				Out_NormalRawWS15_g158263 = Data15_g158263.NormalRawWS;
				Out_TangentOS15_g158263 = Data15_g158263.TangentOS;
				Out_ViewDirWS15_g158263 = Data15_g158263.ViewDirWS;
				Out_VertexData15_g158263 = Data15_g158263.VertexData;
				Out_MotionData15_g158263 = Data15_g158263.MotionData;
				Out_BoundsData15_g158263 = Data15_g158263.BoundsData;
				Out_RotationData15_g158263 = Data15_g158263.RotationData;
				float3 temp_output_1567_0_g158262 = Out_PositionOS15_g158263;
				float3 In_PositionOS16_g158264 = temp_output_1567_0_g158262;
				float3 In_PositionWS16_g158264 = Out_PositionWS15_g158263;
				float3 temp_output_1567_17_g158262 = Out_PositionWO15_g158263;
				float3 In_PositionWO16_g158264 = temp_output_1567_17_g158262;
				float3 In_PositionRawOS16_g158264 = Out_PositionRawOS15_g158263;
				float3 In_PositionAddOS16_g158264 = Out_PositionAddOS15_g158263;
				float3 In_PivotOS16_g158264 = Out_PivotOS15_g158263;
				float3 In_PivotWS16_g158264 = Out_PivotWS15_g158263;
				float3 temp_output_1567_19_g158262 = Out_PivotWO15_g158263;
				float3 In_PivotWO16_g158264 = temp_output_1567_19_g158262;
				float3 In_NormalOS16_g158264 = Out_NormalOS15_g158263;
				float3 In_NormalWS16_g158264 = Out_NormalWS15_g158263;
				float3 In_NormalRawOS16_g158264 = Out_NormalRawOS15_g158263;
				float3 In_NormalRawWS16_g158264 = Out_NormalRawWS15_g158263;
				float4 In_TangentOS16_g158264 = Out_TangentOS15_g158263;
				float3 In_ViewDirWS16_g158264 = Out_ViewDirWS15_g158263;
				float4 In_VertexData16_g158264 = Out_VertexData15_g158263;
				float4 In_MotionData16_g158264 = Out_MotionData15_g158263;
				float4 In_BoundsData16_g158264 = Out_BoundsData15_g158263;
				float2 temp_cast_1 = (0.0).xx;
				half3 Model_PositionOS147_g158262 = temp_output_1567_0_g158262;
				half Base_Mask217_g158262 = saturate( ( Model_PositionOS147_g158262.y / _AI_Offset.y ) );
				half3 Model_PositionWO162_g158262 = temp_output_1567_17_g158262;
				half3 Model_PivotWO402_g158262 = temp_output_1567_19_g158262;
				float3 lerpResult829_g158262 = lerp( Model_PositionWO162_g158262 , Model_PivotWO402_g158262 , _MotionBasePivotValue);
				half3 Base_Position1394_g158262 = lerpResult829_g158262;
				half3 Input_PositionWO419_g158267 = Base_Position1394_g158262;
				half Flow_Tillling1397_g158262 = _MotionTillingValue;
				half Input_MotionTilling321_g158267 = ( Flow_Tillling1397_g158262 + 0.2 );
				half2 Noise_Coord515_g158267 = ( -(Input_PositionWO419_g158267).xz * Input_MotionTilling321_g158267 * 0.005 );
				half4 Noise_Params535_g158267 = SAMPLE_TEXTURE2D_LOD( _MotionNoiseTex, sampler_Linear_Repeat, Noise_Coord515_g158267, 0.0 );
				float2 temp_output_648_0_g158267 = (Noise_Params535_g158267).rg;
				half Flow_Value1602_g158262 = _MotionIntensityValue;
				half Input_MotionValue629_g158267 = Flow_Value1602_g158262;
				float2 lerpResult645_g158267 = lerp( float2( 0.5,0.5 ) , temp_output_648_0_g158267 , Input_MotionValue629_g158267);
				float3 appendResult566_g158267 = (float3(lerpResult645_g158267 , (Noise_Params535_g158267).b));
				float temp_output_136_0_g158268 = _global_wind_layer_value;
				float temp_output_19_0_g158270 = TVE_WindLayers[(int)temp_output_136_0_g158268];
				half3 Input_Position180_g158271 = Input_PositionWO419_g158267;
				float2 temp_output_75_0_g158271 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g158271).xz ) );
				float temp_output_82_0_g158271 = temp_output_136_0_g158268;
				float2 temp_output_119_0_g158271 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g158271).xz ) );
				float temp_output_7_0_g158276 = 1.0;
				float temp_output_10_0_g158276 = ( TVE_RenderNearFadeValue - temp_output_7_0_g158276 );
				float4 lerpResult131_g158271 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_WindBaseTex, sampler_Linear_Clamp, temp_output_75_0_g158271,temp_output_82_0_g158271, 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_WindNearTex, sampler_Linear_Repeat, temp_output_119_0_g158271,temp_output_82_0_g158271, 0.0 ) , saturate( ( ( saturate( ( distance( Input_Position180_g158271 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g158276 ) / temp_output_10_0_g158276 ) ));
				float4 temp_output_17_0_g158270 = lerpResult131_g158271;
				float4 temp_output_3_0_g158270 = TVE_WindParams;
				float4 ifLocalVar18_g158270 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g158270 >= 0.5 )
				ifLocalVar18_g158270 = temp_output_17_0_g158270;
				else
				ifLocalVar18_g158270 = temp_output_3_0_g158270;
				float4 lerpResult22_g158270 = lerp( temp_output_3_0_g158270 , temp_output_17_0_g158270 , temp_output_19_0_g158270);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g158270 = lerpResult22_g158270;
				#else
				float4 staticSwitch24_g158270 = ifLocalVar18_g158270;
				#endif
				float4 temp_output_610_0_g158267 = staticSwitch24_g158270;
				float3 appendResult643_g158267 = (float3((temp_output_610_0_g158267).rg , (temp_output_610_0_g158267).b));
				float3 lerpResult623_g158267 = lerp( appendResult566_g158267 , appendResult643_g158267 , (temp_output_610_0_g158267).a);
				#ifdef TVE_MOTION_WIND_ELEMENT
				float3 staticSwitch612_g158267 = lerpResult623_g158267;
				#else
				float3 staticSwitch612_g158267 = appendResult566_g158267;
				#endif
				float3 temp_output_1620_567_g158262 = staticSwitch612_g158267;
				half Base_Noise1590_g158262 = (temp_output_1620_567_g158262).z;
				float2 break83_g158266 = ((temp_output_1620_567_g158262).xy*2.0 + -1.0);
				float3 appendResult79_g158266 = (float3(break83_g158266.x , 0.0 , break83_g158266.y));
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				half2 Base_Direction893_g158262 = (( mul( GetWorldToObjectMatrix(), float4( appendResult79_g158266 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half Base_Intensity1615_g158262 = length( Base_Direction893_g158262 );
				half Flow_Delay1626_g158262 = _MotionDelayValue;
				float lerpResult1623_g158262 = lerp( 1.0 , ( Base_Intensity1615_g158262 * Base_Intensity1615_g158262 ) , Flow_Delay1626_g158262);
				#ifdef TVE_MOTION_BASE_BENDING
				float2 staticSwitch1573_g158262 = ( _MotionBaseIntensityValue * Base_Mask217_g158262 * Base_Noise1590_g158262 * Base_Direction893_g158262 * lerpResult1623_g158262 );
				#else
				float2 staticSwitch1573_g158262 = temp_cast_1;
				#endif
				half2 Base_Motion1440_g158262 = staticSwitch1573_g158262;
				half2 Final_RoationData1570_g158262 = Base_Motion1440_g158262;
				float4 In_RotationData16_g158264 = float4( Final_RoationData1570_g158262, 0.0 , 0.0 );
				Data16_g158264.Dummy = In_Dummy16_g158264;
				Data16_g158264.PositionOS = In_PositionOS16_g158264;
				Data16_g158264.PositionWS = In_PositionWS16_g158264;
				Data16_g158264.PositionWO = In_PositionWO16_g158264;
				Data16_g158264.PositionRawOS = In_PositionRawOS16_g158264;
				Data16_g158264.PositionAddOS = In_PositionAddOS16_g158264;
				Data16_g158264.PivotOS = In_PivotOS16_g158264;
				Data16_g158264.PivotWS = In_PivotWS16_g158264;
				Data16_g158264.PivotWO = In_PivotWO16_g158264;
				Data16_g158264.NormalOS = In_NormalOS16_g158264;
				Data16_g158264.NormalWS = In_NormalWS16_g158264;
				Data16_g158264.NormalRawOS = In_NormalRawOS16_g158264;
				Data16_g158264.NormalRawWS = In_NormalRawWS16_g158264;
				Data16_g158264.TangentOS = In_TangentOS16_g158264;
				Data16_g158264.ViewDirWS = In_ViewDirWS16_g158264;
				Data16_g158264.VertexData = In_VertexData16_g158264;
				Data16_g158264.MotionData = In_MotionData16_g158264;
				Data16_g158264.BoundsData = In_BoundsData16_g158264;
				Data16_g158264.RotationData = In_RotationData16_g158264;
				TVEModelData Data15_g158298 = Data16_g158264;
				float Out_Dummy15_g158298 = 0;
				float3 Out_PositionOS15_g158298 = float3( 0,0,0 );
				float3 Out_PositionWS15_g158298 = float3( 0,0,0 );
				float3 Out_PositionWO15_g158298 = float3( 0,0,0 );
				float3 Out_PositionRawOS15_g158298 = float3( 0,0,0 );
				float3 Out_PositionAddOS15_g158298 = float3( 0,0,0 );
				float3 Out_PivotOS15_g158298 = float3( 0,0,0 );
				float3 Out_PivotWS15_g158298 = float3( 0,0,0 );
				float3 Out_PivotWO15_g158298 = float3( 0,0,0 );
				float3 Out_NormalOS15_g158298 = float3( 0,0,0 );
				float3 Out_NormalWS15_g158298 = float3( 0,0,0 );
				float3 Out_NormalRawOS15_g158298 = float3( 0,0,0 );
				float3 Out_NormalRawWS15_g158298 = float3( 0,0,0 );
				float4 Out_TangentOS15_g158298 = float4( 0,0,0,0 );
				float3 Out_ViewDirWS15_g158298 = float3( 0,0,0 );
				float4 Out_VertexData15_g158298 = float4( 0,0,0,0 );
				float4 Out_MotionData15_g158298 = float4( 0,0,0,0 );
				float4 Out_BoundsData15_g158298 = float4( 0,0,0,0 );
				float4 Out_RotationData15_g158298 = float4( 0,0,0,0 );
				Out_Dummy15_g158298 = Data15_g158298.Dummy;
				Out_PositionOS15_g158298 = Data15_g158298.PositionOS;
				Out_PositionWS15_g158298 = Data15_g158298.PositionWS;
				Out_PositionWO15_g158298 = Data15_g158298.PositionWO;
				Out_PositionRawOS15_g158298 = Data15_g158298.PositionRawOS;
				Out_PositionAddOS15_g158298 = Data15_g158298.PositionAddOS;
				Out_PivotOS15_g158298 = Data15_g158298.PivotOS;
				Out_PivotWS15_g158298 = Data15_g158298.PivotWS;
				Out_PivotWO15_g158298 = Data15_g158298.PivotWO;
				Out_NormalOS15_g158298 = Data15_g158298.NormalOS;
				Out_NormalWS15_g158298 = Data15_g158298.NormalWS;
				Out_NormalRawOS15_g158298 = Data15_g158298.NormalRawOS;
				Out_NormalRawWS15_g158298 = Data15_g158298.NormalRawWS;
				Out_TangentOS15_g158298 = Data15_g158298.TangentOS;
				Out_ViewDirWS15_g158298 = Data15_g158298.ViewDirWS;
				Out_VertexData15_g158298 = Data15_g158298.VertexData;
				Out_MotionData15_g158298 = Data15_g158298.MotionData;
				Out_BoundsData15_g158298 = Data15_g158298.BoundsData;
				Out_RotationData15_g158298 = Data15_g158298.RotationData;
				half3 Model_PositionOS147_g158297 = Out_PositionOS15_g158298;
				half3 Input_False58_g158303 = Model_PositionOS147_g158297;
				half3 VertexPos40_g158300 = Model_PositionOS147_g158297;
				half3 VertexPos40_g158301 = VertexPos40_g158300;
				float3 appendResult74_g158301 = (float3(VertexPos40_g158301.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g158301 = appendResult74_g158301;
				float3 break84_g158301 = VertexPos40_g158301;
				float3 appendResult81_g158301 = (float3(0.0 , break84_g158301.y , break84_g158301.z));
				half3 VertexPosOtherAxis82_g158301 = appendResult81_g158301;
				float4 temp_output_1567_33_g158297 = Out_RotationData15_g158298;
				half4 Model_VertexBend1569_g158297 = temp_output_1567_33_g158297;
				half2 Angle44_g158300 = (Model_VertexBend1569_g158297).xy;
				half Angle44_g158301 = (Angle44_g158300).y;
				half3 VertexPos40_g158302 = ( VertexPosRotationAxis50_g158301 + ( VertexPosOtherAxis82_g158301 * cos( Angle44_g158301 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g158301 ) * sin( Angle44_g158301 ) ) );
				float3 appendResult74_g158302 = (float3(0.0 , 0.0 , VertexPos40_g158302.z));
				half3 VertexPosRotationAxis50_g158302 = appendResult74_g158302;
				float3 break84_g158302 = VertexPos40_g158302;
				float3 appendResult81_g158302 = (float3(break84_g158302.x , break84_g158302.y , 0.0));
				half3 VertexPosOtherAxis82_g158302 = appendResult81_g158302;
				half Angle44_g158302 = -(Angle44_g158300).x;
				half3 Input_True57_g158303 = ( VertexPosRotationAxis50_g158302 + ( VertexPosOtherAxis82_g158302 * cos( Angle44_g158302 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g158302 ) * sin( Angle44_g158302 ) ) );
				#ifdef TVE_MOTION_BASE_BENDING
				float3 staticSwitch65_g158303 = Input_True57_g158303;
				#else
				float3 staticSwitch65_g158303 = Input_False58_g158303;
				#endif
				#ifdef TVE_MOTION_PUSH_BENDING
				float3 staticSwitch67_g158303 = Input_True57_g158303;
				#else
				float3 staticSwitch67_g158303 = staticSwitch65_g158303;
				#endif
				#ifdef TVE_BLANKET_BENDING
				float3 staticSwitch69_g158303 = Input_True57_g158303;
				#else
				float3 staticSwitch69_g158303 = staticSwitch67_g158303;
				#endif
				float3 temp_output_1578_0_g158297 = staticSwitch69_g158303;
				float3 temp_output_1567_31_g158297 = Out_PositionAddOS15_g158298;
				half3 Model_PositionADD1568_g158297 = temp_output_1567_31_g158297;
				half3 Final_PositionOS178_g158297 = ( temp_output_1578_0_g158297 + Model_PositionADD1568_g158297 );
				float3 In_PositionOS16_g158299 = Final_PositionOS178_g158297;
				float3 In_PositionWS16_g158299 = Out_PositionWS15_g158298;
				float3 In_PositionWO16_g158299 = Out_PositionWO15_g158298;
				float3 In_PositionRawOS16_g158299 = Out_PositionRawOS15_g158298;
				float3 In_PositionAddOS16_g158299 = temp_output_1567_31_g158297;
				float3 In_PivotOS16_g158299 = Out_PivotOS15_g158298;
				float3 In_PivotWS16_g158299 = Out_PivotWS15_g158298;
				float3 In_PivotWO16_g158299 = Out_PivotWO15_g158298;
				float3 In_NormalOS16_g158299 = Out_NormalOS15_g158298;
				float3 In_NormalWS16_g158299 = Out_NormalWS15_g158298;
				float3 In_NormalRawOS16_g158299 = Out_NormalRawOS15_g158298;
				float3 In_NormalRawWS16_g158299 = Out_NormalRawWS15_g158298;
				float4 In_TangentOS16_g158299 = Out_TangentOS15_g158298;
				float3 In_ViewDirWS16_g158299 = Out_ViewDirWS15_g158298;
				float4 In_VertexData16_g158299 = Out_VertexData15_g158298;
				float4 In_MotionData16_g158299 = Out_MotionData15_g158298;
				float4 In_BoundsData16_g158299 = Out_BoundsData15_g158298;
				float4 In_RotationData16_g158299 = temp_output_1567_33_g158297;
				Data16_g158299.Dummy = In_Dummy16_g158299;
				Data16_g158299.PositionOS = In_PositionOS16_g158299;
				Data16_g158299.PositionWS = In_PositionWS16_g158299;
				Data16_g158299.PositionWO = In_PositionWO16_g158299;
				Data16_g158299.PositionRawOS = In_PositionRawOS16_g158299;
				Data16_g158299.PositionAddOS = In_PositionAddOS16_g158299;
				Data16_g158299.PivotOS = In_PivotOS16_g158299;
				Data16_g158299.PivotWS = In_PivotWS16_g158299;
				Data16_g158299.PivotWO = In_PivotWO16_g158299;
				Data16_g158299.NormalOS = In_NormalOS16_g158299;
				Data16_g158299.NormalWS = In_NormalWS16_g158299;
				Data16_g158299.NormalRawOS = In_NormalRawOS16_g158299;
				Data16_g158299.NormalRawWS = In_NormalRawWS16_g158299;
				Data16_g158299.TangentOS = In_TangentOS16_g158299;
				Data16_g158299.ViewDirWS = In_ViewDirWS16_g158299;
				Data16_g158299.VertexData = In_VertexData16_g158299;
				Data16_g158299.MotionData = In_MotionData16_g158299;
				Data16_g158299.BoundsData = In_BoundsData16_g158299;
				Data16_g158299.RotationData = In_RotationData16_g158299;
				TVEModelData Data15_g158319 = Data16_g158299;
				float Out_Dummy15_g158319 = 0;
				float3 Out_PositionOS15_g158319 = float3( 0,0,0 );
				float3 Out_PositionWS15_g158319 = float3( 0,0,0 );
				float3 Out_PositionWO15_g158319 = float3( 0,0,0 );
				float3 Out_PositionRawOS15_g158319 = float3( 0,0,0 );
				float3 Out_PositionAddOS15_g158319 = float3( 0,0,0 );
				float3 Out_PivotOS15_g158319 = float3( 0,0,0 );
				float3 Out_PivotWS15_g158319 = float3( 0,0,0 );
				float3 Out_PivotWO15_g158319 = float3( 0,0,0 );
				float3 Out_NormalOS15_g158319 = float3( 0,0,0 );
				float3 Out_NormalWS15_g158319 = float3( 0,0,0 );
				float3 Out_NormalRawOS15_g158319 = float3( 0,0,0 );
				float3 Out_NormalRawWS15_g158319 = float3( 0,0,0 );
				float4 Out_TangentOS15_g158319 = float4( 0,0,0,0 );
				float3 Out_ViewDirWS15_g158319 = float3( 0,0,0 );
				float4 Out_VertexData15_g158319 = float4( 0,0,0,0 );
				float4 Out_MotionData15_g158319 = float4( 0,0,0,0 );
				float4 Out_BoundsData15_g158319 = float4( 0,0,0,0 );
				float4 Out_RotationData15_g158319 = float4( 0,0,0,0 );
				Out_Dummy15_g158319 = Data15_g158319.Dummy;
				Out_PositionOS15_g158319 = Data15_g158319.PositionOS;
				Out_PositionWS15_g158319 = Data15_g158319.PositionWS;
				Out_PositionWO15_g158319 = Data15_g158319.PositionWO;
				Out_PositionRawOS15_g158319 = Data15_g158319.PositionRawOS;
				Out_PositionAddOS15_g158319 = Data15_g158319.PositionAddOS;
				Out_PivotOS15_g158319 = Data15_g158319.PivotOS;
				Out_PivotWS15_g158319 = Data15_g158319.PivotWS;
				Out_PivotWO15_g158319 = Data15_g158319.PivotWO;
				Out_NormalOS15_g158319 = Data15_g158319.NormalOS;
				Out_NormalWS15_g158319 = Data15_g158319.NormalWS;
				Out_NormalRawOS15_g158319 = Data15_g158319.NormalRawOS;
				Out_NormalRawWS15_g158319 = Data15_g158319.NormalRawWS;
				Out_TangentOS15_g158319 = Data15_g158319.TangentOS;
				Out_ViewDirWS15_g158319 = Data15_g158319.ViewDirWS;
				Out_VertexData15_g158319 = Data15_g158319.VertexData;
				Out_MotionData15_g158319 = Data15_g158319.MotionData;
				Out_BoundsData15_g158319 = Data15_g158319.BoundsData;
				Out_RotationData15_g158319 = Data15_g158319.RotationData;
				float3 temp_output_31_0_g158312 = Out_PositionOS15_g158319;
				float3 temp_output_6_0_g158326 = ( ( temp_output_31_0_g158312 - Out_PositionRawOS15_g158319 ) + _DisableSRPBatcher );
				half4 Dummy_Data505 = ( ( ( _VariationLiteInfo + _VariationColoring ) + ( _VariationCategory + _VariationEnd ) + ( _VariationIntensityValue + _VariationColorTwo + _VariationColorOne ) + ( _VariationMultiValue + _VariationNoiseRemap + _VariationNoisePivotsValue1 + _VariationNoiseTillingValue ) ) + ( ( _TintingLiteInfo + _TintingColoring ) + ( _TintingCategory + _TintingEnd + _TintingSpace + 0.0 + _TintingElementMode ) + ( _TintingIntensityValue + _TintingColor + _TintingGrayValue ) + ( _TintingMultiValue + _TintingLumaValue + _TintingLumaRemap ) + 0.0 + 0.0 ) + ( ( _DrynessLiteInfo + _DrynessColoring ) + ( _DrynessCategory + _DrynessEnd + _DrynessSpace + _DrynessElementMode + 0.0 ) + ( _DrynessIntensityValue + _DrynessColor + _DrynessGrayValue + _DrynessShiftValue + _DrynessSmoothnessValue + _DrynessSubsurfaceValue ) + ( _DrynessMultiValue + _DrynessLumaValue + _DrynessLumaRemap ) + 0.0 + 0.0 ) + ( ( _WetnessLiteInfo + _WetnessColoring ) + ( _WetnessCategory + _WetnessEnd + _WetnessElementMode + 0.0 ) + ( _WetnessIntensityValue + _WetnessContrastValue + _WetnessSmoothnessValue ) + float4( 0,0,0,0 ) + float4( 0,0,0,0 ) ) + ( ( _CutoutLiteInfo + _CutoutColoring ) + ( _CutoutCategory + _CutoutEnd + _CutoutSpace + _CutoutElementMode + 0.0 ) + ( _CutoutIntensityValue + _CutoutShadowMode ) + ( _CutoutMultiValue + _CutoutAlphaValue + _CutoutNoiseValue + _CutoutNoiseTillingValue ) + 0.0 ) + ( ( _DitherLiteInfo + _DitherColoring ) + ( _DitherCategory + _DitherEnd ) + ( _DitherConstantValue + 0.0 + 0.0 + ( _DitherDistanceValue + _DitherDistanceMaxValue + _DitherDistanceMinValue ) + _DitherShadowMode ) + ( _DitherMultiValue + _DitherNoiseTillingValue ) ) + ( ( _SizeFadeLiteInfo + _SizeFadeColoring ) + ( _SizeFadeCategory + _SizeFadeEnd + _SizeFadeElementMode ) + ( _SizeFadeIntensityValue + _SizeFadeScaleMode + _SizeFadeScaleValue + _SizeFadeDistMinValue + _SizeFadeDistMaxValue ) ) );
				#ifdef TVE_REGISTER
				float4 staticSwitch14_g158326 = ( float4( temp_output_6_0_g158326 , 0.0 ) + ( Dummy_Data505 * float4( 0,0,0,0 ) ) );
				#else
				float4 staticSwitch14_g158326 = float4( temp_output_6_0_g158326 , 0.0 );
				#endif
				
				outputPackedVaryingsMeshToPS.ase_texcoord5.xy = inputMesh.texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				outputPackedVaryingsMeshToPS.ase_texcoord5.zw = 0;
				inputMesh.positionOS.xyz += staticSwitch14_g158326.rgb;

				float2 uv = float2( 0.0, 0.0 );
				if( unity_MetaVertexControl.x )
				{
					uv = inputMesh.uv1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
				}
				else if( unity_MetaVertexControl.y )
				{
					uv = inputMesh.uv2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
				}

				outputPackedVaryingsMeshToPS.positionCS = float4( uv * 2.0 - 1.0, inputMesh.positionOS.z > 0 ? 1.0e-4 : 0.0, 1.0 );
				return outputPackedVaryingsMeshToPS;
			}

			float4 Frag( PackedVaryingsMeshToPS packedInput  ) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID( packedInput );

				//#ifdef LOD_FADE_CROSSFADE
				//float3 VC = GetWorldSpaceNormalizeViewDir(packedInput.interp00.xyz);
				//LODDitheringTransition(ComputeFadeMaskSeed(VC, packedInput.positionCS.xy), unity_LODFade.x);
				//#endif

				FragInputs input;
				ZERO_INITIALIZE( FragInputs, input );
				GlobalSurfaceDescription surfaceDescription = (GlobalSurfaceDescription)0;
				SurfaceOutput o = (SurfaceOutput)0;

				o.Normal = float3( 0, 0, 1 );
				float4 positionCS = 0;
				float3 positionWS = 0;

				float localBreakData4_g158315 = ( 0.0 );
				float localCompData3_g158307 = ( 0.0 );
				TVEVisualData Data3_g158307 = (TVEVisualData)0;
				half Dummy145_g158305 = ( _SubsurfaceCategory + _SubsurfaceEnd + ( _SubsurfaceDirectValue + _SubsurfaceNormalValue + _SubsurfaceAmbientValue + _SubsurfaceShadowValue ) + _SubsurfaceElementMode );
				float In_Dummy3_g158307 = Dummy145_g158305;
				float localBreakData4_g158306 = ( 0.0 );
				float localCompData3_g158259 = ( 0.0 );
				TVEVisualData Data3_g158259 = (TVEVisualData)0;
				half Dummy145_g158247 = ( _EmissiveCategory + _EmissiveEnd + ( _EmissivePowerMode + _EmissivePowerValue ) + _EmissiveElementMode + 0.0 );
				float In_Dummy3_g158259 = Dummy145_g158247;
				float localBreakData4_g158258 = ( 0.0 );
				float localCompData3_g158220 = ( 0.0 );
				TVEVisualData Data3_g158220 = (TVEVisualData)0;
				float2 uv_OverlayGlitterTex = packedInput.ase_texcoord5.xy * _OverlayGlitterTex_ST.xy + _OverlayGlitterTex_ST.zw;
				half4 Dummy594_g158217 = ( ( _OverlayCategory + _OverlayEnd + _OverlaySpace + _OverlayElementMode + _OverlayBakeInfo ) + ( _OverlayLiteInfo + _OverlayColoringOn + _OverlayColoringOff ) + ( SAMPLE_TEXTURE2D( _OverlayGlitterTex, sampler_OverlayGlitterTex, uv_OverlayGlitterTex ) + _OverlayGlitterTillingValue + _OverlayGlitterIntensityValue + _OverlayGlitterColor + _OverlayGlitterDistValue ) );
				float In_Dummy3_g158220 = Dummy594_g158217.r;
				float localBreakData4_g158218 = ( 0.0 );
				float localCompData3_g157221 = ( 0.0 );
				TVEVisualData Data3_g157221 = (TVEVisualData)0;
				float4 output0 = 0;
				float4 output1 = 0;
				OctaImpostorFragment( o, positionCS, positionWS, packedInput.UVsFrame122_g156549, packedInput.UVsFrame222_g156549, packedInput.UVsFrame322_g156549, packedInput.octaframe22_g156549, packedInput.viewPos22_g156549, output0, output1 );
				float In_Dummy3_g157221 = output1.r;
				float4 break227_g157220 = output0;
				half Local_MultiMask249_g157220 = break227_g157220.b;
				float lerpResult289_g157220 = lerp( 1.0 , Local_MultiMask249_g157220 , _ImpostorColorMode);
				float3 lerpResult292_g157220 = lerp( (_ImpostorColorTwo).rgb , (_ImpostorColor).rgb , lerpResult289_g157220);
				half3 Local_Albedo239_g157220 = ( o.Albedo * lerpResult292_g157220 );
				float3 In_Albedo3_g157221 = Local_Albedo239_g157220;
				float2 temp_cast_4 = (0.5).xx;
				float2 In_NormalTS3_g157221 = temp_cast_4;
				float3 In_NormalWS3_g157221 = o.Normal;
				half Local_Metallic247_g157220 = break227_g157220.r;
				half Final_Metallic238_g157220 = ( Local_Metallic247_g157220 * _ImpostorMetallicValue );
				half Local_Smoothness250_g157220 = break227_g157220.a;
				half Final_Smoothness233_g157220 = ( Local_Smoothness250_g157220 * _ImpostorSmoothnessValue );
				float4 appendResult257_g157220 = (float4(Final_Metallic238_g157220 , 1.0 , 1.0 , Final_Smoothness233_g157220));
				float4 In_Shader3_g157221 = appendResult257_g157220;
				half Local_EmissiveMask248_g157220 = break227_g157220.g;
				float4 appendResult286_g157220 = (float4(Local_EmissiveMask248_g157220 , Local_EmissiveMask248_g157220 , Local_EmissiveMask248_g157220 , 1.0));
				float4 In_Emissive3_g157221 = appendResult286_g157220;
				float3 temp_output_3_0_g157222 = Local_Albedo239_g157220;
				float dotResult20_g157222 = dot( temp_output_3_0_g157222 , float3(0.2126,0.7152,0.0722) );
				half Local_Grayscale268_g157220 = dotResult20_g157222;
				float In_Grayscale3_g157221 = Local_Grayscale268_g157220;
				float clampResult267_g157220 = clamp( saturate( ( Local_Grayscale268_g157220 * 5.0 ) ) , 0.2 , 1.0 );
				half Local_Luminosity269_g157220 = clampResult267_g157220;
				float In_Luminosity3_g157221 = Local_Luminosity269_g157220;
				float In_MultiMask3_g157221 = Local_MultiMask249_g157220;
				float In_AlphaClip3_g157221 = 0.0;
				float In_AlphaFade3_g157221 = 1.0;
				float3 temp_cast_5 = (1.0).xxx;
				float3 In_Translucency3_g157221 = temp_cast_5;
				float In_Transmission3_g157221 = 1.0;
				float In_Thickness3_g157221 = 0.0;
				float In_Diffusion3_g157221 = 0.0;
				Data3_g157221.Dummy = In_Dummy3_g157221;
				Data3_g157221.Albedo = In_Albedo3_g157221;
				Data3_g157221.NormalTS = In_NormalTS3_g157221;
				Data3_g157221.NormalWS = In_NormalWS3_g157221;
				Data3_g157221.Shader = In_Shader3_g157221;
				Data3_g157221.Emissive= In_Emissive3_g157221;
				Data3_g157221.MultiMask = In_MultiMask3_g157221;
				Data3_g157221.Grayscale = In_Grayscale3_g157221;
				Data3_g157221.Luminosity = In_Luminosity3_g157221;
				Data3_g157221.AlphaClip = In_AlphaClip3_g157221;
				Data3_g157221.AlphaFade = In_AlphaFade3_g157221;
				Data3_g157221.Translucency = In_Translucency3_g157221;
				Data3_g157221.Transmission = In_Transmission3_g157221;
				Data3_g157221.Thickness = In_Thickness3_g157221;
				Data3_g157221.Diffusion = In_Diffusion3_g157221;
				TVEVisualData Data4_g158218 = Data3_g157221;
				float Out_Dummy4_g158218 = 0;
				float3 Out_Albedo4_g158218 = float3( 0,0,0 );
				float2 Out_NormalTS4_g158218 = float2( 0,0 );
				float3 Out_NormalWS4_g158218 = float3( 0,0,0 );
				float4 Out_Shader4_g158218 = float4( 0,0,0,0 );
				float4 Out_Emissive4_g158218 = float4( 0,0,0,0 );
				float Out_MultiMask4_g158218 = 0;
				float Out_Grayscale4_g158218 = 0;
				float Out_Luminosity4_g158218 = 0;
				float Out_AlphaClip4_g158218 = 0;
				float Out_AlphaFade4_g158218 = 0;
				float3 Out_Translucency4_g158218 = float3( 0,0,0 );
				float Out_Transmission4_g158218 = 0;
				float Out_Thickness4_g158218 = 0;
				float Out_Diffusion4_g158218 = 0;
				Out_Dummy4_g158218 = Data4_g158218.Dummy;
				Out_Albedo4_g158218 = Data4_g158218.Albedo;
				Out_NormalTS4_g158218 = Data4_g158218.NormalTS;
				Out_NormalWS4_g158218 = Data4_g158218.NormalWS;
				Out_Shader4_g158218 = Data4_g158218.Shader;
				Out_Emissive4_g158218= Data4_g158218.Emissive;
				Out_MultiMask4_g158218 = Data4_g158218.MultiMask;
				Out_Grayscale4_g158218 = Data4_g158218.Grayscale;
				Out_Luminosity4_g158218= Data4_g158218.Luminosity;
				Out_AlphaClip4_g158218 = Data4_g158218.AlphaClip;
				Out_AlphaFade4_g158218 = Data4_g158218.AlphaFade;
				Out_Translucency4_g158218 = Data4_g158218.Translucency;
				Out_Transmission4_g158218 = Data4_g158218.Transmission;
				Out_Thickness4_g158218 = Data4_g158218.Thickness;
				Out_Diffusion4_g158218 = Data4_g158218.Diffusion;
				half3 Visual_Albedo127_g158217 = Out_Albedo4_g158218;
				float3 temp_output_622_0_g158217 = (_OverlayColor).rgb;
				half Overlay_TexMask906_g158217 = 1.0;
				float3 temp_output_739_21_g158217 = Out_NormalWS4_g158218;
				half3 Visual_NormalWS749_g158217 = temp_output_739_21_g158217;
				float clampResult17_g158237 = clamp( saturate( (Visual_NormalWS749_g158217).y ) , 0.0001 , 0.9999 );
				float temp_output_7_0_g158236 = _OverlayProjRemap.x;
				float temp_output_10_0_g158236 = ( _OverlayProjRemap.y - temp_output_7_0_g158236 );
				float lerpResult842_g158217 = lerp( 1.0 , saturate( ( ( clampResult17_g158237 - temp_output_7_0_g158236 ) / ( temp_output_10_0_g158236 + 0.0001 ) ) ) , _OverlayProjValue);
				half Overlay_MaskProj457_g158217 = lerpResult842_g158217;
				float temp_output_739_15_g158217 = Out_Luminosity4_g158218;
				half Visual_Luminosity654_g158217 = temp_output_739_15_g158217;
				float clampResult17_g158239 = clamp( Visual_Luminosity654_g158217 , 0.0001 , 0.9999 );
				float temp_output_7_0_g158238 = _OverlayLumaRemap.x;
				float temp_output_10_0_g158238 = ( _OverlayLumaRemap.y - temp_output_7_0_g158238 );
				float lerpResult587_g158217 = lerp( 1.0 , saturate( ( ( clampResult17_g158239 - temp_output_7_0_g158238 ) / ( temp_output_10_0_g158238 + 0.0001 ) ) ) , _OverlayLumaValue);
				half Overlay_MaskLuma438_g158217 = lerpResult587_g158217;
				half Overlay_VertMask801_g158217 = 1.0;
				half Overlay_MaskNoise427_g158217 = 1.0;
				float localBuildGlobalData204_g157155 = ( 0.0 );
				TVEGlobalData Data204_g157155 = (TVEGlobalData)0;
				half Dummy211_g157155 = ( _GlobalLiteInfo + ( _GlobalCategory + _GlobalEnd ) );
				float In_Dummy204_g157155 = Dummy211_g157155;
				float4 temp_output_362_164_g157155 = TVE_CoatParams;
				half4 Coat_Params302_g157155 = temp_output_362_164_g157155;
				float4 In_CoatParams204_g157155 = Coat_Params302_g157155;
				float4 temp_output_361_164_g157155 = TVE_PaintParams;
				half4 Paint_Params71_g157155 = temp_output_361_164_g157155;
				float4 In_PaintParams204_g157155 = Paint_Params71_g157155;
				float4 temp_output_365_163_g157155 = TVE_GlowParams;
				half4 Glow_Params248_g157155 = temp_output_365_163_g157155;
				float4 In_GlowParams204_g157155 = Glow_Params248_g157155;
				float4 temp_output_363_141_g157155 = TVE_AtmoParams;
				half4 Atmo_Params80_g157155 = temp_output_363_141_g157155;
				float4 In_AtmoParams204_g157155 = Atmo_Params80_g157155;
				float4 temp_output_364_139_g157155 = TVE_FormParams;
				half4 Form_Params112_g157155 = temp_output_364_139_g157155;
				float4 In_FormParams204_g157155 = Form_Params112_g157155;
				float4 temp_output_366_145_g157155 = TVE_WindParams;
				half4 Wind_Params88_g157155 = temp_output_366_145_g157155;
				float4 In_WindParams204_g157155 = Wind_Params88_g157155;
				float4 temp_output_367_145_g157155 = TVE_PushParams;
				half4 Push_Params335_g157155 = temp_output_367_145_g157155;
				float4 In_PushParams204_g157155 = Push_Params335_g157155;
				Data204_g157155.Dummy = In_Dummy204_g157155;
				Data204_g157155.CoatParams = In_CoatParams204_g157155;
				Data204_g157155.PaintParams = In_PaintParams204_g157155;
				Data204_g157155.GlowParams = In_GlowParams204_g157155;
				Data204_g157155.AtmoParams = In_AtmoParams204_g157155;
				Data204_g157155.FormParams= In_FormParams204_g157155;
				Data204_g157155.WindParams = In_WindParams204_g157155;
				Data204_g157155.PushParams = In_PushParams204_g157155;
				TVEGlobalData Data15_g158219 = Data204_g157155;
				float Out_Dummy15_g158219 = 0;
				float4 Out_CoatParams15_g158219 = float4( 0,0,0,0 );
				float4 Out_PaintParams15_g158219 = float4( 0,0,0,0 );
				float4 Out_GlowParams15_g158219 = float4( 0,0,0,0 );
				float4 Out_AtmoParams15_g158219 = float4( 0,0,0,0 );
				float4 Out_FadeParams15_g158219 = float4( 0,0,0,0 );
				float4 Out_FormParams15_g158219 = float4( 0,0,0,0 );
				float4 Out_LandParams15_g158219 = float4( 0,0,0,0 );
				float4 Out_WindParams15_g158219 = float4( 0,0,0,0 );
				float4 Out_PushParams15_g158219 = float4( 0,0,0,0 );
				Out_Dummy15_g158219 = Data15_g158219.Dummy;
				Out_CoatParams15_g158219 = Data15_g158219.CoatParams;
				Out_PaintParams15_g158219 = Data15_g158219.PaintParams;
				Out_GlowParams15_g158219 = Data15_g158219.GlowParams;
				Out_AtmoParams15_g158219= Data15_g158219.AtmoParams;
				Out_FadeParams15_g158219= Data15_g158219.FadeParams;
				Out_FormParams15_g158219 = Data15_g158219.FormParams;
				Out_LandParams15_g158219 = Data15_g158219.LandParams;
				Out_WindParams15_g158219 = Data15_g158219.WindParams;
				Out_PushParams15_g158219 = Data15_g158219.PushParams;
				half4 Global_AtmoParams516_g158217 = Out_AtmoParams15_g158219;
				#ifdef TVE_OVERLAY_ELEMENT
				float staticSwitch705_g158217 = (Global_AtmoParams516_g158217).z;
				#else
				float staticSwitch705_g158217 = 1.0;
				#endif
				half Overlay_MaskGlobal429_g158217 = staticSwitch705_g158217;
				half Custom_Mask646_g158217 = 1.0;
				float temp_output_7_0_g158244 = _OverlayBlendRemap1.x;
				float temp_output_10_0_g158244 = ( _OverlayBlendRemap1.y - temp_output_7_0_g158244 );
				half Overlay_Mask494_g158217 = saturate( ( ( ( _OverlayIntensityValue * Overlay_TexMask906_g158217 * Overlay_MaskProj457_g158217 * Overlay_MaskLuma438_g158217 * Overlay_VertMask801_g158217 * Overlay_MaskNoise427_g158217 * Overlay_MaskGlobal429_g158217 * Custom_Mask646_g158217 ) - temp_output_7_0_g158244 ) / ( temp_output_10_0_g158244 + 0.0001 ) ) );
				float3 lerpResult467_g158217 = lerp( Visual_Albedo127_g158217 , temp_output_622_0_g158217 , Overlay_Mask494_g158217);
				#ifdef TVE_OVERLAY
				float3 staticSwitch577_g158217 = lerpResult467_g158217;
				#else
				float3 staticSwitch577_g158217 = Visual_Albedo127_g158217;
				#endif
				half3 Final_Albedo493_g158217 = staticSwitch577_g158217;
				float3 In_Albedo3_g158220 = Final_Albedo493_g158217;
				half2 Visual_NormalTS535_g158217 = Out_NormalTS4_g158218;
				float2 lerpResult551_g158217 = lerp( Visual_NormalTS535_g158217 , ( Visual_NormalTS535_g158217 * _OverlayNormalValue ) , Overlay_Mask494_g158217);
				#ifdef TVE_OVERLAY
				float2 staticSwitch583_g158217 = lerpResult551_g158217;
				#else
				float2 staticSwitch583_g158217 = Visual_NormalTS535_g158217;
				#endif
				half2 Final_NormalTS499_g158217 = staticSwitch583_g158217;
				float2 In_NormalTS3_g158220 = Final_NormalTS499_g158217;
				float3 In_NormalWS3_g158220 = temp_output_739_21_g158217;
				half4 Visual_Masks536_g158217 = Out_Shader4_g158218;
				float4 appendResult585_g158217 = (float4(0.0 , 1.0 , 0.0 , _OverlaySmoothnessValue));
				float4 lerpResult584_g158217 = lerp( Visual_Masks536_g158217 , appendResult585_g158217 , Overlay_Mask494_g158217);
				#ifdef TVE_OVERLAY
				float4 staticSwitch586_g158217 = lerpResult584_g158217;
				#else
				float4 staticSwitch586_g158217 = Visual_Masks536_g158217;
				#endif
				half4 Final_Masks482_g158217 = staticSwitch586_g158217;
				float4 In_Shader3_g158220 = Final_Masks482_g158217;
				float4 In_Emissive3_g158220 = Out_Emissive4_g158218;
				float temp_output_739_12_g158217 = Out_Grayscale4_g158218;
				float In_Grayscale3_g158220 = temp_output_739_12_g158217;
				float In_Luminosity3_g158220 = temp_output_739_15_g158217;
				float In_MultiMask3_g158220 = Out_MultiMask4_g158218;
				float In_AlphaClip3_g158220 = Out_AlphaClip4_g158218;
				float In_AlphaFade3_g158220 = Out_AlphaFade4_g158218;
				float3 In_Translucency3_g158220 = Out_Translucency4_g158218;
				half Visual_Transmission699_g158217 = Out_Transmission4_g158218;
				float lerpResult746_g158217 = lerp( Visual_Transmission699_g158217 , ( Visual_Transmission699_g158217 * _OverlaySubsurfaceValue ) , ( Overlay_VertMask801_g158217 * Overlay_MaskNoise427_g158217 * Overlay_MaskGlobal429_g158217 ));
				#ifdef TVE_OVERLAY
				float staticSwitch703_g158217 = lerpResult746_g158217;
				#else
				float staticSwitch703_g158217 = Visual_Transmission699_g158217;
				#endif
				half Final_Transmission702_g158217 = staticSwitch703_g158217;
				float In_Transmission3_g158220 = Final_Transmission702_g158217;
				float In_Thickness3_g158220 = Out_Thickness4_g158218;
				float In_Diffusion3_g158220 = Out_Diffusion4_g158218;
				Data3_g158220.Dummy = In_Dummy3_g158220;
				Data3_g158220.Albedo = In_Albedo3_g158220;
				Data3_g158220.NormalTS = In_NormalTS3_g158220;
				Data3_g158220.NormalWS = In_NormalWS3_g158220;
				Data3_g158220.Shader = In_Shader3_g158220;
				Data3_g158220.Emissive= In_Emissive3_g158220;
				Data3_g158220.MultiMask = In_MultiMask3_g158220;
				Data3_g158220.Grayscale = In_Grayscale3_g158220;
				Data3_g158220.Luminosity = In_Luminosity3_g158220;
				Data3_g158220.AlphaClip = In_AlphaClip3_g158220;
				Data3_g158220.AlphaFade = In_AlphaFade3_g158220;
				Data3_g158220.Translucency = In_Translucency3_g158220;
				Data3_g158220.Transmission = In_Transmission3_g158220;
				Data3_g158220.Thickness = In_Thickness3_g158220;
				Data3_g158220.Diffusion = In_Diffusion3_g158220;
				TVEVisualData Data4_g158258 = Data3_g158220;
				float Out_Dummy4_g158258 = 0;
				float3 Out_Albedo4_g158258 = float3( 0,0,0 );
				float2 Out_NormalTS4_g158258 = float2( 0,0 );
				float3 Out_NormalWS4_g158258 = float3( 0,0,0 );
				float4 Out_Shader4_g158258 = float4( 0,0,0,0 );
				float4 Out_Emissive4_g158258 = float4( 0,0,0,0 );
				float Out_MultiMask4_g158258 = 0;
				float Out_Grayscale4_g158258 = 0;
				float Out_Luminosity4_g158258 = 0;
				float Out_AlphaClip4_g158258 = 0;
				float Out_AlphaFade4_g158258 = 0;
				float3 Out_Translucency4_g158258 = float3( 0,0,0 );
				float Out_Transmission4_g158258 = 0;
				float Out_Thickness4_g158258 = 0;
				float Out_Diffusion4_g158258 = 0;
				Out_Dummy4_g158258 = Data4_g158258.Dummy;
				Out_Albedo4_g158258 = Data4_g158258.Albedo;
				Out_NormalTS4_g158258 = Data4_g158258.NormalTS;
				Out_NormalWS4_g158258 = Data4_g158258.NormalWS;
				Out_Shader4_g158258 = Data4_g158258.Shader;
				Out_Emissive4_g158258= Data4_g158258.Emissive;
				Out_MultiMask4_g158258 = Data4_g158258.MultiMask;
				Out_Grayscale4_g158258 = Data4_g158258.Grayscale;
				Out_Luminosity4_g158258= Data4_g158258.Luminosity;
				Out_AlphaClip4_g158258 = Data4_g158258.AlphaClip;
				Out_AlphaFade4_g158258 = Data4_g158258.AlphaFade;
				Out_Translucency4_g158258 = Data4_g158258.Translucency;
				Out_Transmission4_g158258 = Data4_g158258.Transmission;
				Out_Thickness4_g158258 = Data4_g158258.Thickness;
				Out_Diffusion4_g158258 = Data4_g158258.Diffusion;
				float3 temp_output_297_0_g158247 = Out_Albedo4_g158258;
				float3 In_Albedo3_g158259 = temp_output_297_0_g158247;
				float2 In_NormalTS3_g158259 = Out_NormalTS4_g158258;
				float3 In_NormalWS3_g158259 = Out_NormalWS4_g158258;
				float4 In_Shader3_g158259 = Out_Shader4_g158258;
				float4 temp_cast_6 = (0.0).xxxx;
				half4 Visual_Emissive255_g158247 = Out_Emissive4_g158258;
				half Emissive_MeshMask221_g158247 = 1.0;
				half Emissive_Mask103_g158247 = 1.0;
				float temp_output_279_0_g158247 = ( Emissive_MeshMask221_g158247 * Emissive_Mask103_g158247 );
				float3 appendResult293_g158247 = (float3(temp_output_279_0_g158247 , temp_output_279_0_g158247 , temp_output_279_0_g158247));
				half3 Local_EmissiveColor278_g158247 = appendResult293_g158247;
				float3 temp_cast_7 = (1.0).xxx;
				TVEGlobalData Data15_g158249 = Data204_g157155;
				float Out_Dummy15_g158249 = 0;
				float4 Out_CoatParams15_g158249 = float4( 0,0,0,0 );
				float4 Out_PaintParams15_g158249 = float4( 0,0,0,0 );
				float4 Out_GlowParams15_g158249 = float4( 0,0,0,0 );
				float4 Out_AtmoParams15_g158249 = float4( 0,0,0,0 );
				float4 Out_FadeParams15_g158249 = float4( 0,0,0,0 );
				float4 Out_FormParams15_g158249 = float4( 0,0,0,0 );
				float4 Out_LandParams15_g158249 = float4( 0,0,0,0 );
				float4 Out_WindParams15_g158249 = float4( 0,0,0,0 );
				float4 Out_PushParams15_g158249 = float4( 0,0,0,0 );
				Out_Dummy15_g158249 = Data15_g158249.Dummy;
				Out_CoatParams15_g158249 = Data15_g158249.CoatParams;
				Out_PaintParams15_g158249 = Data15_g158249.PaintParams;
				Out_GlowParams15_g158249 = Data15_g158249.GlowParams;
				Out_AtmoParams15_g158249= Data15_g158249.AtmoParams;
				Out_FadeParams15_g158249= Data15_g158249.FadeParams;
				Out_FormParams15_g158249 = Data15_g158249.FormParams;
				Out_LandParams15_g158249 = Data15_g158249.LandParams;
				Out_WindParams15_g158249 = Data15_g158249.WindParams;
				Out_PushParams15_g158249 = Data15_g158249.PushParams;
				half4 Global_GlowParams179_g158247 = Out_GlowParams15_g158249;
				float3 lerpResult299_g158247 = lerp( float3( 1,1,1 ) , (Global_GlowParams179_g158247).xyz , TVE_IsEnabled);
				#ifdef TVE_EMISSIVE_ELEMENT
				float3 staticSwitch228_g158247 = lerpResult299_g158247;
				#else
				float3 staticSwitch228_g158247 = temp_cast_7;
				#endif
				half3 Emissive_GlobalMask248_g158247 = staticSwitch228_g158247;
				half3 Local_EmissiveValue88_g158247 = ( _EmissiveIntensityValue * (_EmissiveColor).rgb * Emissive_GlobalMask248_g158247 );
				half3 Emissive_Blend260_g158247 = ( ( (Visual_Emissive255_g158247).xyz * Local_EmissiveColor278_g158247 ) * Local_EmissiveValue88_g158247 );
				float3 temp_output_3_0_g158257 = Emissive_Blend260_g158247;
				float temp_output_15_0_g158257 = _emissive_power_value;
				float3 hdEmission22_g158257 = ASEGetEmissionHDRColor(temp_output_3_0_g158257,temp_output_15_0_g158257,_EmissiveExposureValue,GetInverseCurrentExposureMultiplier());
				float4 appendResult295_g158247 = (float4(hdEmission22_g158257 , Emissive_Mask103_g158247));
				#ifdef TVE_EMISSIVE
				float4 staticSwitch129_g158247 = appendResult295_g158247;
				#else
				float4 staticSwitch129_g158247 = temp_cast_6;
				#endif
				half4 Final_Emissive184_g158247 = staticSwitch129_g158247;
				float4 In_Emissive3_g158259 = Final_Emissive184_g158247;
				float In_Grayscale3_g158259 = Out_Grayscale4_g158258;
				float In_Luminosity3_g158259 = Out_Luminosity4_g158258;
				float temp_output_297_11_g158247 = Out_MultiMask4_g158258;
				float In_MultiMask3_g158259 = temp_output_297_11_g158247;
				float In_AlphaClip3_g158259 = Out_AlphaClip4_g158258;
				float In_AlphaFade3_g158259 = Out_AlphaFade4_g158258;
				float3 In_Translucency3_g158259 = Out_Translucency4_g158258;
				float In_Transmission3_g158259 = Out_Transmission4_g158258;
				float In_Thickness3_g158259 = Out_Thickness4_g158258;
				float In_Diffusion3_g158259 = Out_Diffusion4_g158258;
				Data3_g158259.Dummy = In_Dummy3_g158259;
				Data3_g158259.Albedo = In_Albedo3_g158259;
				Data3_g158259.NormalTS = In_NormalTS3_g158259;
				Data3_g158259.NormalWS = In_NormalWS3_g158259;
				Data3_g158259.Shader = In_Shader3_g158259;
				Data3_g158259.Emissive= In_Emissive3_g158259;
				Data3_g158259.MultiMask = In_MultiMask3_g158259;
				Data3_g158259.Grayscale = In_Grayscale3_g158259;
				Data3_g158259.Luminosity = In_Luminosity3_g158259;
				Data3_g158259.AlphaClip = In_AlphaClip3_g158259;
				Data3_g158259.AlphaFade = In_AlphaFade3_g158259;
				Data3_g158259.Translucency = In_Translucency3_g158259;
				Data3_g158259.Transmission = In_Transmission3_g158259;
				Data3_g158259.Thickness = In_Thickness3_g158259;
				Data3_g158259.Diffusion = In_Diffusion3_g158259;
				TVEVisualData Data4_g158306 = Data3_g158259;
				float Out_Dummy4_g158306 = 0;
				float3 Out_Albedo4_g158306 = float3( 0,0,0 );
				float2 Out_NormalTS4_g158306 = float2( 0,0 );
				float3 Out_NormalWS4_g158306 = float3( 0,0,0 );
				float4 Out_Shader4_g158306 = float4( 0,0,0,0 );
				float4 Out_Emissive4_g158306 = float4( 0,0,0,0 );
				float Out_MultiMask4_g158306 = 0;
				float Out_Grayscale4_g158306 = 0;
				float Out_Luminosity4_g158306 = 0;
				float Out_AlphaClip4_g158306 = 0;
				float Out_AlphaFade4_g158306 = 0;
				float3 Out_Translucency4_g158306 = float3( 0,0,0 );
				float Out_Transmission4_g158306 = 0;
				float Out_Thickness4_g158306 = 0;
				float Out_Diffusion4_g158306 = 0;
				Out_Dummy4_g158306 = Data4_g158306.Dummy;
				Out_Albedo4_g158306 = Data4_g158306.Albedo;
				Out_NormalTS4_g158306 = Data4_g158306.NormalTS;
				Out_NormalWS4_g158306 = Data4_g158306.NormalWS;
				Out_Shader4_g158306 = Data4_g158306.Shader;
				Out_Emissive4_g158306= Data4_g158306.Emissive;
				Out_MultiMask4_g158306 = Data4_g158306.MultiMask;
				Out_Grayscale4_g158306 = Data4_g158306.Grayscale;
				Out_Luminosity4_g158306= Data4_g158306.Luminosity;
				Out_AlphaClip4_g158306 = Data4_g158306.AlphaClip;
				Out_AlphaFade4_g158306 = Data4_g158306.AlphaFade;
				Out_Translucency4_g158306 = Data4_g158306.Translucency;
				Out_Transmission4_g158306 = Data4_g158306.Transmission;
				Out_Thickness4_g158306 = Data4_g158306.Thickness;
				Out_Diffusion4_g158306 = Data4_g158306.Diffusion;
				half3 Visual_Albedo199_g158305 = Out_Albedo4_g158306;
				half3 Final_Albedo312_g158305 = Visual_Albedo199_g158305;
				float3 In_Albedo3_g158307 = Final_Albedo312_g158305;
				float2 In_NormalTS3_g158307 = Out_NormalTS4_g158306;
				float3 In_NormalWS3_g158307 = Out_NormalWS4_g158306;
				float4 In_Shader3_g158307 = Out_Shader4_g158306;
				float4 In_Emissive3_g158307 = Out_Emissive4_g158306;
				float In_Grayscale3_g158307 = Out_Grayscale4_g158306;
				float In_Luminosity3_g158307 = Out_Luminosity4_g158306;
				float temp_output_301_11_g158305 = Out_MultiMask4_g158306;
				float In_MultiMask3_g158307 = temp_output_301_11_g158305;
				float In_AlphaClip3_g158307 = Out_AlphaClip4_g158306;
				float In_AlphaFade3_g158307 = Out_AlphaFade4_g158306;
				float3 temp_cast_8 = (0.0).xxx;
				half3 Subsurface_Color264_g158305 = ( (_SubsurfaceColor).rgb * Visual_Albedo199_g158305 );
				half Visual_Transmission138_g158305 = Out_Transmission4_g158306;
				half Subsurface_Value268_g158305 = _SubsurfaceIntensityValue;
				TVEGlobalData Data15_g158309 = Data204_g157155;
				float Out_Dummy15_g158309 = 0;
				float4 Out_CoatParams15_g158309 = float4( 0,0,0,0 );
				float4 Out_PaintParams15_g158309 = float4( 0,0,0,0 );
				float4 Out_GlowParams15_g158309 = float4( 0,0,0,0 );
				float4 Out_AtmoParams15_g158309 = float4( 0,0,0,0 );
				float4 Out_FadeParams15_g158309 = float4( 0,0,0,0 );
				float4 Out_FormParams15_g158309 = float4( 0,0,0,0 );
				float4 Out_LandParams15_g158309 = float4( 0,0,0,0 );
				float4 Out_WindParams15_g158309 = float4( 0,0,0,0 );
				float4 Out_PushParams15_g158309 = float4( 0,0,0,0 );
				Out_Dummy15_g158309 = Data15_g158309.Dummy;
				Out_CoatParams15_g158309 = Data15_g158309.CoatParams;
				Out_PaintParams15_g158309 = Data15_g158309.PaintParams;
				Out_GlowParams15_g158309 = Data15_g158309.GlowParams;
				Out_AtmoParams15_g158309= Data15_g158309.AtmoParams;
				Out_FadeParams15_g158309= Data15_g158309.FadeParams;
				Out_FormParams15_g158309 = Data15_g158309.FormParams;
				Out_LandParams15_g158309 = Data15_g158309.LandParams;
				Out_WindParams15_g158309 = Data15_g158309.WindParams;
				Out_PushParams15_g158309 = Data15_g158309.PushParams;
				half4 Global_GlowParams373_g158305 = Out_GlowParams15_g158309;
				float lerpResult403_g158305 = lerp( 1.0 , saturate( (Global_GlowParams373_g158305).w ) , TVE_IsEnabled);
				#ifdef TVE_SUBSURFACE_ELEMENT
				float staticSwitch367_g158305 = lerpResult403_g158305;
				#else
				float staticSwitch367_g158305 = 1.0;
				#endif
				half Subsurface_GlobalMask369_g158305 = staticSwitch367_g158305;
				half Visual_MultiMask292_g158305 = temp_output_301_11_g158305;
				float lerpResult293_g158305 = lerp( 1.0 , Visual_MultiMask292_g158305 , _SubsurfaceMultiValue);
				half Subsurface_MultiMask296_g158305 = lerpResult293_g158305;
				half Custom_Mask363_g158305 = 1.0;
				#ifdef TVE_SUBSURFACE
				float staticSwitch345_g158305 = ( Visual_Transmission138_g158305 * Subsurface_Value268_g158305 * Subsurface_GlobalMask369_g158305 * Subsurface_MultiMask296_g158305 * Custom_Mask363_g158305 );
				#else
				float staticSwitch345_g158305 = 0.0;
				#endif
				half Final_Transmission269_g158305 = staticSwitch345_g158305;
				#ifdef TVE_SUBSURFACE
				float3 staticSwitch348_g158305 = ( Subsurface_Color264_g158305 * Final_Transmission269_g158305 * 10.0 );
				#else
				float3 staticSwitch348_g158305 = temp_cast_8;
				#endif
				half3 Final_Translucency254_g158305 = staticSwitch348_g158305;
				float3 In_Translucency3_g158307 = Final_Translucency254_g158305;
				float In_Transmission3_g158307 = Final_Transmission269_g158305;
				#ifdef TVE_SUBSURFACE
				float staticSwitch351_g158305 = _SubsurfaceThicknessValue;
				#else
				float staticSwitch351_g158305 = 1.0;
				#endif
				half Final_Thickness275_g158305 = staticSwitch351_g158305;
				float In_Thickness3_g158307 = Final_Thickness275_g158305;
				float Final_Diffusion340_g158305 = _SubsurfaceDiffusion;
				float In_Diffusion3_g158307 = Final_Diffusion340_g158305;
				Data3_g158307.Dummy = In_Dummy3_g158307;
				Data3_g158307.Albedo = In_Albedo3_g158307;
				Data3_g158307.NormalTS = In_NormalTS3_g158307;
				Data3_g158307.NormalWS = In_NormalWS3_g158307;
				Data3_g158307.Shader = In_Shader3_g158307;
				Data3_g158307.Emissive= In_Emissive3_g158307;
				Data3_g158307.MultiMask = In_MultiMask3_g158307;
				Data3_g158307.Grayscale = In_Grayscale3_g158307;
				Data3_g158307.Luminosity = In_Luminosity3_g158307;
				Data3_g158307.AlphaClip = In_AlphaClip3_g158307;
				Data3_g158307.AlphaFade = In_AlphaFade3_g158307;
				Data3_g158307.Translucency = In_Translucency3_g158307;
				Data3_g158307.Transmission = In_Transmission3_g158307;
				Data3_g158307.Thickness = In_Thickness3_g158307;
				Data3_g158307.Diffusion = In_Diffusion3_g158307;
				TVEVisualData Data4_g158315 = Data3_g158307;
				float Out_Dummy4_g158315 = 0;
				float3 Out_Albedo4_g158315 = float3( 0,0,0 );
				float2 Out_NormalTS4_g158315 = float2( 0,0 );
				float3 Out_NormalWS4_g158315 = float3( 0,0,0 );
				float4 Out_Shader4_g158315 = float4( 0,0,0,0 );
				float4 Out_Emissive4_g158315 = float4( 0,0,0,0 );
				float Out_MultiMask4_g158315 = 0;
				float Out_Grayscale4_g158315 = 0;
				float Out_Luminosity4_g158315 = 0;
				float Out_AlphaClip4_g158315 = 0;
				float Out_AlphaFade4_g158315 = 0;
				float3 Out_Translucency4_g158315 = float3( 0,0,0 );
				float Out_Transmission4_g158315 = 0;
				float Out_Thickness4_g158315 = 0;
				float Out_Diffusion4_g158315 = 0;
				Out_Dummy4_g158315 = Data4_g158315.Dummy;
				Out_Albedo4_g158315 = Data4_g158315.Albedo;
				Out_NormalTS4_g158315 = Data4_g158315.NormalTS;
				Out_NormalWS4_g158315 = Data4_g158315.NormalWS;
				Out_Shader4_g158315 = Data4_g158315.Shader;
				Out_Emissive4_g158315= Data4_g158315.Emissive;
				Out_MultiMask4_g158315 = Data4_g158315.MultiMask;
				Out_Grayscale4_g158315 = Data4_g158315.Grayscale;
				Out_Luminosity4_g158315= Data4_g158315.Luminosity;
				Out_AlphaClip4_g158315 = Data4_g158315.AlphaClip;
				Out_AlphaFade4_g158315 = Data4_g158315.AlphaFade;
				Out_Translucency4_g158315 = Data4_g158315.Translucency;
				Out_Transmission4_g158315 = Data4_g158315.Transmission;
				Out_Thickness4_g158315 = Data4_g158315.Thickness;
				Out_Diffusion4_g158315 = Data4_g158315.Diffusion;
				half3 Input_Albedo24_g158313 = Out_Albedo4_g158315;
				#ifdef UNITY_COLORSPACE_GAMMA
				float4 staticSwitch22_g158313 = half4(0.2209163,0.2209163,0.2209163,0.7790837);
				#else
				float4 staticSwitch22_g158313 = half4(0.04,0.04,0.04,0.96);
				#endif
				half4 ColorSpaceDielectricSpec23_g158313 = staticSwitch22_g158313;
				float4 break24_g158312 = Out_Shader4_g158315;
				half Metallic117_g158312 = break24_g158312.x;
				half Input_Metallic25_g158313 = Metallic117_g158312;
				half OneMinusReflectivity31_g158313 = ( (ColorSpaceDielectricSpec23_g158313).w - ( (ColorSpaceDielectricSpec23_g158313).w * Input_Metallic25_g158313 ) );
				float3 lerpResult87_g158312 = lerp( half3(1,0,0) , ( Input_Albedo24_g158313 * OneMinusReflectivity31_g158313 ) , _IsInitialized);
				

				surfaceDescription.Albedo = lerpResult87_g158312;
				o.Normal = Out_NormalWS4_g158315;
				surfaceDescription.BentNormal = float3( 0, 0, 1 );
				surfaceDescription.CoatMask = 0;
				surfaceDescription.Metallic = 0;

				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceDescription.Specular = 0;
				#endif

				surfaceDescription.Emission = (Out_Emissive4_g158315).xyz;
				surfaceDescription.Smoothness = break24_g158312.w;
				surfaceDescription.Occlusion = 1;
				surfaceDescription.Alpha = 1;

				#ifdef _ALPHATEST_ON
				surfaceDescription.AlphaClipThreshold = 0;
				#endif

				#ifdef _ENABLE_GEOMETRIC_SPECULAR_AA
				surfaceDescription.SpecularAAScreenSpaceVariance = 0;
				surfaceDescription.SpecularAAThreshold = 0;
				#endif

				#ifdef _SPECULAR_OCCLUSION_CUSTOM
				surfaceDescription.SpecularOcclusion = 0;
				#endif

				#if defined(_HAS_REFRACTION) || defined(_MATERIAL_FEATURE_TRANSMISSION)
				surfaceDescription.Thickness = Out_Thickness4_g158315;
				#endif

				#ifdef _HAS_REFRACTION
				surfaceDescription.RefractionIndex = 1;
				surfaceDescription.RefractionColor = float3( 1,1,1 );
				surfaceDescription.RefractionDistance = 0;
				#endif

				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceDescription.SubsurfaceMask = 1;
				#endif

				#ifdef _MATERIAL_FEATURE_TRANSMISSION
				surfaceDescription.TransmissionMask = Out_Transmission4_g158315;
				#endif

				#if defined( _MATERIAL_FEATURE_SUBSURFACE_SCATTERING ) || defined( _MATERIAL_FEATURE_TRANSMISSION )
				surfaceDescription.DiffusionProfile = Out_Diffusion4_g158315;
				#endif
				
				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceDescription.Anisotropy = 1;
				surfaceDescription.Tangent = float3( 1,0,0 );
				#endif

				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceDescription.IridescenceMask = 0;
				surfaceDescription.IridescenceThickness = 0;
				#endif

				packedInput.positionCS.zw = positionCS.zw;
				float3 positionRWS = positionWS;

				input.positionSS = packedInput.positionCS;
				input.positionRWS = positionRWS;
				//#if defined( ASE_SRP_VERSION ) && ASE_SRP_VERSION < 60900
				//input.worldToTangent = k_identity3x3;
				//#else
				input.tangentToWorld = k_identity3x3;
				//#endif

				PositionInputs posInput = GetPositionInput( input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS );

				SurfaceData surfaceData;
				BuiltinData builtinData;

				float3 normalizedWorldViewDir = GetWorldSpaceNormalizeViewDir( input.positionRWS );

				GetSurfaceAndBuiltinData( surfaceDescription,input, normalizedWorldViewDir, posInput, surfaceData, builtinData );

				BSDFData bsdfData = ConvertSurfaceDataToBSDFData( input.positionSS.xy, surfaceData );
				LightTransportData lightTransportData = GetLightTransportData( surfaceData, builtinData, bsdfData );

				float4 res = float4( 0.0, 0.0, 0.0, 1.0 );
				if( unity_MetaFragmentControl.x )
				{
					res.rgb = clamp( pow( abs( lightTransportData.diffuseColor ), saturate( unity_OneOverOutputBoost ) ), 0, unity_MaxOutputValue );
				}

				if( unity_MetaFragmentControl.y )
				{
					res.rgb = lightTransportData.emissiveColor;
				}

				return res;
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "ShadowCaster"
			Tags { "LightMode"="ShadowCaster" }
			ColorMask 0

			HLSLPROGRAM
			#pragma shader_feature_local_fragment _DISABLE_DECALS
			#pragma shader_feature_local_fragment _DISABLE_SSR
			#define _MATERIAL_FEATURE_TRANSMISSION 1
			#define ASE_SRP_VERSION 140011
			#define ASE_USING_SAMPLING_MACROS 1

			#pragma vertex Vert
			#pragma fragment Frag

			#if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define OUTPUT_SPLIT_LIGHTING
			#endif

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			//#if defined( ASE_SRP_VERSION ) && ASE_SRP_VERSION < 60900
			//#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Wind.hlsl"
			//#endif
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"

			#define SHADERPASS SHADERPASS_SHADOWS
			#define USE_LEGACY_UNITY_MATRIX_VARIABLES

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"

			//#if defined( ASE_SRP_VERSION ) && ASE_SRP_VERSION < 60900
			//#define T2W(var, index) var.worldToTangent[index]
			//#else
			#define T2W(var, index) var.tangentToWorld[index]
			//#endif

			#define ai_ObjectToWorld GetObjectToWorldMatrix()
			#define ai_WorldToObject GetWorldToObjectMatrix()
			#define AI_INV_TWO_PI  INV_TWO_PI
			#define AI_PI          PI
			#define AI_INV_PI      INV_PI
			#define ASE_NEEDS_VERT_NORMAL
			#pragma shader_feature_local_fragment TVE_PIPELINE_STANDARD TVE_PIPELINE_UNIVERSAL TVE_PIPELINE_HD
			#pragma shader_feature_local_vertex TVE_MOTION_BASE_BENDING
			#pragma shader_feature_local_vertex TVE_MOTION_WIND_ELEMENT
			  
			struct TVEVisualData
			{  
				half Dummy;  
				half3 Albedo;
				half2 NormalTS;
				half3 NormalWS; 
				half4 Shader;
				half4 Emissive;
				half AlphaClip;
				half AlphaFade;
				half MultiMask;
				half Grayscale;
				half Luminosity;
				half3 Translucency;
				half Transmission;
				half Thickness;
				float Diffusion;
			};  
			    
			struct TVEModelData
			{    
				half Dummy;    
				half3 PositionOS;
				half3 PositionWS;
				half3 PositionWO;
				half3 PositionRawOS;
				half3 PositionAddOS;
				half3 PivotOS;
				half3 PivotWS;
				half3 PivotWO;
				half3 NormalOS;
				half3 NormalWS;
				half3 NormalRawOS;
				half3 NormalRawWS;
				half4 TangentOS;
				half3 ViewDirWS;
				half4 VertexData;
				half4 MotionData;
				half4 BoundsData;
				half4 RotationData;
			};    
			      
			struct TVEGlobalData
			{      
				half Dummy;      
				half4 CoatParams;
				half4 PaintParams;
				half4 GlowParams;
				half4 AtmoParams;
				half4 FadeParams;
				half4 FormParams;
				half4 LandParams;
				half4 WindParams;
				half4 PushParams;
			};      
			        
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END
			//#pragma editor_sync_compilation


			struct AttributesMesh
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 texcoord : TEXCOORD0;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryingsMeshToPS
			{
				float4 positionCS : SV_Position;
				float3 interp00 : TEXCOORD10;
				float4 UVsFrame122_g156549 : TEXCOORD0;
				float4 UVsFrame222_g156549 : TEXCOORD1;
				float4 UVsFrame322_g156549 : TEXCOORD2;
				float4 octaframe22_g156549 : TEXCOORD3;
				float4 viewPos22_g156549 : TEXCOORD4;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START( UnityPerMaterial )
			float4 _DrynessColor;
			half4 _ImpostorColor;
			half4 _ImpostorColorTwo;
			float4 _OverlayGlitterTex_ST;
			half4 _InteractionColoring;
			float4 _AI_SizeOffset;
			half4 _SizeFadeColoring;
			half4 _VariationColoring;
			half4 _VariationColorTwo;
			half4 _VariationColorOne;
			half4 _VariationNoiseRemap;
			half4 _DitherColoring;
			half4 _TintingColoring;
			float4 _TintingColor;
			half4 _TintingLumaRemap;
			half4 _DrynessColoring;
			half4 _CutoutColoring;
			half4 _WetnessColoring;
			half4 _OverlayColor;
			half4 _OverlayProjRemap;
			half4 _DrynessLumaRemap;
			half4 _OverlayLumaRemap;
			half4 _OverlayColoringOn;
			half4 _OverlayColoringOff;
			half4 _SubsurfaceColor;
			half4 _OverlayGlitterColor;
			half4 _EmissiveColor;
			float4 _SubsurfaceDiffusion_Asset;
			half4 _OverlayBlendRemap1;
			float3 _AI_Offset;
			half _GlobalEnd;
			half _CutoutMultiValue;
			half _CutoutAlphaValue;
			half _CutoutNoiseValue;
			half _CutoutNoiseTillingValue;
			half _DitherLiteInfo;
			half _ImpostorMetallicValue;
			half _EmissiveExposureValue;
			float _emissive_power_value;
			half _DitherEnd;
			half _ImpostorColorMode;
			half _DitherConstantValue;
			half _EmissiveIntensityValue;
			half _GlobalLiteInfo;
			half _DitherDistanceValue;
			half _DitherCategory;
			half _DitherDistanceMaxValue;
			half _CutoutShadowMode;
			half _CutoutElementMode;
			half _OverlayIntensityValue;
			half _WetnessCategory;
			half _WetnessEnd;
			half _WetnessElementMode;
			half _WetnessIntensityValue;
			half _WetnessContrastValue;
			half _CutoutIntensityValue;
			half _WetnessSmoothnessValue;
			half _OverlayLumaValue;
			half _CutoutCategory;
			half _CutoutEnd;
			half _SubsurfaceIntensityValue;
			half _CutoutSpace;
			half _ImpostorSmoothnessValue;
			half _CutoutLiteInfo;
			half _OverlayGlitterDistValue;
			half _DitherDistanceMinValue;
			half _DitherShadowMode;
			half _SubsurfaceAmbientValue;
			half _SubsurfaceShadowValue;
			half _SubsurfaceElementMode;
			half _EmissiveCategory;
			half _GlobalCategory;
			half _EmissiveEnd;
			half _SubsurfaceNormalValue;
			half _EmissivePowerMode;
			half _EmissiveElementMode;
			half _OverlayCategory;
			half _OverlayEnd;
			half _OverlaySpace;
			half _OverlayElementMode;
			half _OverlayBakeInfo;
			half _EmissivePowerValue;
			half _OverlaySubsurfaceValue;
			half _SubsurfaceDirectValue;
			half _SubsurfaceCategory;
			half _DitherMultiValue;
			half _DitherNoiseTillingValue;
			half _OverlayProjValue;
			half _OverlaySmoothnessValue;
			half _SizeFadeCategory;
			half _SizeFadeEnd;
			half _SubsurfaceEnd;
			half _SizeFadeElementMode;
			half _SizeFadeScaleMode;
			half _SizeFadeScaleValue;
			half _SizeFadeDistMinValue;
			half _OverlayNormalValue;
			half _WetnessLiteInfo;
			half _SizeFadeDistMaxValue;
			half _SizeFadeIntensityValue;
			half _SizeFadeLiteInfo;
			half _ImpostorAlphaClipValue;
			half _DrynessMultiValue;
			half _RenderMotion;
			half _RenderShadow;
			half _ImpostorCategory;
			half _IsImpostorShader;
			half _IsSubsurfaceShader;
			half _IsLiteShader;
			half _ImpostorEnd;
			half _MotionWindCategory;
			half _MotionWindEnd;
			half _MotionWindElementMode;
			half _MotionInteractionCategory;
			half _MotionInteractionEnd;
			half _InteractionLiteInfo;
			half _MotionPushIntensityValue;
			half _MotionPushPivotValue;
			half _MotionPushMaskValue;
			half _MotionPushElementMode;
			half _IsIdentifier;
			half _IsConverted;
			half _IsCollected;
			half _HasDefaultTextures;
			half _OverlayGlitterTillingValue;
			half _OverlayGlitterIntensityValue;
			half _OverlayLiteInfo;
			half _SubsurfaceScatteringValue;
			half _SubsurfaceAngleValue;
			float _SubsurfaceDiffusion;
			half _SubsurfaceSpace;
			half _IsVersion;
			float _AI_Frames;
			half _RenderDecals;
			half _CategoryRender;
			half _EndRender;
			half _NoiseCategory;
			half _NoiseEnd;
			half _IsInitialized;
			half _IsTVEShader;
			half _IsCustomShader;
			half _IsShared;
			half _RenderSSR;
			half _DrynessLumaValue;
			float _AI_FramesX;
			float _AI_ImpostorSize;
			half _TintingSpace;
			half _TintingElementMode;
			half _TintingIntensityValue;
			half _TintingGrayValue;
			half _TintingMultiValue;
			half _TintingLumaValue;
			half _DrynessLiteInfo;
			half _DrynessCategory;
			half _DrynessEnd;
			half _DrynessSpace;
			half _DrynessElementMode;
			half _DrynessIntensityValue;
			half _SubsurfaceMultiValue;
			half _DrynessGrayValue;
			half _DrynessShiftValue;
			half _DrynessSmoothnessValue;
			half _DrynessSubsurfaceValue;
			half _TintingEnd;
			half _TintingCategory;
			half _TintingLiteInfo;
			half _VariationNoiseTillingValue;
			float _AI_Parallax;
			float _AI_TextureBias;
			float _AI_DepthSize;
			float _AI_ShadowBias;
			float _AI_ShadowView;
			float _AI_Clip;
			half _MotionBaseIntensityValue;
			half _MotionBasePivotValue;
			float _AI_FramesY;
			half _MotionTillingValue;
			half _global_wind_layer_value;
			half _MotionDelayValue;
			half _VariationLiteInfo;
			half _VariationCategory;
			half _VariationEnd;
			half _VariationIntensityValue;
			half _VariationMultiValue;
			half _VariationNoisePivotsValue1;
			half _MotionIntensityValue;
			half _SubsurfaceThicknessValue;
			float _BlendMode;
			CBUFFER_END

			TEXTURE2D(_OverlayGlitterTex);
			SAMPLER(sampler_OverlayGlitterTex);
			TEXTURE3D(_NoiseTex3D);
			SAMPLER(sampler_NoiseTex3D);
			float4x4 unity_CameraProjection;
			float4x4 unity_CameraInvProjection;
			float4x4 unity_WorldToCamera;
			float4x4 unity_CameraToWorld;
			TEXTURE2D(_Albedo);
			SAMPLER(sampler_Albedo);
			TEXTURE2D(_Normals);
			SAMPLER(sampler_Normals);
			float3 TVE_WorldOrigin;
			TEXTURE2D(_MotionNoiseTex);
			SAMPLER(sampler_Linear_Repeat);
			float TVE_WindLayers[10];
			TEXTURE2D_ARRAY(TVE_WindBaseTex);
			half4 TVE_RenderBaseCoords;
			SAMPLER(sampler_Linear_Clamp);
			TEXTURE2D_ARRAY(TVE_WindNearTex);
			half4 TVE_RenderNearCoords;
			float4 TVE_RenderNearPositionR;
			half TVE_RenderNearFadeValue;
			half4 TVE_WindParams;
			half _DisableSRPBatcher;


			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"

			float2 VectortoOctahedron( float3 N )
			{
				N /= dot( 1.0, abs( N ) );
				if( N.z <= 0 )
				{
				N.xy = ( 1 - abs( N.yx ) ) * ( N.xy >= 0 ? 1.0 : -1.0 );
				}
				return N.xy;
			}
			
			float3 OctahedronToVector( float2 Oct )
			{
				float3 N = float3( Oct, 1.0 - dot( 1.0, abs( Oct ) ) );
				if(N.z< 0 )
				{
				N.xy = ( 1 - abs( N.yx) ) * (N.xy >= 0 ? 1.0 : -1.0 );
				}
				return normalize( N);
			}
			
			inline void RayPlaneIntersectionUV( float3 normalOS, float3 rayPosition, float3 rayDirection, inout float2 uvs, inout float3 localNormal )
			{
				float lDotN = dot( rayDirection, normalOS ); 
				float p0l0DotN = dot( -rayPosition, normalOS );
				float t = p0l0DotN / lDotN;
				float3 p = rayDirection * t + rayPosition;
				float3 upVector = float3( 0, 1, 0 );
				float3 tangent = normalize( cross( upVector, normalOS ) + float3( -0.001, 0, 0 ) );
				float3 bitangent = cross( tangent, normalOS );
				float frameX = dot( p, tangent );
				float frameZ = dot( p, bitangent );
				uvs = -float2( frameX, frameZ );
				if( t <= 0.0 )
				uvs = 0;
				float3x3 worldToLocal = float3x3( tangent, bitangent, normalOS );
				localNormal = normalize( mul( worldToLocal, rayDirection ) );
			}
			
			inline void OctaImpostorVertex( inout float4 positionOS, inout float3 normalOS, inout float4 uvsFrame1, inout float4 uvsFrame2, inout float4 uvsFrame3, inout float4 octaFrame, inout float4 viewPos )
			{
				float2 uvOffset = _AI_SizeOffset.zw;
				float parallax = -_AI_Parallax; 
				float UVscale = _AI_ImpostorSize;
				float framesXY = _AI_Frames;
				float prevFrame = framesXY - 1;
				float3 fractions = 1.0 / float3( framesXY, prevFrame, UVscale );
				float fractionsFrame = fractions.x;
				float fractionsPrevFrame = fractions.y;
				float fractionsUVscale = fractions.z;
				float3 worldCameraPos;
				#if defined(UNITY_PASS_SHADOWCASTER)
				float3 worldOrigin = 0;
				float4 perspective = float4( 0, 0, 0, 1 );
				if ( UNITY_MATRIX_P[ 3 ][ 3 ] == 1 )
				{
				perspective = float4( 0, 0, 5000, 0 );
				worldOrigin = ai_ObjectToWorld._m03_m13_m23;
				}
				worldCameraPos = worldOrigin + mul( UNITY_MATRIX_I_V, perspective ).xyz;
				#else
				if ( UNITY_MATRIX_P[ 3 ][ 3 ] == 1 )
				{
				worldCameraPos = ai_ObjectToWorld._m03_m13_m23 + UNITY_MATRIX_I_V._m02_m12_m22 * 5000;
				}
				else
				{
				worldCameraPos = GetCameraRelativePositionWS( _WorldSpaceCameraPos );
				}
				#endif
				float3 objectCameraPosition = mul( ai_WorldToObject, float4( worldCameraPos, 1 ) ).xyz - _AI_Offset.xyz; 
				float3 objectCameraDirection = normalize( objectCameraPosition );
				float3 upVector = float3( 0,1,0 );
				float3 objectHorizontalVector = normalize( cross( objectCameraDirection, upVector ) );
				float3 objectVerticalVector = cross( objectHorizontalVector, objectCameraDirection );
				float2 uvExpansion = positionOS.xy;
				float3 billboard = objectHorizontalVector * uvExpansion.x + objectVerticalVector * uvExpansion.y;
				float3 localDir = billboard - objectCameraPosition; 
				objectCameraDirection = trunc( objectCameraDirection * 65536.0 ) / 65536.0;
				float2 frameOcta = VectortoOctahedron( objectCameraDirection.xzy ) * 0.5 + 0.5;
				float2 prevOctaFrame = frameOcta * prevFrame;
				float2 baseOctaFrame = floor( prevOctaFrame );
				float2 fractionOctaFrame = ( baseOctaFrame * fractionsFrame );
				float2 octaFrame1 = ( baseOctaFrame * fractionsPrevFrame ) * 2.0 - 1.0;
				float3 octa1WorldY = OctahedronToVector( octaFrame1 ).xzy;
				float3 octa1LocalY;
				float2 uvFrame1;
				RayPlaneIntersectionUV( octa1WorldY, objectCameraPosition, localDir, /*inout*/ uvFrame1, /*inout*/ octa1LocalY );
				float2 uvParallax1 = octa1LocalY.xy * fractionsFrame * parallax;
				uvFrame1 = ( uvFrame1 * fractionsUVscale + 0.5 ) * fractionsFrame + fractionOctaFrame;
				uvsFrame1 = float4( uvParallax1, uvFrame1) - float4( 0, 0, uvOffset );
				float2 fractPrevOctaFrame = frac( prevOctaFrame );
				float2 cornerDifference = lerp( float2( 0,1 ) , float2( 1,0 ) , saturate( ceil( ( fractPrevOctaFrame.x - fractPrevOctaFrame.y ) ) ));
				float2 octaFrame2 = ( ( baseOctaFrame + cornerDifference ) * fractionsPrevFrame ) * 2.0 - 1.0;
				float3 octa2WorldY = OctahedronToVector( octaFrame2 ).xzy;
				float3 octa2LocalY;
				float2 uvFrame2;
				RayPlaneIntersectionUV( octa2WorldY, objectCameraPosition, localDir, /*inout*/ uvFrame2, /*inout*/ octa2LocalY );
				float2 uvParallax2 = octa2LocalY.xy * fractionsFrame * parallax;
				uvFrame2 = ( uvFrame2 * fractionsUVscale + 0.5 ) * fractionsFrame + ( ( cornerDifference * fractionsFrame ) + fractionOctaFrame );
				uvsFrame2 = float4( uvParallax2, uvFrame2) - float4( 0, 0, uvOffset );
				float2 octaFrame3 = ( ( baseOctaFrame + 1 ) * fractionsPrevFrame  ) * 2.0 - 1.0;
				float3 octa3WorldY = OctahedronToVector( octaFrame3 ).xzy;
				float3 octa3LocalY;
				float2 uvFrame3;
				RayPlaneIntersectionUV( octa3WorldY, objectCameraPosition, localDir, /*inout*/ uvFrame3, /*inout*/ octa3LocalY );
				float2 uvParallax3 = octa3LocalY.xy * fractionsFrame * parallax;
				uvFrame3 = ( uvFrame3 * fractionsUVscale + 0.5 ) * fractionsFrame + ( fractionOctaFrame + fractionsFrame );
				uvsFrame3 = float4( uvParallax3, uvFrame3) - float4( 0, 0, uvOffset );
				octaFrame = 0;
				octaFrame.xy = prevOctaFrame;
				octaFrame.zw = fractionOctaFrame;
				positionOS.xyz = billboard + _AI_Offset.xyz;
				normalOS.xyz = objectCameraDirection;
				viewPos = 0;
				viewPos.xyz = TransformWorldToView( TransformObjectToWorld( positionOS.xyz ) );
			}
			
			float3 ObjectPosition_UNITY_MATRIX_M(  )
			{
				return float3(UNITY_MATRIX_M[0].w, UNITY_MATRIX_M[1].w, UNITY_MATRIX_M[2].w );
			}
			

			void BuildSurfaceData(FragInputs fragInputs, inout AlphaSurfaceDescription surfaceDescription, float3 V, out SurfaceData surfaceData, out float3 bentNormalWS)
			{
				ZERO_INITIALIZE(SurfaceData, surfaceData);

				surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;
				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
					surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
				#endif
				#ifdef _MATERIAL_FEATURE_TRANSMISSION
					surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
				#endif
				#ifdef _MATERIAL_FEATURE_ANISOTROPY
					surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;
				#endif

				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
					surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
				#endif
				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
					surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
				#endif

				#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
					surfaceData.baseColor *= (1.0 - Max3(surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b));
				#endif

				GetNormalWS( fragInputs, float3( 0.0, 0.0, 1.0 ), surfaceData.normalWS, float3( 1.0, 1.0, 1.0 ) );
				bentNormalWS = surfaceData.normalWS;

				surfaceData.geomNormalWS = T2W(fragInputs, 2);

				#ifdef _HAS_REFRACTION
					if (_EnableSSRefraction)
					{

						surfaceData.transmittanceMask = (1.0 - surfaceDescription.Alpha);
						surfaceDescription.Alpha = 1.0;
					}
					else
					{
						surfaceData.ior = 1.0;
						surfaceData.transmittanceColor = float3(1.0, 1.0, 1.0);
						surfaceData.atDistance = 1.0;
						surfaceData.transmittanceMask = 0.0;
						surfaceDescription.Alpha = 1.0;
					}
				#else
					surfaceData.ior = 1.0;
					surfaceData.transmittanceColor = float3(1.0, 1.0, 1.0);
					surfaceData.atDistance = 1.0;
					surfaceData.transmittanceMask = 0.0;
				#endif

					surfaceData.tangentWS = normalize(T2W(fragInputs, 0).xyz);    // The tangent is not normalize in worldToTangent for mikkt. TODO: Check if it expected that we normalize with Morten. Tag: SURFACE_GRADIENT
					surfaceData.tangentWS = Orthonormalize(surfaceData.tangentWS, surfaceData.normalWS);

				#if defined(_SPECULAR_OCCLUSION_CUSTOM)
				#elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
					surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO(V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness(surfaceData.perceptualSmoothness));
				#elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
					surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion(ClampNdotV(dot(surfaceData.normalWS, V)), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness(surfaceData.perceptualSmoothness));
				#else
					surfaceData.specularOcclusion = 1.0;
				#endif
				#ifdef _ENABLE_GEOMETRIC_SPECULAR_AA
					surfaceData.perceptualSmoothness = GeometricNormalFiltering(surfaceData.perceptualSmoothness, T2W(fragInputs, 2), surfaceDescription.SpecularAAScreenSpaceVariance, surfaceDescription.SpecularAAThreshold);
				#endif
			}

			void GetSurfaceAndBuiltinData(AlphaSurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
			{
				//#ifdef LOD_FADE_CROSSFADE
				//	uint3 fadeMaskSeed = asuint((int3)(V * _ScreenSize.xyx));
				//	LODDitheringTransition(fadeMaskSeed, unity_LODFade.x);
				//#endif

				#ifdef _ALPHATEST_ON
					DoAlphaTest ( surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold );
				#endif
				float3 bentNormalWS;
				BuildSurfaceData(fragInputs, surfaceDescription, V, surfaceData, bentNormalWS);

				#if HAVE_DECALS
				if( _EnableDecals )
				{
					DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, surfaceDescription.Alpha);
					ApplyDecalToSurfaceData(decalSurfaceData, fragInputs.tangentToWorld[2], surfaceData);
				}
				#endif

				#if defined( ASE_SRP_VERSION ) && ASE_SRP_VERSION <= 50702
					InitBuiltinData( surfaceDescription.Alpha, bentNormalWS, -T2W(fragInputs, 2), fragInputs.positionRWS, fragInputs.texCoord1, fragInputs.texCoord2, builtinData );
				#else
					InitBuiltinData( posInput, surfaceDescription.Alpha, bentNormalWS, -T2W(fragInputs, 2), fragInputs.texCoord1, fragInputs.texCoord2, builtinData );
				#endif

				builtinData.depthOffset = 0.0;

				#if (SHADERPASS == SHADERPASS_DISTORTION)
					builtinData.distortion = surfaceDescription.Distortion;
					builtinData.distortionBlur = surfaceDescription.DistortionBlur;
				#else
					builtinData.distortion = float2(0.0, 0.0);
					builtinData.distortionBlur = 0.0;
				#endif

				PostInitBuiltinData(V, posInput, surfaceData, builtinData);
			}

			PackedVaryingsMeshToPS Vert(AttributesMesh inputMesh  )
			{
				PackedVaryingsMeshToPS outputPackedVaryingsMeshToPS;

				UNITY_SETUP_INSTANCE_ID( inputMesh );
				UNITY_TRANSFER_INSTANCE_ID( inputMesh, outputPackedVaryingsMeshToPS );
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(outputPackedVaryingsMeshToPS);

				TVEModelData Data16_g158299 = (TVEModelData)0;
				float In_Dummy16_g158299 = 0.0;
				TVEModelData Data16_g158264 = (TVEModelData)0;
				half4 Dummy181_g158262 = ( ( _MotionWindCategory + _MotionWindEnd ) + _MotionWindElementMode + ( _MotionInteractionCategory + _MotionInteractionEnd ) + ( _InteractionLiteInfo + _InteractionColoring + _MotionPushIntensityValue + _MotionPushPivotValue + _MotionPushMaskValue + _MotionPushElementMode ) );
				float In_Dummy16_g158264 = Dummy181_g158262.r;
				TVEModelData Data16_g157153 = (TVEModelData)0;
				float In_Dummy16_g157153 = 0.0;
				OctaImpostorVertex( inputMesh.positionOS, inputMesh.normalOS, outputPackedVaryingsMeshToPS.UVsFrame122_g156549, outputPackedVaryingsMeshToPS.UVsFrame222_g156549, outputPackedVaryingsMeshToPS.UVsFrame322_g156549, outputPackedVaryingsMeshToPS.octaframe22_g156549, outputPackedVaryingsMeshToPS.viewPos22_g156549 );
				float3 worldPosOut22_g156549 = GetAbsolutePositionWS( mul( UNITY_MATRIX_I_V, float4( outputPackedVaryingsMeshToPS.viewPos22_g156549.xyz, 1.0 ) ).xyz );
				half3 Input_PositionWS218_g157146 = worldPosOut22_g156549;
				float3 worldToObj278_g157146 = mul( GetWorldToObjectMatrix(), float4( GetCameraRelativePositionWS(Input_PositionWS218_g157146), 1 ) ).xyz;
				half3 Model_PositionOS131_g157146 = worldToObj278_g157146;
				float3 In_PositionOS16_g157153 = Model_PositionOS131_g157146;
				half3 Model_PositionWS122_g157146 = Input_PositionWS218_g157146;
				float3 In_PositionWS16_g157153 = Model_PositionWS122_g157146;
				half3 Model_PositionWO132_g157146 = ( Model_PositionWS122_g157146 - TVE_WorldOrigin );
				float3 In_PositionWO16_g157153 = Model_PositionWO132_g157146;
				float3 In_PositionRawOS16_g157153 = Model_PositionOS131_g157146;
				float3 In_PositionAddOS16_g157153 = float3( 0,0,0 );
				float3 In_PivotOS16_g157153 = float3( 0,0,0 );
				float3 localObjectPosition_UNITY_MATRIX_M14_g157148 = ObjectPosition_UNITY_MATRIX_M();
				#ifdef SHADEROPTIONS_CAMERA_RELATIVE_RENDERING
				float3 staticSwitch13_g157148 = ( localObjectPosition_UNITY_MATRIX_M14_g157148 + _WorldSpaceCameraPos );
				#else
				float3 staticSwitch13_g157148 = localObjectPosition_UNITY_MATRIX_M14_g157148;
				#endif
				half3 ObjectData20_g157150 = staticSwitch13_g157148;
				float3 ase_worldPos = GetAbsolutePositionWS( TransformObjectToWorld( (inputMesh.positionOS).xyz ) );
				half3 WorldData19_g157150 = ase_worldPos;
				#ifdef TVE_OBJECT_BATCHED
				float3 staticSwitch14_g157150 = WorldData19_g157150;
				#else
				float3 staticSwitch14_g157150 = ObjectData20_g157150;
				#endif
				float3 temp_output_124_0_g157148 = staticSwitch14_g157150;
				float3 vertexToFrag281_g157146 = temp_output_124_0_g157148;
				half3 Model_PivotWS121_g157146 = vertexToFrag281_g157146;
				float3 In_PivotWS16_g157153 = Model_PivotWS121_g157146;
				half3 Model_PivotWO133_g157146 = ( Model_PivotWS121_g157146 - TVE_WorldOrigin );
				float3 In_PivotWO16_g157153 = Model_PivotWO133_g157146;
				half3 Model_NormalOS134_g157146 = inputMesh.normalOS;
				float3 In_NormalOS16_g157153 = Model_NormalOS134_g157146;
				float3 ase_worldNormal = TransformObjectToWorldNormal(inputMesh.normalOS);
				half3 Model_Normal_WS95_g157146 = ase_worldNormal;
				float3 In_NormalWS16_g157153 = Model_Normal_WS95_g157146;
				float3 In_NormalRawOS16_g157153 = Model_NormalOS134_g157146;
				float3 In_NormalRawWS16_g157153 = Model_Normal_WS95_g157146;
				float4 In_TangentOS16_g157153 = float4( 0,1,0,1 );
				float3 normalizeResult326_g157146 = normalize( ( _WorldSpaceCameraPos - Model_PositionWS122_g157146 ) );
				half3 Model_ViewDirWS322_g157146 = normalizeResult326_g157146;
				float3 In_ViewDirWS16_g157153 = Model_ViewDirWS322_g157146;
				float4 In_VertexData16_g157153 = float4( 1,1,1,1 );
				float4 In_MotionData16_g157153 = float4( 0,0,0,0 );
				float4 In_BoundsData16_g157153 = float4( 1,1,1,1 );
				float4 In_RotationData16_g157153 = float4( 0,0,0,0 );
				Data16_g157153.Dummy = In_Dummy16_g157153;
				Data16_g157153.PositionOS = In_PositionOS16_g157153;
				Data16_g157153.PositionWS = In_PositionWS16_g157153;
				Data16_g157153.PositionWO = In_PositionWO16_g157153;
				Data16_g157153.PositionRawOS = In_PositionRawOS16_g157153;
				Data16_g157153.PositionAddOS = In_PositionAddOS16_g157153;
				Data16_g157153.PivotOS = In_PivotOS16_g157153;
				Data16_g157153.PivotWS = In_PivotWS16_g157153;
				Data16_g157153.PivotWO = In_PivotWO16_g157153;
				Data16_g157153.NormalOS = In_NormalOS16_g157153;
				Data16_g157153.NormalWS = In_NormalWS16_g157153;
				Data16_g157153.NormalRawOS = In_NormalRawOS16_g157153;
				Data16_g157153.NormalRawWS = In_NormalRawWS16_g157153;
				Data16_g157153.TangentOS = In_TangentOS16_g157153;
				Data16_g157153.ViewDirWS = In_ViewDirWS16_g157153;
				Data16_g157153.VertexData = In_VertexData16_g157153;
				Data16_g157153.MotionData = In_MotionData16_g157153;
				Data16_g157153.BoundsData = In_BoundsData16_g157153;
				Data16_g157153.RotationData = In_RotationData16_g157153;
				TVEModelData Data15_g158263 = Data16_g157153;
				float Out_Dummy15_g158263 = 0;
				float3 Out_PositionOS15_g158263 = float3( 0,0,0 );
				float3 Out_PositionWS15_g158263 = float3( 0,0,0 );
				float3 Out_PositionWO15_g158263 = float3( 0,0,0 );
				float3 Out_PositionRawOS15_g158263 = float3( 0,0,0 );
				float3 Out_PositionAddOS15_g158263 = float3( 0,0,0 );
				float3 Out_PivotOS15_g158263 = float3( 0,0,0 );
				float3 Out_PivotWS15_g158263 = float3( 0,0,0 );
				float3 Out_PivotWO15_g158263 = float3( 0,0,0 );
				float3 Out_NormalOS15_g158263 = float3( 0,0,0 );
				float3 Out_NormalWS15_g158263 = float3( 0,0,0 );
				float3 Out_NormalRawOS15_g158263 = float3( 0,0,0 );
				float3 Out_NormalRawWS15_g158263 = float3( 0,0,0 );
				float4 Out_TangentOS15_g158263 = float4( 0,0,0,0 );
				float3 Out_ViewDirWS15_g158263 = float3( 0,0,0 );
				float4 Out_VertexData15_g158263 = float4( 0,0,0,0 );
				float4 Out_MotionData15_g158263 = float4( 0,0,0,0 );
				float4 Out_BoundsData15_g158263 = float4( 0,0,0,0 );
				float4 Out_RotationData15_g158263 = float4( 0,0,0,0 );
				Out_Dummy15_g158263 = Data15_g158263.Dummy;
				Out_PositionOS15_g158263 = Data15_g158263.PositionOS;
				Out_PositionWS15_g158263 = Data15_g158263.PositionWS;
				Out_PositionWO15_g158263 = Data15_g158263.PositionWO;
				Out_PositionRawOS15_g158263 = Data15_g158263.PositionRawOS;
				Out_PositionAddOS15_g158263 = Data15_g158263.PositionAddOS;
				Out_PivotOS15_g158263 = Data15_g158263.PivotOS;
				Out_PivotWS15_g158263 = Data15_g158263.PivotWS;
				Out_PivotWO15_g158263 = Data15_g158263.PivotWO;
				Out_NormalOS15_g158263 = Data15_g158263.NormalOS;
				Out_NormalWS15_g158263 = Data15_g158263.NormalWS;
				Out_NormalRawOS15_g158263 = Data15_g158263.NormalRawOS;
				Out_NormalRawWS15_g158263 = Data15_g158263.NormalRawWS;
				Out_TangentOS15_g158263 = Data15_g158263.TangentOS;
				Out_ViewDirWS15_g158263 = Data15_g158263.ViewDirWS;
				Out_VertexData15_g158263 = Data15_g158263.VertexData;
				Out_MotionData15_g158263 = Data15_g158263.MotionData;
				Out_BoundsData15_g158263 = Data15_g158263.BoundsData;
				Out_RotationData15_g158263 = Data15_g158263.RotationData;
				float3 temp_output_1567_0_g158262 = Out_PositionOS15_g158263;
				float3 In_PositionOS16_g158264 = temp_output_1567_0_g158262;
				float3 In_PositionWS16_g158264 = Out_PositionWS15_g158263;
				float3 temp_output_1567_17_g158262 = Out_PositionWO15_g158263;
				float3 In_PositionWO16_g158264 = temp_output_1567_17_g158262;
				float3 In_PositionRawOS16_g158264 = Out_PositionRawOS15_g158263;
				float3 In_PositionAddOS16_g158264 = Out_PositionAddOS15_g158263;
				float3 In_PivotOS16_g158264 = Out_PivotOS15_g158263;
				float3 In_PivotWS16_g158264 = Out_PivotWS15_g158263;
				float3 temp_output_1567_19_g158262 = Out_PivotWO15_g158263;
				float3 In_PivotWO16_g158264 = temp_output_1567_19_g158262;
				float3 In_NormalOS16_g158264 = Out_NormalOS15_g158263;
				float3 In_NormalWS16_g158264 = Out_NormalWS15_g158263;
				float3 In_NormalRawOS16_g158264 = Out_NormalRawOS15_g158263;
				float3 In_NormalRawWS16_g158264 = Out_NormalRawWS15_g158263;
				float4 In_TangentOS16_g158264 = Out_TangentOS15_g158263;
				float3 In_ViewDirWS16_g158264 = Out_ViewDirWS15_g158263;
				float4 In_VertexData16_g158264 = Out_VertexData15_g158263;
				float4 In_MotionData16_g158264 = Out_MotionData15_g158263;
				float4 In_BoundsData16_g158264 = Out_BoundsData15_g158263;
				float2 temp_cast_1 = (0.0).xx;
				half3 Model_PositionOS147_g158262 = temp_output_1567_0_g158262;
				half Base_Mask217_g158262 = saturate( ( Model_PositionOS147_g158262.y / _AI_Offset.y ) );
				half3 Model_PositionWO162_g158262 = temp_output_1567_17_g158262;
				half3 Model_PivotWO402_g158262 = temp_output_1567_19_g158262;
				float3 lerpResult829_g158262 = lerp( Model_PositionWO162_g158262 , Model_PivotWO402_g158262 , _MotionBasePivotValue);
				half3 Base_Position1394_g158262 = lerpResult829_g158262;
				half3 Input_PositionWO419_g158267 = Base_Position1394_g158262;
				half Flow_Tillling1397_g158262 = _MotionTillingValue;
				half Input_MotionTilling321_g158267 = ( Flow_Tillling1397_g158262 + 0.2 );
				half2 Noise_Coord515_g158267 = ( -(Input_PositionWO419_g158267).xz * Input_MotionTilling321_g158267 * 0.005 );
				half4 Noise_Params535_g158267 = SAMPLE_TEXTURE2D_LOD( _MotionNoiseTex, sampler_Linear_Repeat, Noise_Coord515_g158267, 0.0 );
				float2 temp_output_648_0_g158267 = (Noise_Params535_g158267).rg;
				half Flow_Value1602_g158262 = _MotionIntensityValue;
				half Input_MotionValue629_g158267 = Flow_Value1602_g158262;
				float2 lerpResult645_g158267 = lerp( float2( 0.5,0.5 ) , temp_output_648_0_g158267 , Input_MotionValue629_g158267);
				float3 appendResult566_g158267 = (float3(lerpResult645_g158267 , (Noise_Params535_g158267).b));
				float temp_output_136_0_g158268 = _global_wind_layer_value;
				float temp_output_19_0_g158270 = TVE_WindLayers[(int)temp_output_136_0_g158268];
				half3 Input_Position180_g158271 = Input_PositionWO419_g158267;
				float2 temp_output_75_0_g158271 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g158271).xz ) );
				float temp_output_82_0_g158271 = temp_output_136_0_g158268;
				float2 temp_output_119_0_g158271 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g158271).xz ) );
				float temp_output_7_0_g158276 = 1.0;
				float temp_output_10_0_g158276 = ( TVE_RenderNearFadeValue - temp_output_7_0_g158276 );
				float4 lerpResult131_g158271 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_WindBaseTex, sampler_Linear_Clamp, temp_output_75_0_g158271,temp_output_82_0_g158271, 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_WindNearTex, sampler_Linear_Repeat, temp_output_119_0_g158271,temp_output_82_0_g158271, 0.0 ) , saturate( ( ( saturate( ( distance( Input_Position180_g158271 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g158276 ) / temp_output_10_0_g158276 ) ));
				float4 temp_output_17_0_g158270 = lerpResult131_g158271;
				float4 temp_output_3_0_g158270 = TVE_WindParams;
				float4 ifLocalVar18_g158270 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g158270 >= 0.5 )
				ifLocalVar18_g158270 = temp_output_17_0_g158270;
				else
				ifLocalVar18_g158270 = temp_output_3_0_g158270;
				float4 lerpResult22_g158270 = lerp( temp_output_3_0_g158270 , temp_output_17_0_g158270 , temp_output_19_0_g158270);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g158270 = lerpResult22_g158270;
				#else
				float4 staticSwitch24_g158270 = ifLocalVar18_g158270;
				#endif
				float4 temp_output_610_0_g158267 = staticSwitch24_g158270;
				float3 appendResult643_g158267 = (float3((temp_output_610_0_g158267).rg , (temp_output_610_0_g158267).b));
				float3 lerpResult623_g158267 = lerp( appendResult566_g158267 , appendResult643_g158267 , (temp_output_610_0_g158267).a);
				#ifdef TVE_MOTION_WIND_ELEMENT
				float3 staticSwitch612_g158267 = lerpResult623_g158267;
				#else
				float3 staticSwitch612_g158267 = appendResult566_g158267;
				#endif
				float3 temp_output_1620_567_g158262 = staticSwitch612_g158267;
				half Base_Noise1590_g158262 = (temp_output_1620_567_g158262).z;
				float2 break83_g158266 = ((temp_output_1620_567_g158262).xy*2.0 + -1.0);
				float3 appendResult79_g158266 = (float3(break83_g158266.x , 0.0 , break83_g158266.y));
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				half2 Base_Direction893_g158262 = (( mul( GetWorldToObjectMatrix(), float4( appendResult79_g158266 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half Base_Intensity1615_g158262 = length( Base_Direction893_g158262 );
				half Flow_Delay1626_g158262 = _MotionDelayValue;
				float lerpResult1623_g158262 = lerp( 1.0 , ( Base_Intensity1615_g158262 * Base_Intensity1615_g158262 ) , Flow_Delay1626_g158262);
				#ifdef TVE_MOTION_BASE_BENDING
				float2 staticSwitch1573_g158262 = ( _MotionBaseIntensityValue * Base_Mask217_g158262 * Base_Noise1590_g158262 * Base_Direction893_g158262 * lerpResult1623_g158262 );
				#else
				float2 staticSwitch1573_g158262 = temp_cast_1;
				#endif
				half2 Base_Motion1440_g158262 = staticSwitch1573_g158262;
				half2 Final_RoationData1570_g158262 = Base_Motion1440_g158262;
				float4 In_RotationData16_g158264 = float4( Final_RoationData1570_g158262, 0.0 , 0.0 );
				Data16_g158264.Dummy = In_Dummy16_g158264;
				Data16_g158264.PositionOS = In_PositionOS16_g158264;
				Data16_g158264.PositionWS = In_PositionWS16_g158264;
				Data16_g158264.PositionWO = In_PositionWO16_g158264;
				Data16_g158264.PositionRawOS = In_PositionRawOS16_g158264;
				Data16_g158264.PositionAddOS = In_PositionAddOS16_g158264;
				Data16_g158264.PivotOS = In_PivotOS16_g158264;
				Data16_g158264.PivotWS = In_PivotWS16_g158264;
				Data16_g158264.PivotWO = In_PivotWO16_g158264;
				Data16_g158264.NormalOS = In_NormalOS16_g158264;
				Data16_g158264.NormalWS = In_NormalWS16_g158264;
				Data16_g158264.NormalRawOS = In_NormalRawOS16_g158264;
				Data16_g158264.NormalRawWS = In_NormalRawWS16_g158264;
				Data16_g158264.TangentOS = In_TangentOS16_g158264;
				Data16_g158264.ViewDirWS = In_ViewDirWS16_g158264;
				Data16_g158264.VertexData = In_VertexData16_g158264;
				Data16_g158264.MotionData = In_MotionData16_g158264;
				Data16_g158264.BoundsData = In_BoundsData16_g158264;
				Data16_g158264.RotationData = In_RotationData16_g158264;
				TVEModelData Data15_g158298 = Data16_g158264;
				float Out_Dummy15_g158298 = 0;
				float3 Out_PositionOS15_g158298 = float3( 0,0,0 );
				float3 Out_PositionWS15_g158298 = float3( 0,0,0 );
				float3 Out_PositionWO15_g158298 = float3( 0,0,0 );
				float3 Out_PositionRawOS15_g158298 = float3( 0,0,0 );
				float3 Out_PositionAddOS15_g158298 = float3( 0,0,0 );
				float3 Out_PivotOS15_g158298 = float3( 0,0,0 );
				float3 Out_PivotWS15_g158298 = float3( 0,0,0 );
				float3 Out_PivotWO15_g158298 = float3( 0,0,0 );
				float3 Out_NormalOS15_g158298 = float3( 0,0,0 );
				float3 Out_NormalWS15_g158298 = float3( 0,0,0 );
				float3 Out_NormalRawOS15_g158298 = float3( 0,0,0 );
				float3 Out_NormalRawWS15_g158298 = float3( 0,0,0 );
				float4 Out_TangentOS15_g158298 = float4( 0,0,0,0 );
				float3 Out_ViewDirWS15_g158298 = float3( 0,0,0 );
				float4 Out_VertexData15_g158298 = float4( 0,0,0,0 );
				float4 Out_MotionData15_g158298 = float4( 0,0,0,0 );
				float4 Out_BoundsData15_g158298 = float4( 0,0,0,0 );
				float4 Out_RotationData15_g158298 = float4( 0,0,0,0 );
				Out_Dummy15_g158298 = Data15_g158298.Dummy;
				Out_PositionOS15_g158298 = Data15_g158298.PositionOS;
				Out_PositionWS15_g158298 = Data15_g158298.PositionWS;
				Out_PositionWO15_g158298 = Data15_g158298.PositionWO;
				Out_PositionRawOS15_g158298 = Data15_g158298.PositionRawOS;
				Out_PositionAddOS15_g158298 = Data15_g158298.PositionAddOS;
				Out_PivotOS15_g158298 = Data15_g158298.PivotOS;
				Out_PivotWS15_g158298 = Data15_g158298.PivotWS;
				Out_PivotWO15_g158298 = Data15_g158298.PivotWO;
				Out_NormalOS15_g158298 = Data15_g158298.NormalOS;
				Out_NormalWS15_g158298 = Data15_g158298.NormalWS;
				Out_NormalRawOS15_g158298 = Data15_g158298.NormalRawOS;
				Out_NormalRawWS15_g158298 = Data15_g158298.NormalRawWS;
				Out_TangentOS15_g158298 = Data15_g158298.TangentOS;
				Out_ViewDirWS15_g158298 = Data15_g158298.ViewDirWS;
				Out_VertexData15_g158298 = Data15_g158298.VertexData;
				Out_MotionData15_g158298 = Data15_g158298.MotionData;
				Out_BoundsData15_g158298 = Data15_g158298.BoundsData;
				Out_RotationData15_g158298 = Data15_g158298.RotationData;
				half3 Model_PositionOS147_g158297 = Out_PositionOS15_g158298;
				half3 Input_False58_g158303 = Model_PositionOS147_g158297;
				half3 VertexPos40_g158300 = Model_PositionOS147_g158297;
				half3 VertexPos40_g158301 = VertexPos40_g158300;
				float3 appendResult74_g158301 = (float3(VertexPos40_g158301.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g158301 = appendResult74_g158301;
				float3 break84_g158301 = VertexPos40_g158301;
				float3 appendResult81_g158301 = (float3(0.0 , break84_g158301.y , break84_g158301.z));
				half3 VertexPosOtherAxis82_g158301 = appendResult81_g158301;
				float4 temp_output_1567_33_g158297 = Out_RotationData15_g158298;
				half4 Model_VertexBend1569_g158297 = temp_output_1567_33_g158297;
				half2 Angle44_g158300 = (Model_VertexBend1569_g158297).xy;
				half Angle44_g158301 = (Angle44_g158300).y;
				half3 VertexPos40_g158302 = ( VertexPosRotationAxis50_g158301 + ( VertexPosOtherAxis82_g158301 * cos( Angle44_g158301 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g158301 ) * sin( Angle44_g158301 ) ) );
				float3 appendResult74_g158302 = (float3(0.0 , 0.0 , VertexPos40_g158302.z));
				half3 VertexPosRotationAxis50_g158302 = appendResult74_g158302;
				float3 break84_g158302 = VertexPos40_g158302;
				float3 appendResult81_g158302 = (float3(break84_g158302.x , break84_g158302.y , 0.0));
				half3 VertexPosOtherAxis82_g158302 = appendResult81_g158302;
				half Angle44_g158302 = -(Angle44_g158300).x;
				half3 Input_True57_g158303 = ( VertexPosRotationAxis50_g158302 + ( VertexPosOtherAxis82_g158302 * cos( Angle44_g158302 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g158302 ) * sin( Angle44_g158302 ) ) );
				#ifdef TVE_MOTION_BASE_BENDING
				float3 staticSwitch65_g158303 = Input_True57_g158303;
				#else
				float3 staticSwitch65_g158303 = Input_False58_g158303;
				#endif
				#ifdef TVE_MOTION_PUSH_BENDING
				float3 staticSwitch67_g158303 = Input_True57_g158303;
				#else
				float3 staticSwitch67_g158303 = staticSwitch65_g158303;
				#endif
				#ifdef TVE_BLANKET_BENDING
				float3 staticSwitch69_g158303 = Input_True57_g158303;
				#else
				float3 staticSwitch69_g158303 = staticSwitch67_g158303;
				#endif
				float3 temp_output_1578_0_g158297 = staticSwitch69_g158303;
				float3 temp_output_1567_31_g158297 = Out_PositionAddOS15_g158298;
				half3 Model_PositionADD1568_g158297 = temp_output_1567_31_g158297;
				half3 Final_PositionOS178_g158297 = ( temp_output_1578_0_g158297 + Model_PositionADD1568_g158297 );
				float3 In_PositionOS16_g158299 = Final_PositionOS178_g158297;
				float3 In_PositionWS16_g158299 = Out_PositionWS15_g158298;
				float3 In_PositionWO16_g158299 = Out_PositionWO15_g158298;
				float3 In_PositionRawOS16_g158299 = Out_PositionRawOS15_g158298;
				float3 In_PositionAddOS16_g158299 = temp_output_1567_31_g158297;
				float3 In_PivotOS16_g158299 = Out_PivotOS15_g158298;
				float3 In_PivotWS16_g158299 = Out_PivotWS15_g158298;
				float3 In_PivotWO16_g158299 = Out_PivotWO15_g158298;
				float3 In_NormalOS16_g158299 = Out_NormalOS15_g158298;
				float3 In_NormalWS16_g158299 = Out_NormalWS15_g158298;
				float3 In_NormalRawOS16_g158299 = Out_NormalRawOS15_g158298;
				float3 In_NormalRawWS16_g158299 = Out_NormalRawWS15_g158298;
				float4 In_TangentOS16_g158299 = Out_TangentOS15_g158298;
				float3 In_ViewDirWS16_g158299 = Out_ViewDirWS15_g158298;
				float4 In_VertexData16_g158299 = Out_VertexData15_g158298;
				float4 In_MotionData16_g158299 = Out_MotionData15_g158298;
				float4 In_BoundsData16_g158299 = Out_BoundsData15_g158298;
				float4 In_RotationData16_g158299 = temp_output_1567_33_g158297;
				Data16_g158299.Dummy = In_Dummy16_g158299;
				Data16_g158299.PositionOS = In_PositionOS16_g158299;
				Data16_g158299.PositionWS = In_PositionWS16_g158299;
				Data16_g158299.PositionWO = In_PositionWO16_g158299;
				Data16_g158299.PositionRawOS = In_PositionRawOS16_g158299;
				Data16_g158299.PositionAddOS = In_PositionAddOS16_g158299;
				Data16_g158299.PivotOS = In_PivotOS16_g158299;
				Data16_g158299.PivotWS = In_PivotWS16_g158299;
				Data16_g158299.PivotWO = In_PivotWO16_g158299;
				Data16_g158299.NormalOS = In_NormalOS16_g158299;
				Data16_g158299.NormalWS = In_NormalWS16_g158299;
				Data16_g158299.NormalRawOS = In_NormalRawOS16_g158299;
				Data16_g158299.NormalRawWS = In_NormalRawWS16_g158299;
				Data16_g158299.TangentOS = In_TangentOS16_g158299;
				Data16_g158299.ViewDirWS = In_ViewDirWS16_g158299;
				Data16_g158299.VertexData = In_VertexData16_g158299;
				Data16_g158299.MotionData = In_MotionData16_g158299;
				Data16_g158299.BoundsData = In_BoundsData16_g158299;
				Data16_g158299.RotationData = In_RotationData16_g158299;
				TVEModelData Data15_g158319 = Data16_g158299;
				float Out_Dummy15_g158319 = 0;
				float3 Out_PositionOS15_g158319 = float3( 0,0,0 );
				float3 Out_PositionWS15_g158319 = float3( 0,0,0 );
				float3 Out_PositionWO15_g158319 = float3( 0,0,0 );
				float3 Out_PositionRawOS15_g158319 = float3( 0,0,0 );
				float3 Out_PositionAddOS15_g158319 = float3( 0,0,0 );
				float3 Out_PivotOS15_g158319 = float3( 0,0,0 );
				float3 Out_PivotWS15_g158319 = float3( 0,0,0 );
				float3 Out_PivotWO15_g158319 = float3( 0,0,0 );
				float3 Out_NormalOS15_g158319 = float3( 0,0,0 );
				float3 Out_NormalWS15_g158319 = float3( 0,0,0 );
				float3 Out_NormalRawOS15_g158319 = float3( 0,0,0 );
				float3 Out_NormalRawWS15_g158319 = float3( 0,0,0 );
				float4 Out_TangentOS15_g158319 = float4( 0,0,0,0 );
				float3 Out_ViewDirWS15_g158319 = float3( 0,0,0 );
				float4 Out_VertexData15_g158319 = float4( 0,0,0,0 );
				float4 Out_MotionData15_g158319 = float4( 0,0,0,0 );
				float4 Out_BoundsData15_g158319 = float4( 0,0,0,0 );
				float4 Out_RotationData15_g158319 = float4( 0,0,0,0 );
				Out_Dummy15_g158319 = Data15_g158319.Dummy;
				Out_PositionOS15_g158319 = Data15_g158319.PositionOS;
				Out_PositionWS15_g158319 = Data15_g158319.PositionWS;
				Out_PositionWO15_g158319 = Data15_g158319.PositionWO;
				Out_PositionRawOS15_g158319 = Data15_g158319.PositionRawOS;
				Out_PositionAddOS15_g158319 = Data15_g158319.PositionAddOS;
				Out_PivotOS15_g158319 = Data15_g158319.PivotOS;
				Out_PivotWS15_g158319 = Data15_g158319.PivotWS;
				Out_PivotWO15_g158319 = Data15_g158319.PivotWO;
				Out_NormalOS15_g158319 = Data15_g158319.NormalOS;
				Out_NormalWS15_g158319 = Data15_g158319.NormalWS;
				Out_NormalRawOS15_g158319 = Data15_g158319.NormalRawOS;
				Out_NormalRawWS15_g158319 = Data15_g158319.NormalRawWS;
				Out_TangentOS15_g158319 = Data15_g158319.TangentOS;
				Out_ViewDirWS15_g158319 = Data15_g158319.ViewDirWS;
				Out_VertexData15_g158319 = Data15_g158319.VertexData;
				Out_MotionData15_g158319 = Data15_g158319.MotionData;
				Out_BoundsData15_g158319 = Data15_g158319.BoundsData;
				Out_RotationData15_g158319 = Data15_g158319.RotationData;
				float3 temp_output_31_0_g158312 = Out_PositionOS15_g158319;
				float3 temp_output_6_0_g158326 = ( ( temp_output_31_0_g158312 - Out_PositionRawOS15_g158319 ) + _DisableSRPBatcher );
				half4 Dummy_Data505 = ( ( ( _VariationLiteInfo + _VariationColoring ) + ( _VariationCategory + _VariationEnd ) + ( _VariationIntensityValue + _VariationColorTwo + _VariationColorOne ) + ( _VariationMultiValue + _VariationNoiseRemap + _VariationNoisePivotsValue1 + _VariationNoiseTillingValue ) ) + ( ( _TintingLiteInfo + _TintingColoring ) + ( _TintingCategory + _TintingEnd + _TintingSpace + 0.0 + _TintingElementMode ) + ( _TintingIntensityValue + _TintingColor + _TintingGrayValue ) + ( _TintingMultiValue + _TintingLumaValue + _TintingLumaRemap ) + 0.0 + 0.0 ) + ( ( _DrynessLiteInfo + _DrynessColoring ) + ( _DrynessCategory + _DrynessEnd + _DrynessSpace + _DrynessElementMode + 0.0 ) + ( _DrynessIntensityValue + _DrynessColor + _DrynessGrayValue + _DrynessShiftValue + _DrynessSmoothnessValue + _DrynessSubsurfaceValue ) + ( _DrynessMultiValue + _DrynessLumaValue + _DrynessLumaRemap ) + 0.0 + 0.0 ) + ( ( _WetnessLiteInfo + _WetnessColoring ) + ( _WetnessCategory + _WetnessEnd + _WetnessElementMode + 0.0 ) + ( _WetnessIntensityValue + _WetnessContrastValue + _WetnessSmoothnessValue ) + float4( 0,0,0,0 ) + float4( 0,0,0,0 ) ) + ( ( _CutoutLiteInfo + _CutoutColoring ) + ( _CutoutCategory + _CutoutEnd + _CutoutSpace + _CutoutElementMode + 0.0 ) + ( _CutoutIntensityValue + _CutoutShadowMode ) + ( _CutoutMultiValue + _CutoutAlphaValue + _CutoutNoiseValue + _CutoutNoiseTillingValue ) + 0.0 ) + ( ( _DitherLiteInfo + _DitherColoring ) + ( _DitherCategory + _DitherEnd ) + ( _DitherConstantValue + 0.0 + 0.0 + ( _DitherDistanceValue + _DitherDistanceMaxValue + _DitherDistanceMinValue ) + _DitherShadowMode ) + ( _DitherMultiValue + _DitherNoiseTillingValue ) ) + ( ( _SizeFadeLiteInfo + _SizeFadeColoring ) + ( _SizeFadeCategory + _SizeFadeEnd + _SizeFadeElementMode ) + ( _SizeFadeIntensityValue + _SizeFadeScaleMode + _SizeFadeScaleValue + _SizeFadeDistMinValue + _SizeFadeDistMaxValue ) ) );
				#ifdef TVE_REGISTER
				float4 staticSwitch14_g158326 = ( float4( temp_output_6_0_g158326 , 0.0 ) + ( Dummy_Data505 * float4( 0,0,0,0 ) ) );
				#else
				float4 staticSwitch14_g158326 = float4( temp_output_6_0_g158326 , 0.0 );
				#endif
				
				inputMesh.positionOS.xyz += staticSwitch14_g158326.rgb;

				float3 positionRWS = TransformObjectToWorld(inputMesh.positionOS.xyz);
				outputPackedVaryingsMeshToPS.positionCS = TransformWorldToHClip(positionRWS);
				outputPackedVaryingsMeshToPS.interp00.xyz = positionRWS;
				return outputPackedVaryingsMeshToPS;
			}

			void Frag(  PackedVaryingsMeshToPS packedInput
				#ifdef WRITE_NORMAL_BUFFER
				, out float4 outNormalBuffer : SV_Target0
					#ifdef WRITE_MSAA_DEPTH
				, out float1 depthColor : SV_Target1
					#endif
				#endif
				, out float outputDepth : SV_Depth
				
			)
			{
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( packedInput );
				UNITY_SETUP_INSTANCE_ID( packedInput );

				#ifdef LOD_FADE_CROSSFADE
				float3 VC = GetWorldSpaceNormalizeViewDir(packedInput.interp00.xyz);
				LODDitheringTransition(ComputeFadeMaskSeed(VC, packedInput.positionCS.xy), unity_LODFade.x);
				#endif

				FragInputs input;

				ZERO_INITIALIZE(FragInputs, input);
				AlphaSurfaceDescription surfaceDescription = (AlphaSurfaceDescription)0;
				SurfaceOutput o = (SurfaceOutput)0;

				o.Normal = float3( 0, 0, 1 );
				float4 positionCS = 0;
				float3 positionWS = 0;

				

				surfaceDescription.Alpha = 1;

				#ifdef _ALPHATEST_ON
				surfaceDescription.AlphaClipThreshold = 0;
				#endif

				packedInput.positionCS.zw = positionCS.zw;
				float3 positionRWS = positionWS;

				input.positionSS = packedInput.positionCS;
				input.positionRWS = positionRWS;
				//#if defined( ASE_SRP_VERSION ) && ASE_SRP_VERSION < 60900
				//input.worldToTangent = k_identity3x3;
				//#else
				input.tangentToWorld = k_identity3x3;
				//#endif

				PositionInputs posInput = GetPositionInput( input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS );

				SurfaceData surfaceData;
				BuiltinData builtinData;

				float3 normalizedWorldViewDir = GetWorldSpaceNormalizeViewDir( input.positionRWS );

				GetSurfaceAndBuiltinData(surfaceDescription, input, normalizedWorldViewDir, posInput, surfaceData, builtinData);

				outputDepth = posInput.deviceDepth;

				#ifdef WRITE_NORMAL_BUFFER
					EncodeIntoNormalBuffer(ConvertSurfaceDataToNormalData(surfaceData), posInput.positionSS, outNormalBuffer);
					#ifdef WRITE_MSAA_DEPTH
					depthColor = packedInput.positionCS.z;
					#endif
				#endif
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "DepthOnly"
			Tags { "LightMode"="DepthOnly" }

			HLSLPROGRAM
			#pragma shader_feature_local_fragment _DISABLE_DECALS
			#pragma shader_feature_local_fragment _DISABLE_SSR
			#define _MATERIAL_FEATURE_TRANSMISSION 1
			#define ASE_SRP_VERSION 140011
			#ifdef UNITY_COLORSPACE_GAMMA//AI_SRP
			#define unity_ColorSpaceDielectricSpec half4(0.220916301, 0.220916301, 0.220916301, 1.0 - 0.220916301)//AI_SRP
			#else//AI_SRP
			#define unity_ColorSpaceDielectricSpec half4(0.04, 0.04, 0.04, 1.0 - 0.04) //AI_SRP
			#endif//AI_SRP
			#define ASE_USING_SAMPLING_MACROS 1

			#pragma vertex Vert
			#pragma fragment Frag

			#if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define OUTPUT_SPLIT_LIGHTING
			#endif

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			//#if defined( ASE_SRP_VERSION ) && ASE_SRP_VERSION < 60900
			//#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Wind.hlsl"
			//#endif
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"

			#define SHADERPASS SHADERPASS_DEPTH_ONLY
			#pragma multi_compile _ WRITE_NORMAL_BUFFER
			#pragma multi_compile _ WRITE_MSAA_DEPTH

			#define VARYINGS_NEED_POSITION_WS
			#define VARYINGS_NEED_TANGENT_TO_WORLD
			#define VARYINGS_NEED_TEXCOORD0
			#define VARYINGS_NEED_TEXCOORD1
			#define VARYINGS_NEED_TEXCOORD2
			#define VARYINGS_NEED_TEXCOORD3
			#define VARYINGS_NEED_COLOR

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"

			//#if defined( ASE_SRP_VERSION ) && ASE_SRP_VERSION < 60900
			//#define T2W(var, index) var.worldToTangent[index]
			//#else
			#define T2W(var, index) var.tangentToWorld[index]
			//#endif

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/CommonLighting.hlsl"
			#define ai_ObjectToWorld GetObjectToWorldMatrix()
			#define ai_WorldToObject GetWorldToObjectMatrix()
			#define AI_INV_TWO_PI  INV_TWO_PI
			#define AI_PI          PI
			#define AI_INV_PI      INV_PI
			#define ASE_NEEDS_VERT_NORMAL
			#pragma shader_feature_local_fragment TVE_PIPELINE_STANDARD TVE_PIPELINE_UNIVERSAL TVE_PIPELINE_HD
			#pragma shader_feature_local_vertex TVE_MOTION_BASE_BENDING
			#pragma shader_feature_local_vertex TVE_MOTION_WIND_ELEMENT
			#pragma shader_feature_local_fragment TVE_OVERLAY
			#pragma shader_feature_local_fragment TVE_OVERLAY_ELEMENT
			#pragma shader_feature_local_fragment TVE_EMISSIVE
			#pragma shader_feature_local_fragment TVE_EMISSIVE_ELEMENT
			#pragma shader_feature_local_fragment TVE_SUBSURFACE
			#pragma shader_feature_local_fragment TVE_SUBSURFACE_ELEMENT
			  
			struct TVEVisualData
			{  
				half Dummy;  
				half3 Albedo;
				half2 NormalTS;
				half3 NormalWS; 
				half4 Shader;
				half4 Emissive;
				half AlphaClip;
				half AlphaFade;
				half MultiMask;
				half Grayscale;
				half Luminosity;
				half3 Translucency;
				half Transmission;
				half Thickness;
				float Diffusion;
			};  
			    
			struct TVEModelData
			{    
				half Dummy;    
				half3 PositionOS;
				half3 PositionWS;
				half3 PositionWO;
				half3 PositionRawOS;
				half3 PositionAddOS;
				half3 PivotOS;
				half3 PivotWS;
				half3 PivotWO;
				half3 NormalOS;
				half3 NormalWS;
				half3 NormalRawOS;
				half3 NormalRawWS;
				half4 TangentOS;
				half3 ViewDirWS;
				half4 VertexData;
				half4 MotionData;
				half4 BoundsData;
				half4 RotationData;
			};    
			      
			struct TVEGlobalData
			{      
				half Dummy;      
				half4 CoatParams;
				half4 PaintParams;
				half4 GlowParams;
				half4 AtmoParams;
				half4 FadeParams;
				half4 FormParams;
				half4 LandParams;
				half4 WindParams;
				half4 PushParams;
			};      
			        
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END
			//#pragma editor_sync_compilation


			struct AttributesMesh
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 texcoord : TEXCOORD0;
				float4 uv1 : TEXCOORD1;
				float4 uv2 : TEXCOORD2;
				float4 uv3 : TEXCOORD3;
				float4 color : COLOR;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryingsMeshToPS
			{
				float4 positionCS : SV_Position;
				float3 interp00 : TEXCOORD0;
				float3 interp01 : TEXCOORD1;
				float4 interp02 : TEXCOORD2;
				float4 interp03 : TEXCOORD3;
				float4 interp04 : TEXCOORD4;
				float4 interp05 : TEXCOORD5;
				float4 interp06 : TEXCOORD6;
				float4 interp07 : TEXCOORD7;
				float4 UVsFrame122_g156549 : TEXCOORD8;
				float4 UVsFrame222_g156549 : TEXCOORD9;
				float4 UVsFrame322_g156549 : TEXCOORD10;
				float4 octaframe22_g156549 : TEXCOORD11;
				float4 viewPos22_g156549 : TEXCOORD12;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START( UnityPerMaterial )
			float4 _DrynessColor;
			half4 _ImpostorColor;
			half4 _ImpostorColorTwo;
			float4 _OverlayGlitterTex_ST;
			half4 _InteractionColoring;
			float4 _AI_SizeOffset;
			half4 _SizeFadeColoring;
			half4 _VariationColoring;
			half4 _VariationColorTwo;
			half4 _VariationColorOne;
			half4 _VariationNoiseRemap;
			half4 _DitherColoring;
			half4 _TintingColoring;
			float4 _TintingColor;
			half4 _TintingLumaRemap;
			half4 _DrynessColoring;
			half4 _CutoutColoring;
			half4 _WetnessColoring;
			half4 _OverlayColor;
			half4 _OverlayProjRemap;
			half4 _DrynessLumaRemap;
			half4 _OverlayLumaRemap;
			half4 _OverlayColoringOn;
			half4 _OverlayColoringOff;
			half4 _SubsurfaceColor;
			half4 _OverlayGlitterColor;
			half4 _EmissiveColor;
			float4 _SubsurfaceDiffusion_Asset;
			half4 _OverlayBlendRemap1;
			float3 _AI_Offset;
			half _GlobalEnd;
			half _CutoutMultiValue;
			half _CutoutAlphaValue;
			half _CutoutNoiseValue;
			half _CutoutNoiseTillingValue;
			half _DitherLiteInfo;
			half _ImpostorMetallicValue;
			half _EmissiveExposureValue;
			float _emissive_power_value;
			half _DitherEnd;
			half _ImpostorColorMode;
			half _DitherConstantValue;
			half _EmissiveIntensityValue;
			half _GlobalLiteInfo;
			half _DitherDistanceValue;
			half _DitherCategory;
			half _DitherDistanceMaxValue;
			half _CutoutShadowMode;
			half _CutoutElementMode;
			half _OverlayIntensityValue;
			half _WetnessCategory;
			half _WetnessEnd;
			half _WetnessElementMode;
			half _WetnessIntensityValue;
			half _WetnessContrastValue;
			half _CutoutIntensityValue;
			half _WetnessSmoothnessValue;
			half _OverlayLumaValue;
			half _CutoutCategory;
			half _CutoutEnd;
			half _SubsurfaceIntensityValue;
			half _CutoutSpace;
			half _ImpostorSmoothnessValue;
			half _CutoutLiteInfo;
			half _OverlayGlitterDistValue;
			half _DitherDistanceMinValue;
			half _DitherShadowMode;
			half _SubsurfaceAmbientValue;
			half _SubsurfaceShadowValue;
			half _SubsurfaceElementMode;
			half _EmissiveCategory;
			half _GlobalCategory;
			half _EmissiveEnd;
			half _SubsurfaceNormalValue;
			half _EmissivePowerMode;
			half _EmissiveElementMode;
			half _OverlayCategory;
			half _OverlayEnd;
			half _OverlaySpace;
			half _OverlayElementMode;
			half _OverlayBakeInfo;
			half _EmissivePowerValue;
			half _OverlaySubsurfaceValue;
			half _SubsurfaceDirectValue;
			half _SubsurfaceCategory;
			half _DitherMultiValue;
			half _DitherNoiseTillingValue;
			half _OverlayProjValue;
			half _OverlaySmoothnessValue;
			half _SizeFadeCategory;
			half _SizeFadeEnd;
			half _SubsurfaceEnd;
			half _SizeFadeElementMode;
			half _SizeFadeScaleMode;
			half _SizeFadeScaleValue;
			half _SizeFadeDistMinValue;
			half _OverlayNormalValue;
			half _WetnessLiteInfo;
			half _SizeFadeDistMaxValue;
			half _SizeFadeIntensityValue;
			half _SizeFadeLiteInfo;
			half _ImpostorAlphaClipValue;
			half _DrynessMultiValue;
			half _RenderMotion;
			half _RenderShadow;
			half _ImpostorCategory;
			half _IsImpostorShader;
			half _IsSubsurfaceShader;
			half _IsLiteShader;
			half _ImpostorEnd;
			half _MotionWindCategory;
			half _MotionWindEnd;
			half _MotionWindElementMode;
			half _MotionInteractionCategory;
			half _MotionInteractionEnd;
			half _InteractionLiteInfo;
			half _MotionPushIntensityValue;
			half _MotionPushPivotValue;
			half _MotionPushMaskValue;
			half _MotionPushElementMode;
			half _IsIdentifier;
			half _IsConverted;
			half _IsCollected;
			half _HasDefaultTextures;
			half _OverlayGlitterTillingValue;
			half _OverlayGlitterIntensityValue;
			half _OverlayLiteInfo;
			half _SubsurfaceScatteringValue;
			half _SubsurfaceAngleValue;
			float _SubsurfaceDiffusion;
			half _SubsurfaceSpace;
			half _IsVersion;
			float _AI_Frames;
			half _RenderDecals;
			half _CategoryRender;
			half _EndRender;
			half _NoiseCategory;
			half _NoiseEnd;
			half _IsInitialized;
			half _IsTVEShader;
			half _IsCustomShader;
			half _IsShared;
			half _RenderSSR;
			half _DrynessLumaValue;
			float _AI_FramesX;
			float _AI_ImpostorSize;
			half _TintingSpace;
			half _TintingElementMode;
			half _TintingIntensityValue;
			half _TintingGrayValue;
			half _TintingMultiValue;
			half _TintingLumaValue;
			half _DrynessLiteInfo;
			half _DrynessCategory;
			half _DrynessEnd;
			half _DrynessSpace;
			half _DrynessElementMode;
			half _DrynessIntensityValue;
			half _SubsurfaceMultiValue;
			half _DrynessGrayValue;
			half _DrynessShiftValue;
			half _DrynessSmoothnessValue;
			half _DrynessSubsurfaceValue;
			half _TintingEnd;
			half _TintingCategory;
			half _TintingLiteInfo;
			half _VariationNoiseTillingValue;
			float _AI_Parallax;
			float _AI_TextureBias;
			float _AI_DepthSize;
			float _AI_ShadowBias;
			float _AI_ShadowView;
			float _AI_Clip;
			half _MotionBaseIntensityValue;
			half _MotionBasePivotValue;
			float _AI_FramesY;
			half _MotionTillingValue;
			half _global_wind_layer_value;
			half _MotionDelayValue;
			half _VariationLiteInfo;
			half _VariationCategory;
			half _VariationEnd;
			half _VariationIntensityValue;
			half _VariationMultiValue;
			half _VariationNoisePivotsValue1;
			half _MotionIntensityValue;
			half _SubsurfaceThicknessValue;
			float _BlendMode;
			CBUFFER_END

			TEXTURE2D(_OverlayGlitterTex);
			SAMPLER(sampler_OverlayGlitterTex);
			TEXTURE3D(_NoiseTex3D);
			SAMPLER(sampler_NoiseTex3D);
			float4x4 unity_CameraProjection;
			float4x4 unity_CameraInvProjection;
			float4x4 unity_WorldToCamera;
			float4x4 unity_CameraToWorld;
			TEXTURE2D(_Albedo);
			SAMPLER(sampler_Albedo);
			TEXTURE2D(_Normals);
			SAMPLER(sampler_Normals);
			float3 TVE_WorldOrigin;
			TEXTURE2D(_MotionNoiseTex);
			SAMPLER(sampler_Linear_Repeat);
			float TVE_WindLayers[10];
			TEXTURE2D_ARRAY(TVE_WindBaseTex);
			half4 TVE_RenderBaseCoords;
			SAMPLER(sampler_Linear_Clamp);
			TEXTURE2D_ARRAY(TVE_WindNearTex);
			half4 TVE_RenderNearCoords;
			float4 TVE_RenderNearPositionR;
			half TVE_RenderNearFadeValue;
			half4 TVE_WindParams;
			half _DisableSRPBatcher;
			TEXTURE2D(_MasksA);
			TEXTURE2D(_MasksB);
			SAMPLER(sampler_MasksA);
			SAMPLER(sampler_MasksB);
			half4 TVE_CoatParams;
			half4 TVE_PaintParams;
			half4 TVE_GlowParams;
			half4 TVE_AtmoParams;
			half4 TVE_FormParams;
			half4 TVE_PushParams;
			half TVE_IsEnabled;


			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"

			float2 VectortoOctahedron( float3 N )
			{
				N /= dot( 1.0, abs( N ) );
				if( N.z <= 0 )
				{
				N.xy = ( 1 - abs( N.yx ) ) * ( N.xy >= 0 ? 1.0 : -1.0 );
				}
				return N.xy;
			}
			
			float3 OctahedronToVector( float2 Oct )
			{
				float3 N = float3( Oct, 1.0 - dot( 1.0, abs( Oct ) ) );
				if(N.z< 0 )
				{
				N.xy = ( 1 - abs( N.yx) ) * (N.xy >= 0 ? 1.0 : -1.0 );
				}
				return normalize( N);
			}
			
			inline void RayPlaneIntersectionUV( float3 normalOS, float3 rayPosition, float3 rayDirection, inout float2 uvs, inout float3 localNormal )
			{
				float lDotN = dot( rayDirection, normalOS ); 
				float p0l0DotN = dot( -rayPosition, normalOS );
				float t = p0l0DotN / lDotN;
				float3 p = rayDirection * t + rayPosition;
				float3 upVector = float3( 0, 1, 0 );
				float3 tangent = normalize( cross( upVector, normalOS ) + float3( -0.001, 0, 0 ) );
				float3 bitangent = cross( tangent, normalOS );
				float frameX = dot( p, tangent );
				float frameZ = dot( p, bitangent );
				uvs = -float2( frameX, frameZ );
				if( t <= 0.0 )
				uvs = 0;
				float3x3 worldToLocal = float3x3( tangent, bitangent, normalOS );
				localNormal = normalize( mul( worldToLocal, rayDirection ) );
			}
			
			inline void OctaImpostorVertex( inout float4 positionOS, inout float3 normalOS, inout float4 uvsFrame1, inout float4 uvsFrame2, inout float4 uvsFrame3, inout float4 octaFrame, inout float4 viewPos )
			{
				float2 uvOffset = _AI_SizeOffset.zw;
				float parallax = -_AI_Parallax; 
				float UVscale = _AI_ImpostorSize;
				float framesXY = _AI_Frames;
				float prevFrame = framesXY - 1;
				float3 fractions = 1.0 / float3( framesXY, prevFrame, UVscale );
				float fractionsFrame = fractions.x;
				float fractionsPrevFrame = fractions.y;
				float fractionsUVscale = fractions.z;
				float3 worldCameraPos;
				#if defined(UNITY_PASS_SHADOWCASTER)
				float3 worldOrigin = 0;
				float4 perspective = float4( 0, 0, 0, 1 );
				if ( UNITY_MATRIX_P[ 3 ][ 3 ] == 1 )
				{
				perspective = float4( 0, 0, 5000, 0 );
				worldOrigin = ai_ObjectToWorld._m03_m13_m23;
				}
				worldCameraPos = worldOrigin + mul( UNITY_MATRIX_I_V, perspective ).xyz;
				#else
				if ( UNITY_MATRIX_P[ 3 ][ 3 ] == 1 )
				{
				worldCameraPos = ai_ObjectToWorld._m03_m13_m23 + UNITY_MATRIX_I_V._m02_m12_m22 * 5000;
				}
				else
				{
				worldCameraPos = GetCameraRelativePositionWS( _WorldSpaceCameraPos );
				}
				#endif
				float3 objectCameraPosition = mul( ai_WorldToObject, float4( worldCameraPos, 1 ) ).xyz - _AI_Offset.xyz; 
				float3 objectCameraDirection = normalize( objectCameraPosition );
				float3 upVector = float3( 0,1,0 );
				float3 objectHorizontalVector = normalize( cross( objectCameraDirection, upVector ) );
				float3 objectVerticalVector = cross( objectHorizontalVector, objectCameraDirection );
				float2 uvExpansion = positionOS.xy;
				float3 billboard = objectHorizontalVector * uvExpansion.x + objectVerticalVector * uvExpansion.y;
				float3 localDir = billboard - objectCameraPosition; 
				objectCameraDirection = trunc( objectCameraDirection * 65536.0 ) / 65536.0;
				float2 frameOcta = VectortoOctahedron( objectCameraDirection.xzy ) * 0.5 + 0.5;
				float2 prevOctaFrame = frameOcta * prevFrame;
				float2 baseOctaFrame = floor( prevOctaFrame );
				float2 fractionOctaFrame = ( baseOctaFrame * fractionsFrame );
				float2 octaFrame1 = ( baseOctaFrame * fractionsPrevFrame ) * 2.0 - 1.0;
				float3 octa1WorldY = OctahedronToVector( octaFrame1 ).xzy;
				float3 octa1LocalY;
				float2 uvFrame1;
				RayPlaneIntersectionUV( octa1WorldY, objectCameraPosition, localDir, /*inout*/ uvFrame1, /*inout*/ octa1LocalY );
				float2 uvParallax1 = octa1LocalY.xy * fractionsFrame * parallax;
				uvFrame1 = ( uvFrame1 * fractionsUVscale + 0.5 ) * fractionsFrame + fractionOctaFrame;
				uvsFrame1 = float4( uvParallax1, uvFrame1) - float4( 0, 0, uvOffset );
				float2 fractPrevOctaFrame = frac( prevOctaFrame );
				float2 cornerDifference = lerp( float2( 0,1 ) , float2( 1,0 ) , saturate( ceil( ( fractPrevOctaFrame.x - fractPrevOctaFrame.y ) ) ));
				float2 octaFrame2 = ( ( baseOctaFrame + cornerDifference ) * fractionsPrevFrame ) * 2.0 - 1.0;
				float3 octa2WorldY = OctahedronToVector( octaFrame2 ).xzy;
				float3 octa2LocalY;
				float2 uvFrame2;
				RayPlaneIntersectionUV( octa2WorldY, objectCameraPosition, localDir, /*inout*/ uvFrame2, /*inout*/ octa2LocalY );
				float2 uvParallax2 = octa2LocalY.xy * fractionsFrame * parallax;
				uvFrame2 = ( uvFrame2 * fractionsUVscale + 0.5 ) * fractionsFrame + ( ( cornerDifference * fractionsFrame ) + fractionOctaFrame );
				uvsFrame2 = float4( uvParallax2, uvFrame2) - float4( 0, 0, uvOffset );
				float2 octaFrame3 = ( ( baseOctaFrame + 1 ) * fractionsPrevFrame  ) * 2.0 - 1.0;
				float3 octa3WorldY = OctahedronToVector( octaFrame3 ).xzy;
				float3 octa3LocalY;
				float2 uvFrame3;
				RayPlaneIntersectionUV( octa3WorldY, objectCameraPosition, localDir, /*inout*/ uvFrame3, /*inout*/ octa3LocalY );
				float2 uvParallax3 = octa3LocalY.xy * fractionsFrame * parallax;
				uvFrame3 = ( uvFrame3 * fractionsUVscale + 0.5 ) * fractionsFrame + ( fractionOctaFrame + fractionsFrame );
				uvsFrame3 = float4( uvParallax3, uvFrame3) - float4( 0, 0, uvOffset );
				octaFrame = 0;
				octaFrame.xy = prevOctaFrame;
				octaFrame.zw = fractionOctaFrame;
				positionOS.xyz = billboard + _AI_Offset.xyz;
				normalOS.xyz = objectCameraDirection;
				viewPos = 0;
				viewPos.xyz = TransformWorldToView( TransformObjectToWorld( positionOS.xyz ) );
			}
			
			float3 ObjectPosition_UNITY_MATRIX_M(  )
			{
				return float3(UNITY_MATRIX_M[0].w, UNITY_MATRIX_M[1].w, UNITY_MATRIX_M[2].w );
			}
			
			inline void OctaImpostorFragment( inout SurfaceOutput o, out float4 positionCS, out float3 positionWS, float4 uvsFrame1, float4 uvsFrame2, float4 uvsFrame3, float4 octaFrame, float4 interpViewPos, out float4 output0, out float4 output1 )
			{
				float depthBias = -1.0;
				float textureBias = _AI_TextureBias;
				float2 fraction = frac( octaFrame.xy );
				float2 invFraction = 1 - fraction;
				float3 weights;
				weights.x = min( invFraction.x, invFraction.y );
				weights.y = abs( fraction.x - fraction.y );
				weights.z = min( fraction.x, fraction.y );
				float4 parallaxSample1 = SAMPLE_TEXTURE2D_BIAS( _Normals, sampler_Normals, uvsFrame1.zw, depthBias );
				float2 parallax1 = ( ( 0.5 - parallaxSample1.a ) * uvsFrame1.xy ) + uvsFrame1.zw;
				float4 parallaxSample2 = SAMPLE_TEXTURE2D_BIAS( _Normals, sampler_Normals, uvsFrame2.zw, depthBias );
				float2 parallax2 = ( ( 0.5 - parallaxSample2.a ) * uvsFrame2.xy ) + uvsFrame2.zw;
				float4 parallaxSample3 = SAMPLE_TEXTURE2D_BIAS( _Normals, sampler_Normals, uvsFrame3.zw, depthBias );
				float2 parallax3 = ( ( 0.5 - parallaxSample3.a ) * uvsFrame3.xy ) + uvsFrame3.zw;
				float4 albedo1 = SAMPLE_TEXTURE2D_BIAS( _Albedo, sampler_Albedo, parallax1, textureBias );
				float4 albedo2 = SAMPLE_TEXTURE2D_BIAS( _Albedo, sampler_Albedo, parallax2, textureBias );
				float4 albedo3 = SAMPLE_TEXTURE2D_BIAS( _Albedo, sampler_Albedo, parallax3, textureBias );
				float4 blendedAlbedo = albedo1 * weights.x + albedo2 * weights.y + albedo3 * weights.z;
				o.Alpha = ( blendedAlbedo.a - _AI_Clip );
				clip( o.Alpha );
				float t = ceil( fraction.x - fraction.y );
				float4 cornerDifference = float4( t, 1 - t, 1, 1 );
				float2 step_1 = ( parallax1 - octaFrame.zw ) * _AI_Frames;
				float4 step23 = ( float4( parallax2, parallax3 ) -  octaFrame.zwzw ) * _AI_Frames - cornerDifference;
				step_1 = step_1 * (1-step_1);
				step23 = step23 * (1-step23);
				float3 steps;
				steps.x = step_1.x * step_1.y;
				steps.y = step23.x * step23.y;
				steps.z = step23.z * step23.w;
				steps = step(-steps, 0);
				float final = dot( steps, weights );
				clip( final - 0.5 );
				o.Albedo = blendedAlbedo.rgb;
				#if defined(AI_HD_RENDERPIPELINE)
				float4 feat1 = _Features.SampleLevel( SamplerState_Point_Repeat, parallax1, 0);
				o.Diffusion = feat1.rgb;
				o.Features = feat1.a;
				float4 test1 = _Specular.SampleLevel( SamplerState_Point_Repeat, parallax1, 0);
				o.MetalTangent = test1.b;
				#endif
				float4 normals1 = SAMPLE_TEXTURE2D_BIAS( _Normals, sampler_Normals, parallax1, textureBias );
				float4 normals2 = SAMPLE_TEXTURE2D_BIAS( _Normals, sampler_Normals, parallax2, textureBias );
				float4 normals3 = SAMPLE_TEXTURE2D_BIAS( _Normals, sampler_Normals, parallax3, textureBias );
				float4 blendedNormal = normals1 * weights.x  + normals2 * weights.y + normals3 * weights.z;
				float4 output0a = SAMPLE_TEXTURE2D_BIAS( _MasksA, sampler_MasksA, parallax1, textureBias );
				float4 output0b = SAMPLE_TEXTURE2D_BIAS( _MasksA, sampler_MasksA, parallax2, textureBias );
				float4 output0c = SAMPLE_TEXTURE2D_BIAS( _MasksA, sampler_MasksA, parallax3, textureBias );
				output0 = output0a * weights.x  + output0b * weights.y + output0c * weights.z; 
				float4 output1a = SAMPLE_TEXTURE2D_BIAS( _MasksB, sampler_MasksB, parallax1, textureBias );
				float4 output1b = SAMPLE_TEXTURE2D_BIAS( _MasksB, sampler_MasksB, parallax2, textureBias );
				float4 output1c = SAMPLE_TEXTURE2D_BIAS( _MasksB, sampler_MasksB, parallax3, textureBias );
				output1 = output1a * weights.x  + output1b * weights.y + output1c * weights.z; 
				float3 localNormal = blendedNormal.rgb * 2.0 - 1.0;
				float3 worldNormal = normalize( mul( (float3x3)ai_ObjectToWorld, localNormal ) );
				o.Normal = worldNormal;
				float3 viewPos = interpViewPos.xyz;
				float depthOffset = ( ( parallaxSample1.a * weights.x + parallaxSample2.a * weights.y + parallaxSample3.a * weights.z ) - 0.5 /** 2.0 - 1.0*/ ) /** 0.5*/ * _AI_DepthSize * length( ai_ObjectToWorld[ 2 ].xyz );
				#if ( defined(SHADERPASS) && ((defined(SHADERPASS_SHADOWS) && SHADERPASS == SHADERPASS_SHADOWS) || (defined(SHADERPASS_SHADOWCASTER) && SHADERPASS == SHADERPASS_SHADOWCASTER)) ) || defined(UNITY_PASS_SHADOWCASTER)
				viewPos.z += depthOffset * _AI_ShadowView;
				viewPos.z += -_AI_ShadowBias;
				#else 
				viewPos.z += depthOffset;
				#endif
				positionWS = mul( UNITY_MATRIX_I_V, float4( viewPos.xyz, 1 ) ).xyz;
				positionCS = mul( UNITY_MATRIX_P, float4( viewPos, 1 ) );
				#if defined(UNITY_PASS_SHADOWCASTER) && !defined(SHADERPASS)
				#if UNITY_REVERSED_Z
				positionCS.z = min( positionCS.z, positionCS.w * UNITY_NEAR_CLIP_VALUE );
				#else
				positionCS.z = max( positionCS.z, positionCS.w * UNITY_NEAR_CLIP_VALUE );
				#endif
				#endif
				positionCS.xyz /= positionCS.w;
				if( UNITY_NEAR_CLIP_VALUE < 0 )
				positionCS = positionCS * 0.5 + 0.5;
			}
			
			float3 ASEGetEmissionHDRColor(float3 ldrColor, float luminanceIntensity, float exposureWeight, float inverseCurrentExposureMultiplier)
			{
				float3 hdrColor = ldrColor * luminanceIntensity;
				hdrColor = lerp( hdrColor* inverseCurrentExposureMultiplier, hdrColor, exposureWeight);
				return hdrColor;
			}
			

			void BuildSurfaceData(FragInputs fragInputs, inout SmoothSurfaceDescription surfaceDescription, float3 V, out SurfaceData surfaceData, out float3 bentNormalWS)
			{
				ZERO_INITIALIZE(SurfaceData, surfaceData);
				surfaceData.perceptualSmoothness =      surfaceDescription.Smoothness;

				surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;
				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
					surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
				#endif
				#ifdef _MATERIAL_FEATURE_TRANSMISSION
					surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
				#endif
				#ifdef _MATERIAL_FEATURE_ANISOTROPY
					surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;
				#endif

				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
					surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
				#endif
				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
					surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
				#endif

				#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
					surfaceData.baseColor *= (1.0 - Max3(surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b));
				#endif

				GetNormalWS( fragInputs, float3( 0.0, 0.0, 1.0 ), surfaceData.normalWS, float3( 1.0, 1.0, 1.0 ) );
				bentNormalWS = surfaceData.normalWS;

				surfaceData.geomNormalWS = T2W(fragInputs, 2);

				#ifdef _HAS_REFRACTION
					surfaceData.transmittanceMask = 1.0 - surfaceDescription.Alpha;
					surfaceDescription.Alpha = 1.0;
				#endif

					surfaceData.tangentWS = normalize(T2W(fragInputs, 0).xyz);    // The tangent is not normalize in worldToTangent for mikkt. TODO: Check if it expected that we normalize with Morten. Tag: SURFACE_GRADIENT
					surfaceData.tangentWS = Orthonormalize(surfaceData.tangentWS, surfaceData.normalWS);

				#if defined(_SPECULAR_OCCLUSION_CUSTOM)
				#elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
					surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO(V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness(surfaceData.perceptualSmoothness));
				#elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
					surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion(ClampNdotV(dot(surfaceData.normalWS, V)), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness(surfaceData.perceptualSmoothness));
				#else
					surfaceData.specularOcclusion = 1.0;
				#endif
				#ifdef _ENABLE_GEOMETRIC_SPECULAR_AA
					surfaceData.perceptualSmoothness = GeometricNormalFiltering(surfaceData.perceptualSmoothness, T2W(fragInputs, 2), surfaceDescription.SpecularAAScreenSpaceVariance, surfaceDescription.SpecularAAThreshold);
				#endif
			}

			void GetSurfaceAndBuiltinData(SmoothSurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
			{
				//#ifdef LOD_FADE_CROSSFADE
				//	uint3 fadeMaskSeed = asuint((int3)(V * _ScreenSize.xyx));
				//	LODDitheringTransition(fadeMaskSeed, unity_LODFade.x);
				//#endif

				#ifdef _ALPHATEST_ON
					DoAlphaTest ( surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold );
				#endif

					float3 bentNormalWS;
					BuildSurfaceData(fragInputs, surfaceDescription, V, surfaceData, bentNormalWS);

				#if HAVE_DECALS
				if( _EnableDecals )
				{
					DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, surfaceDescription.Alpha);
					ApplyDecalToSurfaceData(decalSurfaceData, fragInputs.tangentToWorld[2], surfaceData);
				}
				#endif

				#if defined( ASE_SRP_VERSION ) && ASE_SRP_VERSION <= 50702
					InitBuiltinData( surfaceDescription.Alpha, bentNormalWS, -T2W(fragInputs, 2), fragInputs.positionRWS, fragInputs.texCoord1, fragInputs.texCoord2, builtinData );
				#else
					InitBuiltinData( posInput, surfaceDescription.Alpha, bentNormalWS, -T2W(fragInputs, 2), fragInputs.texCoord1, fragInputs.texCoord2, builtinData );
				#endif

				builtinData.depthOffset = 0.0;

				#if (SHADERPASS == SHADERPASS_DISTORTION)
					builtinData.distortion = surfaceDescription.Distortion;
					builtinData.distortionBlur = surfaceDescription.DistortionBlur;
				#else
					builtinData.distortion = float2(0.0, 0.0);
					builtinData.distortionBlur = 0.0;
				#endif

				PostInitBuiltinData(V, posInput, surfaceData, builtinData);
			}

			PackedVaryingsMeshToPS Vert(AttributesMesh inputMesh )
			{
				PackedVaryingsMeshToPS outputPackedVaryingsMeshToPS;

				UNITY_SETUP_INSTANCE_ID( inputMesh );
				UNITY_TRANSFER_INSTANCE_ID( inputMesh, outputPackedVaryingsMeshToPS );
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( outputPackedVaryingsMeshToPS );

				TVEModelData Data16_g158299 = (TVEModelData)0;
				float In_Dummy16_g158299 = 0.0;
				TVEModelData Data16_g158264 = (TVEModelData)0;
				half4 Dummy181_g158262 = ( ( _MotionWindCategory + _MotionWindEnd ) + _MotionWindElementMode + ( _MotionInteractionCategory + _MotionInteractionEnd ) + ( _InteractionLiteInfo + _InteractionColoring + _MotionPushIntensityValue + _MotionPushPivotValue + _MotionPushMaskValue + _MotionPushElementMode ) );
				float In_Dummy16_g158264 = Dummy181_g158262.r;
				TVEModelData Data16_g157153 = (TVEModelData)0;
				float In_Dummy16_g157153 = 0.0;
				OctaImpostorVertex( inputMesh.positionOS, inputMesh.normalOS, outputPackedVaryingsMeshToPS.UVsFrame122_g156549, outputPackedVaryingsMeshToPS.UVsFrame222_g156549, outputPackedVaryingsMeshToPS.UVsFrame322_g156549, outputPackedVaryingsMeshToPS.octaframe22_g156549, outputPackedVaryingsMeshToPS.viewPos22_g156549 );
				float3 worldPosOut22_g156549 = GetAbsolutePositionWS( mul( UNITY_MATRIX_I_V, float4( outputPackedVaryingsMeshToPS.viewPos22_g156549.xyz, 1.0 ) ).xyz );
				half3 Input_PositionWS218_g157146 = worldPosOut22_g156549;
				float3 worldToObj278_g157146 = mul( GetWorldToObjectMatrix(), float4( GetCameraRelativePositionWS(Input_PositionWS218_g157146), 1 ) ).xyz;
				half3 Model_PositionOS131_g157146 = worldToObj278_g157146;
				float3 In_PositionOS16_g157153 = Model_PositionOS131_g157146;
				half3 Model_PositionWS122_g157146 = Input_PositionWS218_g157146;
				float3 In_PositionWS16_g157153 = Model_PositionWS122_g157146;
				half3 Model_PositionWO132_g157146 = ( Model_PositionWS122_g157146 - TVE_WorldOrigin );
				float3 In_PositionWO16_g157153 = Model_PositionWO132_g157146;
				float3 In_PositionRawOS16_g157153 = Model_PositionOS131_g157146;
				float3 In_PositionAddOS16_g157153 = float3( 0,0,0 );
				float3 In_PivotOS16_g157153 = float3( 0,0,0 );
				float3 localObjectPosition_UNITY_MATRIX_M14_g157148 = ObjectPosition_UNITY_MATRIX_M();
				#ifdef SHADEROPTIONS_CAMERA_RELATIVE_RENDERING
				float3 staticSwitch13_g157148 = ( localObjectPosition_UNITY_MATRIX_M14_g157148 + _WorldSpaceCameraPos );
				#else
				float3 staticSwitch13_g157148 = localObjectPosition_UNITY_MATRIX_M14_g157148;
				#endif
				half3 ObjectData20_g157150 = staticSwitch13_g157148;
				float3 ase_worldPos = GetAbsolutePositionWS( TransformObjectToWorld( (inputMesh.positionOS).xyz ) );
				half3 WorldData19_g157150 = ase_worldPos;
				#ifdef TVE_OBJECT_BATCHED
				float3 staticSwitch14_g157150 = WorldData19_g157150;
				#else
				float3 staticSwitch14_g157150 = ObjectData20_g157150;
				#endif
				float3 temp_output_124_0_g157148 = staticSwitch14_g157150;
				float3 vertexToFrag281_g157146 = temp_output_124_0_g157148;
				half3 Model_PivotWS121_g157146 = vertexToFrag281_g157146;
				float3 In_PivotWS16_g157153 = Model_PivotWS121_g157146;
				half3 Model_PivotWO133_g157146 = ( Model_PivotWS121_g157146 - TVE_WorldOrigin );
				float3 In_PivotWO16_g157153 = Model_PivotWO133_g157146;
				half3 Model_NormalOS134_g157146 = inputMesh.normalOS;
				float3 In_NormalOS16_g157153 = Model_NormalOS134_g157146;
				float3 ase_worldNormal = TransformObjectToWorldNormal(inputMesh.normalOS);
				half3 Model_Normal_WS95_g157146 = ase_worldNormal;
				float3 In_NormalWS16_g157153 = Model_Normal_WS95_g157146;
				float3 In_NormalRawOS16_g157153 = Model_NormalOS134_g157146;
				float3 In_NormalRawWS16_g157153 = Model_Normal_WS95_g157146;
				float4 In_TangentOS16_g157153 = float4( 0,1,0,1 );
				float3 normalizeResult326_g157146 = normalize( ( _WorldSpaceCameraPos - Model_PositionWS122_g157146 ) );
				half3 Model_ViewDirWS322_g157146 = normalizeResult326_g157146;
				float3 In_ViewDirWS16_g157153 = Model_ViewDirWS322_g157146;
				float4 In_VertexData16_g157153 = float4( 1,1,1,1 );
				float4 In_MotionData16_g157153 = float4( 0,0,0,0 );
				float4 In_BoundsData16_g157153 = float4( 1,1,1,1 );
				float4 In_RotationData16_g157153 = float4( 0,0,0,0 );
				Data16_g157153.Dummy = In_Dummy16_g157153;
				Data16_g157153.PositionOS = In_PositionOS16_g157153;
				Data16_g157153.PositionWS = In_PositionWS16_g157153;
				Data16_g157153.PositionWO = In_PositionWO16_g157153;
				Data16_g157153.PositionRawOS = In_PositionRawOS16_g157153;
				Data16_g157153.PositionAddOS = In_PositionAddOS16_g157153;
				Data16_g157153.PivotOS = In_PivotOS16_g157153;
				Data16_g157153.PivotWS = In_PivotWS16_g157153;
				Data16_g157153.PivotWO = In_PivotWO16_g157153;
				Data16_g157153.NormalOS = In_NormalOS16_g157153;
				Data16_g157153.NormalWS = In_NormalWS16_g157153;
				Data16_g157153.NormalRawOS = In_NormalRawOS16_g157153;
				Data16_g157153.NormalRawWS = In_NormalRawWS16_g157153;
				Data16_g157153.TangentOS = In_TangentOS16_g157153;
				Data16_g157153.ViewDirWS = In_ViewDirWS16_g157153;
				Data16_g157153.VertexData = In_VertexData16_g157153;
				Data16_g157153.MotionData = In_MotionData16_g157153;
				Data16_g157153.BoundsData = In_BoundsData16_g157153;
				Data16_g157153.RotationData = In_RotationData16_g157153;
				TVEModelData Data15_g158263 = Data16_g157153;
				float Out_Dummy15_g158263 = 0;
				float3 Out_PositionOS15_g158263 = float3( 0,0,0 );
				float3 Out_PositionWS15_g158263 = float3( 0,0,0 );
				float3 Out_PositionWO15_g158263 = float3( 0,0,0 );
				float3 Out_PositionRawOS15_g158263 = float3( 0,0,0 );
				float3 Out_PositionAddOS15_g158263 = float3( 0,0,0 );
				float3 Out_PivotOS15_g158263 = float3( 0,0,0 );
				float3 Out_PivotWS15_g158263 = float3( 0,0,0 );
				float3 Out_PivotWO15_g158263 = float3( 0,0,0 );
				float3 Out_NormalOS15_g158263 = float3( 0,0,0 );
				float3 Out_NormalWS15_g158263 = float3( 0,0,0 );
				float3 Out_NormalRawOS15_g158263 = float3( 0,0,0 );
				float3 Out_NormalRawWS15_g158263 = float3( 0,0,0 );
				float4 Out_TangentOS15_g158263 = float4( 0,0,0,0 );
				float3 Out_ViewDirWS15_g158263 = float3( 0,0,0 );
				float4 Out_VertexData15_g158263 = float4( 0,0,0,0 );
				float4 Out_MotionData15_g158263 = float4( 0,0,0,0 );
				float4 Out_BoundsData15_g158263 = float4( 0,0,0,0 );
				float4 Out_RotationData15_g158263 = float4( 0,0,0,0 );
				Out_Dummy15_g158263 = Data15_g158263.Dummy;
				Out_PositionOS15_g158263 = Data15_g158263.PositionOS;
				Out_PositionWS15_g158263 = Data15_g158263.PositionWS;
				Out_PositionWO15_g158263 = Data15_g158263.PositionWO;
				Out_PositionRawOS15_g158263 = Data15_g158263.PositionRawOS;
				Out_PositionAddOS15_g158263 = Data15_g158263.PositionAddOS;
				Out_PivotOS15_g158263 = Data15_g158263.PivotOS;
				Out_PivotWS15_g158263 = Data15_g158263.PivotWS;
				Out_PivotWO15_g158263 = Data15_g158263.PivotWO;
				Out_NormalOS15_g158263 = Data15_g158263.NormalOS;
				Out_NormalWS15_g158263 = Data15_g158263.NormalWS;
				Out_NormalRawOS15_g158263 = Data15_g158263.NormalRawOS;
				Out_NormalRawWS15_g158263 = Data15_g158263.NormalRawWS;
				Out_TangentOS15_g158263 = Data15_g158263.TangentOS;
				Out_ViewDirWS15_g158263 = Data15_g158263.ViewDirWS;
				Out_VertexData15_g158263 = Data15_g158263.VertexData;
				Out_MotionData15_g158263 = Data15_g158263.MotionData;
				Out_BoundsData15_g158263 = Data15_g158263.BoundsData;
				Out_RotationData15_g158263 = Data15_g158263.RotationData;
				float3 temp_output_1567_0_g158262 = Out_PositionOS15_g158263;
				float3 In_PositionOS16_g158264 = temp_output_1567_0_g158262;
				float3 In_PositionWS16_g158264 = Out_PositionWS15_g158263;
				float3 temp_output_1567_17_g158262 = Out_PositionWO15_g158263;
				float3 In_PositionWO16_g158264 = temp_output_1567_17_g158262;
				float3 In_PositionRawOS16_g158264 = Out_PositionRawOS15_g158263;
				float3 In_PositionAddOS16_g158264 = Out_PositionAddOS15_g158263;
				float3 In_PivotOS16_g158264 = Out_PivotOS15_g158263;
				float3 In_PivotWS16_g158264 = Out_PivotWS15_g158263;
				float3 temp_output_1567_19_g158262 = Out_PivotWO15_g158263;
				float3 In_PivotWO16_g158264 = temp_output_1567_19_g158262;
				float3 In_NormalOS16_g158264 = Out_NormalOS15_g158263;
				float3 In_NormalWS16_g158264 = Out_NormalWS15_g158263;
				float3 In_NormalRawOS16_g158264 = Out_NormalRawOS15_g158263;
				float3 In_NormalRawWS16_g158264 = Out_NormalRawWS15_g158263;
				float4 In_TangentOS16_g158264 = Out_TangentOS15_g158263;
				float3 In_ViewDirWS16_g158264 = Out_ViewDirWS15_g158263;
				float4 In_VertexData16_g158264 = Out_VertexData15_g158263;
				float4 In_MotionData16_g158264 = Out_MotionData15_g158263;
				float4 In_BoundsData16_g158264 = Out_BoundsData15_g158263;
				float2 temp_cast_1 = (0.0).xx;
				half3 Model_PositionOS147_g158262 = temp_output_1567_0_g158262;
				half Base_Mask217_g158262 = saturate( ( Model_PositionOS147_g158262.y / _AI_Offset.y ) );
				half3 Model_PositionWO162_g158262 = temp_output_1567_17_g158262;
				half3 Model_PivotWO402_g158262 = temp_output_1567_19_g158262;
				float3 lerpResult829_g158262 = lerp( Model_PositionWO162_g158262 , Model_PivotWO402_g158262 , _MotionBasePivotValue);
				half3 Base_Position1394_g158262 = lerpResult829_g158262;
				half3 Input_PositionWO419_g158267 = Base_Position1394_g158262;
				half Flow_Tillling1397_g158262 = _MotionTillingValue;
				half Input_MotionTilling321_g158267 = ( Flow_Tillling1397_g158262 + 0.2 );
				half2 Noise_Coord515_g158267 = ( -(Input_PositionWO419_g158267).xz * Input_MotionTilling321_g158267 * 0.005 );
				half4 Noise_Params535_g158267 = SAMPLE_TEXTURE2D_LOD( _MotionNoiseTex, sampler_Linear_Repeat, Noise_Coord515_g158267, 0.0 );
				float2 temp_output_648_0_g158267 = (Noise_Params535_g158267).rg;
				half Flow_Value1602_g158262 = _MotionIntensityValue;
				half Input_MotionValue629_g158267 = Flow_Value1602_g158262;
				float2 lerpResult645_g158267 = lerp( float2( 0.5,0.5 ) , temp_output_648_0_g158267 , Input_MotionValue629_g158267);
				float3 appendResult566_g158267 = (float3(lerpResult645_g158267 , (Noise_Params535_g158267).b));
				float temp_output_136_0_g158268 = _global_wind_layer_value;
				float temp_output_19_0_g158270 = TVE_WindLayers[(int)temp_output_136_0_g158268];
				half3 Input_Position180_g158271 = Input_PositionWO419_g158267;
				float2 temp_output_75_0_g158271 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g158271).xz ) );
				float temp_output_82_0_g158271 = temp_output_136_0_g158268;
				float2 temp_output_119_0_g158271 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g158271).xz ) );
				float temp_output_7_0_g158276 = 1.0;
				float temp_output_10_0_g158276 = ( TVE_RenderNearFadeValue - temp_output_7_0_g158276 );
				float4 lerpResult131_g158271 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_WindBaseTex, sampler_Linear_Clamp, temp_output_75_0_g158271,temp_output_82_0_g158271, 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_WindNearTex, sampler_Linear_Repeat, temp_output_119_0_g158271,temp_output_82_0_g158271, 0.0 ) , saturate( ( ( saturate( ( distance( Input_Position180_g158271 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g158276 ) / temp_output_10_0_g158276 ) ));
				float4 temp_output_17_0_g158270 = lerpResult131_g158271;
				float4 temp_output_3_0_g158270 = TVE_WindParams;
				float4 ifLocalVar18_g158270 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g158270 >= 0.5 )
				ifLocalVar18_g158270 = temp_output_17_0_g158270;
				else
				ifLocalVar18_g158270 = temp_output_3_0_g158270;
				float4 lerpResult22_g158270 = lerp( temp_output_3_0_g158270 , temp_output_17_0_g158270 , temp_output_19_0_g158270);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g158270 = lerpResult22_g158270;
				#else
				float4 staticSwitch24_g158270 = ifLocalVar18_g158270;
				#endif
				float4 temp_output_610_0_g158267 = staticSwitch24_g158270;
				float3 appendResult643_g158267 = (float3((temp_output_610_0_g158267).rg , (temp_output_610_0_g158267).b));
				float3 lerpResult623_g158267 = lerp( appendResult566_g158267 , appendResult643_g158267 , (temp_output_610_0_g158267).a);
				#ifdef TVE_MOTION_WIND_ELEMENT
				float3 staticSwitch612_g158267 = lerpResult623_g158267;
				#else
				float3 staticSwitch612_g158267 = appendResult566_g158267;
				#endif
				float3 temp_output_1620_567_g158262 = staticSwitch612_g158267;
				half Base_Noise1590_g158262 = (temp_output_1620_567_g158262).z;
				float2 break83_g158266 = ((temp_output_1620_567_g158262).xy*2.0 + -1.0);
				float3 appendResult79_g158266 = (float3(break83_g158266.x , 0.0 , break83_g158266.y));
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				half2 Base_Direction893_g158262 = (( mul( GetWorldToObjectMatrix(), float4( appendResult79_g158266 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half Base_Intensity1615_g158262 = length( Base_Direction893_g158262 );
				half Flow_Delay1626_g158262 = _MotionDelayValue;
				float lerpResult1623_g158262 = lerp( 1.0 , ( Base_Intensity1615_g158262 * Base_Intensity1615_g158262 ) , Flow_Delay1626_g158262);
				#ifdef TVE_MOTION_BASE_BENDING
				float2 staticSwitch1573_g158262 = ( _MotionBaseIntensityValue * Base_Mask217_g158262 * Base_Noise1590_g158262 * Base_Direction893_g158262 * lerpResult1623_g158262 );
				#else
				float2 staticSwitch1573_g158262 = temp_cast_1;
				#endif
				half2 Base_Motion1440_g158262 = staticSwitch1573_g158262;
				half2 Final_RoationData1570_g158262 = Base_Motion1440_g158262;
				float4 In_RotationData16_g158264 = float4( Final_RoationData1570_g158262, 0.0 , 0.0 );
				Data16_g158264.Dummy = In_Dummy16_g158264;
				Data16_g158264.PositionOS = In_PositionOS16_g158264;
				Data16_g158264.PositionWS = In_PositionWS16_g158264;
				Data16_g158264.PositionWO = In_PositionWO16_g158264;
				Data16_g158264.PositionRawOS = In_PositionRawOS16_g158264;
				Data16_g158264.PositionAddOS = In_PositionAddOS16_g158264;
				Data16_g158264.PivotOS = In_PivotOS16_g158264;
				Data16_g158264.PivotWS = In_PivotWS16_g158264;
				Data16_g158264.PivotWO = In_PivotWO16_g158264;
				Data16_g158264.NormalOS = In_NormalOS16_g158264;
				Data16_g158264.NormalWS = In_NormalWS16_g158264;
				Data16_g158264.NormalRawOS = In_NormalRawOS16_g158264;
				Data16_g158264.NormalRawWS = In_NormalRawWS16_g158264;
				Data16_g158264.TangentOS = In_TangentOS16_g158264;
				Data16_g158264.ViewDirWS = In_ViewDirWS16_g158264;
				Data16_g158264.VertexData = In_VertexData16_g158264;
				Data16_g158264.MotionData = In_MotionData16_g158264;
				Data16_g158264.BoundsData = In_BoundsData16_g158264;
				Data16_g158264.RotationData = In_RotationData16_g158264;
				TVEModelData Data15_g158298 = Data16_g158264;
				float Out_Dummy15_g158298 = 0;
				float3 Out_PositionOS15_g158298 = float3( 0,0,0 );
				float3 Out_PositionWS15_g158298 = float3( 0,0,0 );
				float3 Out_PositionWO15_g158298 = float3( 0,0,0 );
				float3 Out_PositionRawOS15_g158298 = float3( 0,0,0 );
				float3 Out_PositionAddOS15_g158298 = float3( 0,0,0 );
				float3 Out_PivotOS15_g158298 = float3( 0,0,0 );
				float3 Out_PivotWS15_g158298 = float3( 0,0,0 );
				float3 Out_PivotWO15_g158298 = float3( 0,0,0 );
				float3 Out_NormalOS15_g158298 = float3( 0,0,0 );
				float3 Out_NormalWS15_g158298 = float3( 0,0,0 );
				float3 Out_NormalRawOS15_g158298 = float3( 0,0,0 );
				float3 Out_NormalRawWS15_g158298 = float3( 0,0,0 );
				float4 Out_TangentOS15_g158298 = float4( 0,0,0,0 );
				float3 Out_ViewDirWS15_g158298 = float3( 0,0,0 );
				float4 Out_VertexData15_g158298 = float4( 0,0,0,0 );
				float4 Out_MotionData15_g158298 = float4( 0,0,0,0 );
				float4 Out_BoundsData15_g158298 = float4( 0,0,0,0 );
				float4 Out_RotationData15_g158298 = float4( 0,0,0,0 );
				Out_Dummy15_g158298 = Data15_g158298.Dummy;
				Out_PositionOS15_g158298 = Data15_g158298.PositionOS;
				Out_PositionWS15_g158298 = Data15_g158298.PositionWS;
				Out_PositionWO15_g158298 = Data15_g158298.PositionWO;
				Out_PositionRawOS15_g158298 = Data15_g158298.PositionRawOS;
				Out_PositionAddOS15_g158298 = Data15_g158298.PositionAddOS;
				Out_PivotOS15_g158298 = Data15_g158298.PivotOS;
				Out_PivotWS15_g158298 = Data15_g158298.PivotWS;
				Out_PivotWO15_g158298 = Data15_g158298.PivotWO;
				Out_NormalOS15_g158298 = Data15_g158298.NormalOS;
				Out_NormalWS15_g158298 = Data15_g158298.NormalWS;
				Out_NormalRawOS15_g158298 = Data15_g158298.NormalRawOS;
				Out_NormalRawWS15_g158298 = Data15_g158298.NormalRawWS;
				Out_TangentOS15_g158298 = Data15_g158298.TangentOS;
				Out_ViewDirWS15_g158298 = Data15_g158298.ViewDirWS;
				Out_VertexData15_g158298 = Data15_g158298.VertexData;
				Out_MotionData15_g158298 = Data15_g158298.MotionData;
				Out_BoundsData15_g158298 = Data15_g158298.BoundsData;
				Out_RotationData15_g158298 = Data15_g158298.RotationData;
				half3 Model_PositionOS147_g158297 = Out_PositionOS15_g158298;
				half3 Input_False58_g158303 = Model_PositionOS147_g158297;
				half3 VertexPos40_g158300 = Model_PositionOS147_g158297;
				half3 VertexPos40_g158301 = VertexPos40_g158300;
				float3 appendResult74_g158301 = (float3(VertexPos40_g158301.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g158301 = appendResult74_g158301;
				float3 break84_g158301 = VertexPos40_g158301;
				float3 appendResult81_g158301 = (float3(0.0 , break84_g158301.y , break84_g158301.z));
				half3 VertexPosOtherAxis82_g158301 = appendResult81_g158301;
				float4 temp_output_1567_33_g158297 = Out_RotationData15_g158298;
				half4 Model_VertexBend1569_g158297 = temp_output_1567_33_g158297;
				half2 Angle44_g158300 = (Model_VertexBend1569_g158297).xy;
				half Angle44_g158301 = (Angle44_g158300).y;
				half3 VertexPos40_g158302 = ( VertexPosRotationAxis50_g158301 + ( VertexPosOtherAxis82_g158301 * cos( Angle44_g158301 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g158301 ) * sin( Angle44_g158301 ) ) );
				float3 appendResult74_g158302 = (float3(0.0 , 0.0 , VertexPos40_g158302.z));
				half3 VertexPosRotationAxis50_g158302 = appendResult74_g158302;
				float3 break84_g158302 = VertexPos40_g158302;
				float3 appendResult81_g158302 = (float3(break84_g158302.x , break84_g158302.y , 0.0));
				half3 VertexPosOtherAxis82_g158302 = appendResult81_g158302;
				half Angle44_g158302 = -(Angle44_g158300).x;
				half3 Input_True57_g158303 = ( VertexPosRotationAxis50_g158302 + ( VertexPosOtherAxis82_g158302 * cos( Angle44_g158302 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g158302 ) * sin( Angle44_g158302 ) ) );
				#ifdef TVE_MOTION_BASE_BENDING
				float3 staticSwitch65_g158303 = Input_True57_g158303;
				#else
				float3 staticSwitch65_g158303 = Input_False58_g158303;
				#endif
				#ifdef TVE_MOTION_PUSH_BENDING
				float3 staticSwitch67_g158303 = Input_True57_g158303;
				#else
				float3 staticSwitch67_g158303 = staticSwitch65_g158303;
				#endif
				#ifdef TVE_BLANKET_BENDING
				float3 staticSwitch69_g158303 = Input_True57_g158303;
				#else
				float3 staticSwitch69_g158303 = staticSwitch67_g158303;
				#endif
				float3 temp_output_1578_0_g158297 = staticSwitch69_g158303;
				float3 temp_output_1567_31_g158297 = Out_PositionAddOS15_g158298;
				half3 Model_PositionADD1568_g158297 = temp_output_1567_31_g158297;
				half3 Final_PositionOS178_g158297 = ( temp_output_1578_0_g158297 + Model_PositionADD1568_g158297 );
				float3 In_PositionOS16_g158299 = Final_PositionOS178_g158297;
				float3 In_PositionWS16_g158299 = Out_PositionWS15_g158298;
				float3 In_PositionWO16_g158299 = Out_PositionWO15_g158298;
				float3 In_PositionRawOS16_g158299 = Out_PositionRawOS15_g158298;
				float3 In_PositionAddOS16_g158299 = temp_output_1567_31_g158297;
				float3 In_PivotOS16_g158299 = Out_PivotOS15_g158298;
				float3 In_PivotWS16_g158299 = Out_PivotWS15_g158298;
				float3 In_PivotWO16_g158299 = Out_PivotWO15_g158298;
				float3 In_NormalOS16_g158299 = Out_NormalOS15_g158298;
				float3 In_NormalWS16_g158299 = Out_NormalWS15_g158298;
				float3 In_NormalRawOS16_g158299 = Out_NormalRawOS15_g158298;
				float3 In_NormalRawWS16_g158299 = Out_NormalRawWS15_g158298;
				float4 In_TangentOS16_g158299 = Out_TangentOS15_g158298;
				float3 In_ViewDirWS16_g158299 = Out_ViewDirWS15_g158298;
				float4 In_VertexData16_g158299 = Out_VertexData15_g158298;
				float4 In_MotionData16_g158299 = Out_MotionData15_g158298;
				float4 In_BoundsData16_g158299 = Out_BoundsData15_g158298;
				float4 In_RotationData16_g158299 = temp_output_1567_33_g158297;
				Data16_g158299.Dummy = In_Dummy16_g158299;
				Data16_g158299.PositionOS = In_PositionOS16_g158299;
				Data16_g158299.PositionWS = In_PositionWS16_g158299;
				Data16_g158299.PositionWO = In_PositionWO16_g158299;
				Data16_g158299.PositionRawOS = In_PositionRawOS16_g158299;
				Data16_g158299.PositionAddOS = In_PositionAddOS16_g158299;
				Data16_g158299.PivotOS = In_PivotOS16_g158299;
				Data16_g158299.PivotWS = In_PivotWS16_g158299;
				Data16_g158299.PivotWO = In_PivotWO16_g158299;
				Data16_g158299.NormalOS = In_NormalOS16_g158299;
				Data16_g158299.NormalWS = In_NormalWS16_g158299;
				Data16_g158299.NormalRawOS = In_NormalRawOS16_g158299;
				Data16_g158299.NormalRawWS = In_NormalRawWS16_g158299;
				Data16_g158299.TangentOS = In_TangentOS16_g158299;
				Data16_g158299.ViewDirWS = In_ViewDirWS16_g158299;
				Data16_g158299.VertexData = In_VertexData16_g158299;
				Data16_g158299.MotionData = In_MotionData16_g158299;
				Data16_g158299.BoundsData = In_BoundsData16_g158299;
				Data16_g158299.RotationData = In_RotationData16_g158299;
				TVEModelData Data15_g158319 = Data16_g158299;
				float Out_Dummy15_g158319 = 0;
				float3 Out_PositionOS15_g158319 = float3( 0,0,0 );
				float3 Out_PositionWS15_g158319 = float3( 0,0,0 );
				float3 Out_PositionWO15_g158319 = float3( 0,0,0 );
				float3 Out_PositionRawOS15_g158319 = float3( 0,0,0 );
				float3 Out_PositionAddOS15_g158319 = float3( 0,0,0 );
				float3 Out_PivotOS15_g158319 = float3( 0,0,0 );
				float3 Out_PivotWS15_g158319 = float3( 0,0,0 );
				float3 Out_PivotWO15_g158319 = float3( 0,0,0 );
				float3 Out_NormalOS15_g158319 = float3( 0,0,0 );
				float3 Out_NormalWS15_g158319 = float3( 0,0,0 );
				float3 Out_NormalRawOS15_g158319 = float3( 0,0,0 );
				float3 Out_NormalRawWS15_g158319 = float3( 0,0,0 );
				float4 Out_TangentOS15_g158319 = float4( 0,0,0,0 );
				float3 Out_ViewDirWS15_g158319 = float3( 0,0,0 );
				float4 Out_VertexData15_g158319 = float4( 0,0,0,0 );
				float4 Out_MotionData15_g158319 = float4( 0,0,0,0 );
				float4 Out_BoundsData15_g158319 = float4( 0,0,0,0 );
				float4 Out_RotationData15_g158319 = float4( 0,0,0,0 );
				Out_Dummy15_g158319 = Data15_g158319.Dummy;
				Out_PositionOS15_g158319 = Data15_g158319.PositionOS;
				Out_PositionWS15_g158319 = Data15_g158319.PositionWS;
				Out_PositionWO15_g158319 = Data15_g158319.PositionWO;
				Out_PositionRawOS15_g158319 = Data15_g158319.PositionRawOS;
				Out_PositionAddOS15_g158319 = Data15_g158319.PositionAddOS;
				Out_PivotOS15_g158319 = Data15_g158319.PivotOS;
				Out_PivotWS15_g158319 = Data15_g158319.PivotWS;
				Out_PivotWO15_g158319 = Data15_g158319.PivotWO;
				Out_NormalOS15_g158319 = Data15_g158319.NormalOS;
				Out_NormalWS15_g158319 = Data15_g158319.NormalWS;
				Out_NormalRawOS15_g158319 = Data15_g158319.NormalRawOS;
				Out_NormalRawWS15_g158319 = Data15_g158319.NormalRawWS;
				Out_TangentOS15_g158319 = Data15_g158319.TangentOS;
				Out_ViewDirWS15_g158319 = Data15_g158319.ViewDirWS;
				Out_VertexData15_g158319 = Data15_g158319.VertexData;
				Out_MotionData15_g158319 = Data15_g158319.MotionData;
				Out_BoundsData15_g158319 = Data15_g158319.BoundsData;
				Out_RotationData15_g158319 = Data15_g158319.RotationData;
				float3 temp_output_31_0_g158312 = Out_PositionOS15_g158319;
				float3 temp_output_6_0_g158326 = ( ( temp_output_31_0_g158312 - Out_PositionRawOS15_g158319 ) + _DisableSRPBatcher );
				half4 Dummy_Data505 = ( ( ( _VariationLiteInfo + _VariationColoring ) + ( _VariationCategory + _VariationEnd ) + ( _VariationIntensityValue + _VariationColorTwo + _VariationColorOne ) + ( _VariationMultiValue + _VariationNoiseRemap + _VariationNoisePivotsValue1 + _VariationNoiseTillingValue ) ) + ( ( _TintingLiteInfo + _TintingColoring ) + ( _TintingCategory + _TintingEnd + _TintingSpace + 0.0 + _TintingElementMode ) + ( _TintingIntensityValue + _TintingColor + _TintingGrayValue ) + ( _TintingMultiValue + _TintingLumaValue + _TintingLumaRemap ) + 0.0 + 0.0 ) + ( ( _DrynessLiteInfo + _DrynessColoring ) + ( _DrynessCategory + _DrynessEnd + _DrynessSpace + _DrynessElementMode + 0.0 ) + ( _DrynessIntensityValue + _DrynessColor + _DrynessGrayValue + _DrynessShiftValue + _DrynessSmoothnessValue + _DrynessSubsurfaceValue ) + ( _DrynessMultiValue + _DrynessLumaValue + _DrynessLumaRemap ) + 0.0 + 0.0 ) + ( ( _WetnessLiteInfo + _WetnessColoring ) + ( _WetnessCategory + _WetnessEnd + _WetnessElementMode + 0.0 ) + ( _WetnessIntensityValue + _WetnessContrastValue + _WetnessSmoothnessValue ) + float4( 0,0,0,0 ) + float4( 0,0,0,0 ) ) + ( ( _CutoutLiteInfo + _CutoutColoring ) + ( _CutoutCategory + _CutoutEnd + _CutoutSpace + _CutoutElementMode + 0.0 ) + ( _CutoutIntensityValue + _CutoutShadowMode ) + ( _CutoutMultiValue + _CutoutAlphaValue + _CutoutNoiseValue + _CutoutNoiseTillingValue ) + 0.0 ) + ( ( _DitherLiteInfo + _DitherColoring ) + ( _DitherCategory + _DitherEnd ) + ( _DitherConstantValue + 0.0 + 0.0 + ( _DitherDistanceValue + _DitherDistanceMaxValue + _DitherDistanceMinValue ) + _DitherShadowMode ) + ( _DitherMultiValue + _DitherNoiseTillingValue ) ) + ( ( _SizeFadeLiteInfo + _SizeFadeColoring ) + ( _SizeFadeCategory + _SizeFadeEnd + _SizeFadeElementMode ) + ( _SizeFadeIntensityValue + _SizeFadeScaleMode + _SizeFadeScaleValue + _SizeFadeDistMinValue + _SizeFadeDistMaxValue ) ) );
				#ifdef TVE_REGISTER
				float4 staticSwitch14_g158326 = ( float4( temp_output_6_0_g158326 , 0.0 ) + ( Dummy_Data505 * float4( 0,0,0,0 ) ) );
				#else
				float4 staticSwitch14_g158326 = float4( temp_output_6_0_g158326 , 0.0 );
				#endif
				
				inputMesh.positionOS.xyz += staticSwitch14_g158326.rgb;

				float3 positionRWS = TransformObjectToWorld( inputMesh.positionOS.xyz );
				float3 normalWS = TransformObjectToWorldNormal(inputMesh.normalOS);
				float4 tangentWS = float4(TransformObjectToWorldDir(inputMesh.tangentOS.xyz), inputMesh.tangentOS.w);

				outputPackedVaryingsMeshToPS.positionCS = TransformWorldToHClip(positionRWS);
				outputPackedVaryingsMeshToPS.interp00.xyz = positionRWS;
				outputPackedVaryingsMeshToPS.interp01.xyz = normalWS;
				outputPackedVaryingsMeshToPS.interp02.xyzw = tangentWS;
				outputPackedVaryingsMeshToPS.interp03.xyzw = inputMesh.texcoord;
				outputPackedVaryingsMeshToPS.interp04.xyzw = inputMesh.uv1;
				outputPackedVaryingsMeshToPS.interp05.xyzw = inputMesh.uv2;
				outputPackedVaryingsMeshToPS.interp06.xyzw = inputMesh.uv3;
				outputPackedVaryingsMeshToPS.interp07.xyzw = inputMesh.color;

				return outputPackedVaryingsMeshToPS;
			}

			void Frag(  PackedVaryingsMeshToPS packedInput
				#ifdef WRITE_NORMAL_BUFFER
				, out float4 outNormalBuffer : SV_Target0
					#ifdef WRITE_MSAA_DEPTH
				, out float1 depthColor : SV_Target1
					#endif
				#endif
				, out float outputDepth : SV_Depth
				
			)
			{
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( packedInput );
				UNITY_SETUP_INSTANCE_ID( packedInput );

				#ifdef LOD_FADE_CROSSFADE
				float3 VC = GetWorldSpaceNormalizeViewDir(packedInput.interp00.xyz);
				LODDitheringTransition(ComputeFadeMaskSeed(VC, packedInput.positionCS.xy), unity_LODFade.x);
				#endif

				FragInputs input;

				ZERO_INITIALIZE(FragInputs, input);
				SmoothSurfaceDescription surfaceDescription = (SmoothSurfaceDescription)0;
				SurfaceOutput o = (SurfaceOutput)0;

				o.Normal = float3( 0, 0, 1 );
				float4 positionCS = 0;
				float3 positionWS = 0;

				float localBreakData4_g158315 = ( 0.0 );
				float localCompData3_g158307 = ( 0.0 );
				TVEVisualData Data3_g158307 = (TVEVisualData)0;
				half Dummy145_g158305 = ( _SubsurfaceCategory + _SubsurfaceEnd + ( _SubsurfaceDirectValue + _SubsurfaceNormalValue + _SubsurfaceAmbientValue + _SubsurfaceShadowValue ) + _SubsurfaceElementMode );
				float In_Dummy3_g158307 = Dummy145_g158305;
				float localBreakData4_g158306 = ( 0.0 );
				float localCompData3_g158259 = ( 0.0 );
				TVEVisualData Data3_g158259 = (TVEVisualData)0;
				half Dummy145_g158247 = ( _EmissiveCategory + _EmissiveEnd + ( _EmissivePowerMode + _EmissivePowerValue ) + _EmissiveElementMode + 0.0 );
				float In_Dummy3_g158259 = Dummy145_g158247;
				float localBreakData4_g158258 = ( 0.0 );
				float localCompData3_g158220 = ( 0.0 );
				TVEVisualData Data3_g158220 = (TVEVisualData)0;
				float2 uv_OverlayGlitterTex = packedInput.interp03.xy * _OverlayGlitterTex_ST.xy + _OverlayGlitterTex_ST.zw;
				half4 Dummy594_g158217 = ( ( _OverlayCategory + _OverlayEnd + _OverlaySpace + _OverlayElementMode + _OverlayBakeInfo ) + ( _OverlayLiteInfo + _OverlayColoringOn + _OverlayColoringOff ) + ( SAMPLE_TEXTURE2D( _OverlayGlitterTex, sampler_OverlayGlitterTex, uv_OverlayGlitterTex ) + _OverlayGlitterTillingValue + _OverlayGlitterIntensityValue + _OverlayGlitterColor + _OverlayGlitterDistValue ) );
				float In_Dummy3_g158220 = Dummy594_g158217.r;
				float localBreakData4_g158218 = ( 0.0 );
				float localCompData3_g157221 = ( 0.0 );
				TVEVisualData Data3_g157221 = (TVEVisualData)0;
				float4 output0 = 0;
				float4 output1 = 0;
				OctaImpostorFragment( o, positionCS, positionWS, packedInput.UVsFrame122_g156549, packedInput.UVsFrame222_g156549, packedInput.UVsFrame322_g156549, packedInput.octaframe22_g156549, packedInput.viewPos22_g156549, output0, output1 );
				float In_Dummy3_g157221 = output1.r;
				float4 break227_g157220 = output0;
				half Local_MultiMask249_g157220 = break227_g157220.b;
				float lerpResult289_g157220 = lerp( 1.0 , Local_MultiMask249_g157220 , _ImpostorColorMode);
				float3 lerpResult292_g157220 = lerp( (_ImpostorColorTwo).rgb , (_ImpostorColor).rgb , lerpResult289_g157220);
				half3 Local_Albedo239_g157220 = ( o.Albedo * lerpResult292_g157220 );
				float3 In_Albedo3_g157221 = Local_Albedo239_g157220;
				float2 temp_cast_4 = (0.5).xx;
				float2 In_NormalTS3_g157221 = temp_cast_4;
				float3 In_NormalWS3_g157221 = o.Normal;
				half Local_Metallic247_g157220 = break227_g157220.r;
				half Final_Metallic238_g157220 = ( Local_Metallic247_g157220 * _ImpostorMetallicValue );
				half Local_Smoothness250_g157220 = break227_g157220.a;
				half Final_Smoothness233_g157220 = ( Local_Smoothness250_g157220 * _ImpostorSmoothnessValue );
				float4 appendResult257_g157220 = (float4(Final_Metallic238_g157220 , 1.0 , 1.0 , Final_Smoothness233_g157220));
				float4 In_Shader3_g157221 = appendResult257_g157220;
				half Local_EmissiveMask248_g157220 = break227_g157220.g;
				float4 appendResult286_g157220 = (float4(Local_EmissiveMask248_g157220 , Local_EmissiveMask248_g157220 , Local_EmissiveMask248_g157220 , 1.0));
				float4 In_Emissive3_g157221 = appendResult286_g157220;
				float3 temp_output_3_0_g157222 = Local_Albedo239_g157220;
				float dotResult20_g157222 = dot( temp_output_3_0_g157222 , float3(0.2126,0.7152,0.0722) );
				half Local_Grayscale268_g157220 = dotResult20_g157222;
				float In_Grayscale3_g157221 = Local_Grayscale268_g157220;
				float clampResult267_g157220 = clamp( saturate( ( Local_Grayscale268_g157220 * 5.0 ) ) , 0.2 , 1.0 );
				half Local_Luminosity269_g157220 = clampResult267_g157220;
				float In_Luminosity3_g157221 = Local_Luminosity269_g157220;
				float In_MultiMask3_g157221 = Local_MultiMask249_g157220;
				float In_AlphaClip3_g157221 = 0.0;
				float In_AlphaFade3_g157221 = 1.0;
				float3 temp_cast_5 = (1.0).xxx;
				float3 In_Translucency3_g157221 = temp_cast_5;
				float In_Transmission3_g157221 = 1.0;
				float In_Thickness3_g157221 = 0.0;
				float In_Diffusion3_g157221 = 0.0;
				Data3_g157221.Dummy = In_Dummy3_g157221;
				Data3_g157221.Albedo = In_Albedo3_g157221;
				Data3_g157221.NormalTS = In_NormalTS3_g157221;
				Data3_g157221.NormalWS = In_NormalWS3_g157221;
				Data3_g157221.Shader = In_Shader3_g157221;
				Data3_g157221.Emissive= In_Emissive3_g157221;
				Data3_g157221.MultiMask = In_MultiMask3_g157221;
				Data3_g157221.Grayscale = In_Grayscale3_g157221;
				Data3_g157221.Luminosity = In_Luminosity3_g157221;
				Data3_g157221.AlphaClip = In_AlphaClip3_g157221;
				Data3_g157221.AlphaFade = In_AlphaFade3_g157221;
				Data3_g157221.Translucency = In_Translucency3_g157221;
				Data3_g157221.Transmission = In_Transmission3_g157221;
				Data3_g157221.Thickness = In_Thickness3_g157221;
				Data3_g157221.Diffusion = In_Diffusion3_g157221;
				TVEVisualData Data4_g158218 = Data3_g157221;
				float Out_Dummy4_g158218 = 0;
				float3 Out_Albedo4_g158218 = float3( 0,0,0 );
				float2 Out_NormalTS4_g158218 = float2( 0,0 );
				float3 Out_NormalWS4_g158218 = float3( 0,0,0 );
				float4 Out_Shader4_g158218 = float4( 0,0,0,0 );
				float4 Out_Emissive4_g158218 = float4( 0,0,0,0 );
				float Out_MultiMask4_g158218 = 0;
				float Out_Grayscale4_g158218 = 0;
				float Out_Luminosity4_g158218 = 0;
				float Out_AlphaClip4_g158218 = 0;
				float Out_AlphaFade4_g158218 = 0;
				float3 Out_Translucency4_g158218 = float3( 0,0,0 );
				float Out_Transmission4_g158218 = 0;
				float Out_Thickness4_g158218 = 0;
				float Out_Diffusion4_g158218 = 0;
				Out_Dummy4_g158218 = Data4_g158218.Dummy;
				Out_Albedo4_g158218 = Data4_g158218.Albedo;
				Out_NormalTS4_g158218 = Data4_g158218.NormalTS;
				Out_NormalWS4_g158218 = Data4_g158218.NormalWS;
				Out_Shader4_g158218 = Data4_g158218.Shader;
				Out_Emissive4_g158218= Data4_g158218.Emissive;
				Out_MultiMask4_g158218 = Data4_g158218.MultiMask;
				Out_Grayscale4_g158218 = Data4_g158218.Grayscale;
				Out_Luminosity4_g158218= Data4_g158218.Luminosity;
				Out_AlphaClip4_g158218 = Data4_g158218.AlphaClip;
				Out_AlphaFade4_g158218 = Data4_g158218.AlphaFade;
				Out_Translucency4_g158218 = Data4_g158218.Translucency;
				Out_Transmission4_g158218 = Data4_g158218.Transmission;
				Out_Thickness4_g158218 = Data4_g158218.Thickness;
				Out_Diffusion4_g158218 = Data4_g158218.Diffusion;
				half3 Visual_Albedo127_g158217 = Out_Albedo4_g158218;
				float3 temp_output_622_0_g158217 = (_OverlayColor).rgb;
				half Overlay_TexMask906_g158217 = 1.0;
				float3 temp_output_739_21_g158217 = Out_NormalWS4_g158218;
				half3 Visual_NormalWS749_g158217 = temp_output_739_21_g158217;
				float clampResult17_g158237 = clamp( saturate( (Visual_NormalWS749_g158217).y ) , 0.0001 , 0.9999 );
				float temp_output_7_0_g158236 = _OverlayProjRemap.x;
				float temp_output_10_0_g158236 = ( _OverlayProjRemap.y - temp_output_7_0_g158236 );
				float lerpResult842_g158217 = lerp( 1.0 , saturate( ( ( clampResult17_g158237 - temp_output_7_0_g158236 ) / ( temp_output_10_0_g158236 + 0.0001 ) ) ) , _OverlayProjValue);
				half Overlay_MaskProj457_g158217 = lerpResult842_g158217;
				float temp_output_739_15_g158217 = Out_Luminosity4_g158218;
				half Visual_Luminosity654_g158217 = temp_output_739_15_g158217;
				float clampResult17_g158239 = clamp( Visual_Luminosity654_g158217 , 0.0001 , 0.9999 );
				float temp_output_7_0_g158238 = _OverlayLumaRemap.x;
				float temp_output_10_0_g158238 = ( _OverlayLumaRemap.y - temp_output_7_0_g158238 );
				float lerpResult587_g158217 = lerp( 1.0 , saturate( ( ( clampResult17_g158239 - temp_output_7_0_g158238 ) / ( temp_output_10_0_g158238 + 0.0001 ) ) ) , _OverlayLumaValue);
				half Overlay_MaskLuma438_g158217 = lerpResult587_g158217;
				half Overlay_VertMask801_g158217 = 1.0;
				half Overlay_MaskNoise427_g158217 = 1.0;
				float localBuildGlobalData204_g157155 = ( 0.0 );
				TVEGlobalData Data204_g157155 = (TVEGlobalData)0;
				half Dummy211_g157155 = ( _GlobalLiteInfo + ( _GlobalCategory + _GlobalEnd ) );
				float In_Dummy204_g157155 = Dummy211_g157155;
				float4 temp_output_362_164_g157155 = TVE_CoatParams;
				half4 Coat_Params302_g157155 = temp_output_362_164_g157155;
				float4 In_CoatParams204_g157155 = Coat_Params302_g157155;
				float4 temp_output_361_164_g157155 = TVE_PaintParams;
				half4 Paint_Params71_g157155 = temp_output_361_164_g157155;
				float4 In_PaintParams204_g157155 = Paint_Params71_g157155;
				float4 temp_output_365_163_g157155 = TVE_GlowParams;
				half4 Glow_Params248_g157155 = temp_output_365_163_g157155;
				float4 In_GlowParams204_g157155 = Glow_Params248_g157155;
				float4 temp_output_363_141_g157155 = TVE_AtmoParams;
				half4 Atmo_Params80_g157155 = temp_output_363_141_g157155;
				float4 In_AtmoParams204_g157155 = Atmo_Params80_g157155;
				float4 temp_output_364_139_g157155 = TVE_FormParams;
				half4 Form_Params112_g157155 = temp_output_364_139_g157155;
				float4 In_FormParams204_g157155 = Form_Params112_g157155;
				float4 temp_output_366_145_g157155 = TVE_WindParams;
				half4 Wind_Params88_g157155 = temp_output_366_145_g157155;
				float4 In_WindParams204_g157155 = Wind_Params88_g157155;
				float4 temp_output_367_145_g157155 = TVE_PushParams;
				half4 Push_Params335_g157155 = temp_output_367_145_g157155;
				float4 In_PushParams204_g157155 = Push_Params335_g157155;
				Data204_g157155.Dummy = In_Dummy204_g157155;
				Data204_g157155.CoatParams = In_CoatParams204_g157155;
				Data204_g157155.PaintParams = In_PaintParams204_g157155;
				Data204_g157155.GlowParams = In_GlowParams204_g157155;
				Data204_g157155.AtmoParams = In_AtmoParams204_g157155;
				Data204_g157155.FormParams= In_FormParams204_g157155;
				Data204_g157155.WindParams = In_WindParams204_g157155;
				Data204_g157155.PushParams = In_PushParams204_g157155;
				TVEGlobalData Data15_g158219 = Data204_g157155;
				float Out_Dummy15_g158219 = 0;
				float4 Out_CoatParams15_g158219 = float4( 0,0,0,0 );
				float4 Out_PaintParams15_g158219 = float4( 0,0,0,0 );
				float4 Out_GlowParams15_g158219 = float4( 0,0,0,0 );
				float4 Out_AtmoParams15_g158219 = float4( 0,0,0,0 );
				float4 Out_FadeParams15_g158219 = float4( 0,0,0,0 );
				float4 Out_FormParams15_g158219 = float4( 0,0,0,0 );
				float4 Out_LandParams15_g158219 = float4( 0,0,0,0 );
				float4 Out_WindParams15_g158219 = float4( 0,0,0,0 );
				float4 Out_PushParams15_g158219 = float4( 0,0,0,0 );
				Out_Dummy15_g158219 = Data15_g158219.Dummy;
				Out_CoatParams15_g158219 = Data15_g158219.CoatParams;
				Out_PaintParams15_g158219 = Data15_g158219.PaintParams;
				Out_GlowParams15_g158219 = Data15_g158219.GlowParams;
				Out_AtmoParams15_g158219= Data15_g158219.AtmoParams;
				Out_FadeParams15_g158219= Data15_g158219.FadeParams;
				Out_FormParams15_g158219 = Data15_g158219.FormParams;
				Out_LandParams15_g158219 = Data15_g158219.LandParams;
				Out_WindParams15_g158219 = Data15_g158219.WindParams;
				Out_PushParams15_g158219 = Data15_g158219.PushParams;
				half4 Global_AtmoParams516_g158217 = Out_AtmoParams15_g158219;
				#ifdef TVE_OVERLAY_ELEMENT
				float staticSwitch705_g158217 = (Global_AtmoParams516_g158217).z;
				#else
				float staticSwitch705_g158217 = 1.0;
				#endif
				half Overlay_MaskGlobal429_g158217 = staticSwitch705_g158217;
				half Custom_Mask646_g158217 = 1.0;
				float temp_output_7_0_g158244 = _OverlayBlendRemap1.x;
				float temp_output_10_0_g158244 = ( _OverlayBlendRemap1.y - temp_output_7_0_g158244 );
				half Overlay_Mask494_g158217 = saturate( ( ( ( _OverlayIntensityValue * Overlay_TexMask906_g158217 * Overlay_MaskProj457_g158217 * Overlay_MaskLuma438_g158217 * Overlay_VertMask801_g158217 * Overlay_MaskNoise427_g158217 * Overlay_MaskGlobal429_g158217 * Custom_Mask646_g158217 ) - temp_output_7_0_g158244 ) / ( temp_output_10_0_g158244 + 0.0001 ) ) );
				float3 lerpResult467_g158217 = lerp( Visual_Albedo127_g158217 , temp_output_622_0_g158217 , Overlay_Mask494_g158217);
				#ifdef TVE_OVERLAY
				float3 staticSwitch577_g158217 = lerpResult467_g158217;
				#else
				float3 staticSwitch577_g158217 = Visual_Albedo127_g158217;
				#endif
				half3 Final_Albedo493_g158217 = staticSwitch577_g158217;
				float3 In_Albedo3_g158220 = Final_Albedo493_g158217;
				half2 Visual_NormalTS535_g158217 = Out_NormalTS4_g158218;
				float2 lerpResult551_g158217 = lerp( Visual_NormalTS535_g158217 , ( Visual_NormalTS535_g158217 * _OverlayNormalValue ) , Overlay_Mask494_g158217);
				#ifdef TVE_OVERLAY
				float2 staticSwitch583_g158217 = lerpResult551_g158217;
				#else
				float2 staticSwitch583_g158217 = Visual_NormalTS535_g158217;
				#endif
				half2 Final_NormalTS499_g158217 = staticSwitch583_g158217;
				float2 In_NormalTS3_g158220 = Final_NormalTS499_g158217;
				float3 In_NormalWS3_g158220 = temp_output_739_21_g158217;
				half4 Visual_Masks536_g158217 = Out_Shader4_g158218;
				float4 appendResult585_g158217 = (float4(0.0 , 1.0 , 0.0 , _OverlaySmoothnessValue));
				float4 lerpResult584_g158217 = lerp( Visual_Masks536_g158217 , appendResult585_g158217 , Overlay_Mask494_g158217);
				#ifdef TVE_OVERLAY
				float4 staticSwitch586_g158217 = lerpResult584_g158217;
				#else
				float4 staticSwitch586_g158217 = Visual_Masks536_g158217;
				#endif
				half4 Final_Masks482_g158217 = staticSwitch586_g158217;
				float4 In_Shader3_g158220 = Final_Masks482_g158217;
				float4 In_Emissive3_g158220 = Out_Emissive4_g158218;
				float temp_output_739_12_g158217 = Out_Grayscale4_g158218;
				float In_Grayscale3_g158220 = temp_output_739_12_g158217;
				float In_Luminosity3_g158220 = temp_output_739_15_g158217;
				float In_MultiMask3_g158220 = Out_MultiMask4_g158218;
				float In_AlphaClip3_g158220 = Out_AlphaClip4_g158218;
				float In_AlphaFade3_g158220 = Out_AlphaFade4_g158218;
				float3 In_Translucency3_g158220 = Out_Translucency4_g158218;
				half Visual_Transmission699_g158217 = Out_Transmission4_g158218;
				float lerpResult746_g158217 = lerp( Visual_Transmission699_g158217 , ( Visual_Transmission699_g158217 * _OverlaySubsurfaceValue ) , ( Overlay_VertMask801_g158217 * Overlay_MaskNoise427_g158217 * Overlay_MaskGlobal429_g158217 ));
				#ifdef TVE_OVERLAY
				float staticSwitch703_g158217 = lerpResult746_g158217;
				#else
				float staticSwitch703_g158217 = Visual_Transmission699_g158217;
				#endif
				half Final_Transmission702_g158217 = staticSwitch703_g158217;
				float In_Transmission3_g158220 = Final_Transmission702_g158217;
				float In_Thickness3_g158220 = Out_Thickness4_g158218;
				float In_Diffusion3_g158220 = Out_Diffusion4_g158218;
				Data3_g158220.Dummy = In_Dummy3_g158220;
				Data3_g158220.Albedo = In_Albedo3_g158220;
				Data3_g158220.NormalTS = In_NormalTS3_g158220;
				Data3_g158220.NormalWS = In_NormalWS3_g158220;
				Data3_g158220.Shader = In_Shader3_g158220;
				Data3_g158220.Emissive= In_Emissive3_g158220;
				Data3_g158220.MultiMask = In_MultiMask3_g158220;
				Data3_g158220.Grayscale = In_Grayscale3_g158220;
				Data3_g158220.Luminosity = In_Luminosity3_g158220;
				Data3_g158220.AlphaClip = In_AlphaClip3_g158220;
				Data3_g158220.AlphaFade = In_AlphaFade3_g158220;
				Data3_g158220.Translucency = In_Translucency3_g158220;
				Data3_g158220.Transmission = In_Transmission3_g158220;
				Data3_g158220.Thickness = In_Thickness3_g158220;
				Data3_g158220.Diffusion = In_Diffusion3_g158220;
				TVEVisualData Data4_g158258 = Data3_g158220;
				float Out_Dummy4_g158258 = 0;
				float3 Out_Albedo4_g158258 = float3( 0,0,0 );
				float2 Out_NormalTS4_g158258 = float2( 0,0 );
				float3 Out_NormalWS4_g158258 = float3( 0,0,0 );
				float4 Out_Shader4_g158258 = float4( 0,0,0,0 );
				float4 Out_Emissive4_g158258 = float4( 0,0,0,0 );
				float Out_MultiMask4_g158258 = 0;
				float Out_Grayscale4_g158258 = 0;
				float Out_Luminosity4_g158258 = 0;
				float Out_AlphaClip4_g158258 = 0;
				float Out_AlphaFade4_g158258 = 0;
				float3 Out_Translucency4_g158258 = float3( 0,0,0 );
				float Out_Transmission4_g158258 = 0;
				float Out_Thickness4_g158258 = 0;
				float Out_Diffusion4_g158258 = 0;
				Out_Dummy4_g158258 = Data4_g158258.Dummy;
				Out_Albedo4_g158258 = Data4_g158258.Albedo;
				Out_NormalTS4_g158258 = Data4_g158258.NormalTS;
				Out_NormalWS4_g158258 = Data4_g158258.NormalWS;
				Out_Shader4_g158258 = Data4_g158258.Shader;
				Out_Emissive4_g158258= Data4_g158258.Emissive;
				Out_MultiMask4_g158258 = Data4_g158258.MultiMask;
				Out_Grayscale4_g158258 = Data4_g158258.Grayscale;
				Out_Luminosity4_g158258= Data4_g158258.Luminosity;
				Out_AlphaClip4_g158258 = Data4_g158258.AlphaClip;
				Out_AlphaFade4_g158258 = Data4_g158258.AlphaFade;
				Out_Translucency4_g158258 = Data4_g158258.Translucency;
				Out_Transmission4_g158258 = Data4_g158258.Transmission;
				Out_Thickness4_g158258 = Data4_g158258.Thickness;
				Out_Diffusion4_g158258 = Data4_g158258.Diffusion;
				float3 temp_output_297_0_g158247 = Out_Albedo4_g158258;
				float3 In_Albedo3_g158259 = temp_output_297_0_g158247;
				float2 In_NormalTS3_g158259 = Out_NormalTS4_g158258;
				float3 In_NormalWS3_g158259 = Out_NormalWS4_g158258;
				float4 In_Shader3_g158259 = Out_Shader4_g158258;
				float4 temp_cast_6 = (0.0).xxxx;
				half4 Visual_Emissive255_g158247 = Out_Emissive4_g158258;
				half Emissive_MeshMask221_g158247 = 1.0;
				half Emissive_Mask103_g158247 = 1.0;
				float temp_output_279_0_g158247 = ( Emissive_MeshMask221_g158247 * Emissive_Mask103_g158247 );
				float3 appendResult293_g158247 = (float3(temp_output_279_0_g158247 , temp_output_279_0_g158247 , temp_output_279_0_g158247));
				half3 Local_EmissiveColor278_g158247 = appendResult293_g158247;
				float3 temp_cast_7 = (1.0).xxx;
				TVEGlobalData Data15_g158249 = Data204_g157155;
				float Out_Dummy15_g158249 = 0;
				float4 Out_CoatParams15_g158249 = float4( 0,0,0,0 );
				float4 Out_PaintParams15_g158249 = float4( 0,0,0,0 );
				float4 Out_GlowParams15_g158249 = float4( 0,0,0,0 );
				float4 Out_AtmoParams15_g158249 = float4( 0,0,0,0 );
				float4 Out_FadeParams15_g158249 = float4( 0,0,0,0 );
				float4 Out_FormParams15_g158249 = float4( 0,0,0,0 );
				float4 Out_LandParams15_g158249 = float4( 0,0,0,0 );
				float4 Out_WindParams15_g158249 = float4( 0,0,0,0 );
				float4 Out_PushParams15_g158249 = float4( 0,0,0,0 );
				Out_Dummy15_g158249 = Data15_g158249.Dummy;
				Out_CoatParams15_g158249 = Data15_g158249.CoatParams;
				Out_PaintParams15_g158249 = Data15_g158249.PaintParams;
				Out_GlowParams15_g158249 = Data15_g158249.GlowParams;
				Out_AtmoParams15_g158249= Data15_g158249.AtmoParams;
				Out_FadeParams15_g158249= Data15_g158249.FadeParams;
				Out_FormParams15_g158249 = Data15_g158249.FormParams;
				Out_LandParams15_g158249 = Data15_g158249.LandParams;
				Out_WindParams15_g158249 = Data15_g158249.WindParams;
				Out_PushParams15_g158249 = Data15_g158249.PushParams;
				half4 Global_GlowParams179_g158247 = Out_GlowParams15_g158249;
				float3 lerpResult299_g158247 = lerp( float3( 1,1,1 ) , (Global_GlowParams179_g158247).xyz , TVE_IsEnabled);
				#ifdef TVE_EMISSIVE_ELEMENT
				float3 staticSwitch228_g158247 = lerpResult299_g158247;
				#else
				float3 staticSwitch228_g158247 = temp_cast_7;
				#endif
				half3 Emissive_GlobalMask248_g158247 = staticSwitch228_g158247;
				half3 Local_EmissiveValue88_g158247 = ( _EmissiveIntensityValue * (_EmissiveColor).rgb * Emissive_GlobalMask248_g158247 );
				half3 Emissive_Blend260_g158247 = ( ( (Visual_Emissive255_g158247).xyz * Local_EmissiveColor278_g158247 ) * Local_EmissiveValue88_g158247 );
				float3 temp_output_3_0_g158257 = Emissive_Blend260_g158247;
				float temp_output_15_0_g158257 = _emissive_power_value;
				float3 hdEmission22_g158257 = ASEGetEmissionHDRColor(temp_output_3_0_g158257,temp_output_15_0_g158257,_EmissiveExposureValue,GetInverseCurrentExposureMultiplier());
				float4 appendResult295_g158247 = (float4(hdEmission22_g158257 , Emissive_Mask103_g158247));
				#ifdef TVE_EMISSIVE
				float4 staticSwitch129_g158247 = appendResult295_g158247;
				#else
				float4 staticSwitch129_g158247 = temp_cast_6;
				#endif
				half4 Final_Emissive184_g158247 = staticSwitch129_g158247;
				float4 In_Emissive3_g158259 = Final_Emissive184_g158247;
				float In_Grayscale3_g158259 = Out_Grayscale4_g158258;
				float In_Luminosity3_g158259 = Out_Luminosity4_g158258;
				float temp_output_297_11_g158247 = Out_MultiMask4_g158258;
				float In_MultiMask3_g158259 = temp_output_297_11_g158247;
				float In_AlphaClip3_g158259 = Out_AlphaClip4_g158258;
				float In_AlphaFade3_g158259 = Out_AlphaFade4_g158258;
				float3 In_Translucency3_g158259 = Out_Translucency4_g158258;
				float In_Transmission3_g158259 = Out_Transmission4_g158258;
				float In_Thickness3_g158259 = Out_Thickness4_g158258;
				float In_Diffusion3_g158259 = Out_Diffusion4_g158258;
				Data3_g158259.Dummy = In_Dummy3_g158259;
				Data3_g158259.Albedo = In_Albedo3_g158259;
				Data3_g158259.NormalTS = In_NormalTS3_g158259;
				Data3_g158259.NormalWS = In_NormalWS3_g158259;
				Data3_g158259.Shader = In_Shader3_g158259;
				Data3_g158259.Emissive= In_Emissive3_g158259;
				Data3_g158259.MultiMask = In_MultiMask3_g158259;
				Data3_g158259.Grayscale = In_Grayscale3_g158259;
				Data3_g158259.Luminosity = In_Luminosity3_g158259;
				Data3_g158259.AlphaClip = In_AlphaClip3_g158259;
				Data3_g158259.AlphaFade = In_AlphaFade3_g158259;
				Data3_g158259.Translucency = In_Translucency3_g158259;
				Data3_g158259.Transmission = In_Transmission3_g158259;
				Data3_g158259.Thickness = In_Thickness3_g158259;
				Data3_g158259.Diffusion = In_Diffusion3_g158259;
				TVEVisualData Data4_g158306 = Data3_g158259;
				float Out_Dummy4_g158306 = 0;
				float3 Out_Albedo4_g158306 = float3( 0,0,0 );
				float2 Out_NormalTS4_g158306 = float2( 0,0 );
				float3 Out_NormalWS4_g158306 = float3( 0,0,0 );
				float4 Out_Shader4_g158306 = float4( 0,0,0,0 );
				float4 Out_Emissive4_g158306 = float4( 0,0,0,0 );
				float Out_MultiMask4_g158306 = 0;
				float Out_Grayscale4_g158306 = 0;
				float Out_Luminosity4_g158306 = 0;
				float Out_AlphaClip4_g158306 = 0;
				float Out_AlphaFade4_g158306 = 0;
				float3 Out_Translucency4_g158306 = float3( 0,0,0 );
				float Out_Transmission4_g158306 = 0;
				float Out_Thickness4_g158306 = 0;
				float Out_Diffusion4_g158306 = 0;
				Out_Dummy4_g158306 = Data4_g158306.Dummy;
				Out_Albedo4_g158306 = Data4_g158306.Albedo;
				Out_NormalTS4_g158306 = Data4_g158306.NormalTS;
				Out_NormalWS4_g158306 = Data4_g158306.NormalWS;
				Out_Shader4_g158306 = Data4_g158306.Shader;
				Out_Emissive4_g158306= Data4_g158306.Emissive;
				Out_MultiMask4_g158306 = Data4_g158306.MultiMask;
				Out_Grayscale4_g158306 = Data4_g158306.Grayscale;
				Out_Luminosity4_g158306= Data4_g158306.Luminosity;
				Out_AlphaClip4_g158306 = Data4_g158306.AlphaClip;
				Out_AlphaFade4_g158306 = Data4_g158306.AlphaFade;
				Out_Translucency4_g158306 = Data4_g158306.Translucency;
				Out_Transmission4_g158306 = Data4_g158306.Transmission;
				Out_Thickness4_g158306 = Data4_g158306.Thickness;
				Out_Diffusion4_g158306 = Data4_g158306.Diffusion;
				half3 Visual_Albedo199_g158305 = Out_Albedo4_g158306;
				half3 Final_Albedo312_g158305 = Visual_Albedo199_g158305;
				float3 In_Albedo3_g158307 = Final_Albedo312_g158305;
				float2 In_NormalTS3_g158307 = Out_NormalTS4_g158306;
				float3 In_NormalWS3_g158307 = Out_NormalWS4_g158306;
				float4 In_Shader3_g158307 = Out_Shader4_g158306;
				float4 In_Emissive3_g158307 = Out_Emissive4_g158306;
				float In_Grayscale3_g158307 = Out_Grayscale4_g158306;
				float In_Luminosity3_g158307 = Out_Luminosity4_g158306;
				float temp_output_301_11_g158305 = Out_MultiMask4_g158306;
				float In_MultiMask3_g158307 = temp_output_301_11_g158305;
				float In_AlphaClip3_g158307 = Out_AlphaClip4_g158306;
				float In_AlphaFade3_g158307 = Out_AlphaFade4_g158306;
				float3 temp_cast_8 = (0.0).xxx;
				half3 Subsurface_Color264_g158305 = ( (_SubsurfaceColor).rgb * Visual_Albedo199_g158305 );
				half Visual_Transmission138_g158305 = Out_Transmission4_g158306;
				half Subsurface_Value268_g158305 = _SubsurfaceIntensityValue;
				TVEGlobalData Data15_g158309 = Data204_g157155;
				float Out_Dummy15_g158309 = 0;
				float4 Out_CoatParams15_g158309 = float4( 0,0,0,0 );
				float4 Out_PaintParams15_g158309 = float4( 0,0,0,0 );
				float4 Out_GlowParams15_g158309 = float4( 0,0,0,0 );
				float4 Out_AtmoParams15_g158309 = float4( 0,0,0,0 );
				float4 Out_FadeParams15_g158309 = float4( 0,0,0,0 );
				float4 Out_FormParams15_g158309 = float4( 0,0,0,0 );
				float4 Out_LandParams15_g158309 = float4( 0,0,0,0 );
				float4 Out_WindParams15_g158309 = float4( 0,0,0,0 );
				float4 Out_PushParams15_g158309 = float4( 0,0,0,0 );
				Out_Dummy15_g158309 = Data15_g158309.Dummy;
				Out_CoatParams15_g158309 = Data15_g158309.CoatParams;
				Out_PaintParams15_g158309 = Data15_g158309.PaintParams;
				Out_GlowParams15_g158309 = Data15_g158309.GlowParams;
				Out_AtmoParams15_g158309= Data15_g158309.AtmoParams;
				Out_FadeParams15_g158309= Data15_g158309.FadeParams;
				Out_FormParams15_g158309 = Data15_g158309.FormParams;
				Out_LandParams15_g158309 = Data15_g158309.LandParams;
				Out_WindParams15_g158309 = Data15_g158309.WindParams;
				Out_PushParams15_g158309 = Data15_g158309.PushParams;
				half4 Global_GlowParams373_g158305 = Out_GlowParams15_g158309;
				float lerpResult403_g158305 = lerp( 1.0 , saturate( (Global_GlowParams373_g158305).w ) , TVE_IsEnabled);
				#ifdef TVE_SUBSURFACE_ELEMENT
				float staticSwitch367_g158305 = lerpResult403_g158305;
				#else
				float staticSwitch367_g158305 = 1.0;
				#endif
				half Subsurface_GlobalMask369_g158305 = staticSwitch367_g158305;
				half Visual_MultiMask292_g158305 = temp_output_301_11_g158305;
				float lerpResult293_g158305 = lerp( 1.0 , Visual_MultiMask292_g158305 , _SubsurfaceMultiValue);
				half Subsurface_MultiMask296_g158305 = lerpResult293_g158305;
				half Custom_Mask363_g158305 = 1.0;
				#ifdef TVE_SUBSURFACE
				float staticSwitch345_g158305 = ( Visual_Transmission138_g158305 * Subsurface_Value268_g158305 * Subsurface_GlobalMask369_g158305 * Subsurface_MultiMask296_g158305 * Custom_Mask363_g158305 );
				#else
				float staticSwitch345_g158305 = 0.0;
				#endif
				half Final_Transmission269_g158305 = staticSwitch345_g158305;
				#ifdef TVE_SUBSURFACE
				float3 staticSwitch348_g158305 = ( Subsurface_Color264_g158305 * Final_Transmission269_g158305 * 10.0 );
				#else
				float3 staticSwitch348_g158305 = temp_cast_8;
				#endif
				half3 Final_Translucency254_g158305 = staticSwitch348_g158305;
				float3 In_Translucency3_g158307 = Final_Translucency254_g158305;
				float In_Transmission3_g158307 = Final_Transmission269_g158305;
				#ifdef TVE_SUBSURFACE
				float staticSwitch351_g158305 = _SubsurfaceThicknessValue;
				#else
				float staticSwitch351_g158305 = 1.0;
				#endif
				half Final_Thickness275_g158305 = staticSwitch351_g158305;
				float In_Thickness3_g158307 = Final_Thickness275_g158305;
				float Final_Diffusion340_g158305 = _SubsurfaceDiffusion;
				float In_Diffusion3_g158307 = Final_Diffusion340_g158305;
				Data3_g158307.Dummy = In_Dummy3_g158307;
				Data3_g158307.Albedo = In_Albedo3_g158307;
				Data3_g158307.NormalTS = In_NormalTS3_g158307;
				Data3_g158307.NormalWS = In_NormalWS3_g158307;
				Data3_g158307.Shader = In_Shader3_g158307;
				Data3_g158307.Emissive= In_Emissive3_g158307;
				Data3_g158307.MultiMask = In_MultiMask3_g158307;
				Data3_g158307.Grayscale = In_Grayscale3_g158307;
				Data3_g158307.Luminosity = In_Luminosity3_g158307;
				Data3_g158307.AlphaClip = In_AlphaClip3_g158307;
				Data3_g158307.AlphaFade = In_AlphaFade3_g158307;
				Data3_g158307.Translucency = In_Translucency3_g158307;
				Data3_g158307.Transmission = In_Transmission3_g158307;
				Data3_g158307.Thickness = In_Thickness3_g158307;
				Data3_g158307.Diffusion = In_Diffusion3_g158307;
				TVEVisualData Data4_g158315 = Data3_g158307;
				float Out_Dummy4_g158315 = 0;
				float3 Out_Albedo4_g158315 = float3( 0,0,0 );
				float2 Out_NormalTS4_g158315 = float2( 0,0 );
				float3 Out_NormalWS4_g158315 = float3( 0,0,0 );
				float4 Out_Shader4_g158315 = float4( 0,0,0,0 );
				float4 Out_Emissive4_g158315 = float4( 0,0,0,0 );
				float Out_MultiMask4_g158315 = 0;
				float Out_Grayscale4_g158315 = 0;
				float Out_Luminosity4_g158315 = 0;
				float Out_AlphaClip4_g158315 = 0;
				float Out_AlphaFade4_g158315 = 0;
				float3 Out_Translucency4_g158315 = float3( 0,0,0 );
				float Out_Transmission4_g158315 = 0;
				float Out_Thickness4_g158315 = 0;
				float Out_Diffusion4_g158315 = 0;
				Out_Dummy4_g158315 = Data4_g158315.Dummy;
				Out_Albedo4_g158315 = Data4_g158315.Albedo;
				Out_NormalTS4_g158315 = Data4_g158315.NormalTS;
				Out_NormalWS4_g158315 = Data4_g158315.NormalWS;
				Out_Shader4_g158315 = Data4_g158315.Shader;
				Out_Emissive4_g158315= Data4_g158315.Emissive;
				Out_MultiMask4_g158315 = Data4_g158315.MultiMask;
				Out_Grayscale4_g158315 = Data4_g158315.Grayscale;
				Out_Luminosity4_g158315= Data4_g158315.Luminosity;
				Out_AlphaClip4_g158315 = Data4_g158315.AlphaClip;
				Out_AlphaFade4_g158315 = Data4_g158315.AlphaFade;
				Out_Translucency4_g158315 = Data4_g158315.Translucency;
				Out_Transmission4_g158315 = Data4_g158315.Transmission;
				Out_Thickness4_g158315 = Data4_g158315.Thickness;
				Out_Diffusion4_g158315 = Data4_g158315.Diffusion;
				float4 break24_g158312 = Out_Shader4_g158315;
				
				surfaceDescription.Smoothness = break24_g158312.w;
				surfaceDescription.Alpha = 1;

				#ifdef _ALPHATEST_ON
				surfaceDescription.AlphaClipThreshold = 0;
				#endif

				packedInput.positionCS.zw = positionCS.zw;
				float3 positionRWS = positionWS;
				float3 normalWS = o.Normal;
				float4 tangentWS = packedInput.interp02.xyzw;
				float4 texCoord0 = packedInput.interp03.xyzw;
				float4 texCoord1 = packedInput.interp04.xyzw;
				float4 texCoord2 = packedInput.interp05.xyzw;
				float4 texCoord3 = packedInput.interp06.xyzw;
				float4 vertexColor = packedInput.interp07.xyzw;

				input.positionSS = packedInput.positionCS;
				input.positionRWS = positionRWS;
				//#if defined( ASE_SRP_VERSION ) && ASE_SRP_VERSION < 60900
				//input.worldToTangent = BuildWorldToTangent( tangentWS, normalWS );
				//#else
				input.tangentToWorld = BuildTangentToWorld( tangentWS, normalWS );
				//#endif
				input.texCoord0 = texCoord0;
				input.texCoord1 = texCoord1;
				input.texCoord2 = texCoord2;
				input.texCoord3 = texCoord3;
				input.color = vertexColor;

				PositionInputs posInput = GetPositionInput( input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS );

				float3 normalizedWorldViewDir = GetWorldSpaceNormalizeViewDir( input.positionRWS );

				SurfaceData surfaceData;
				BuiltinData builtinData;

				GetSurfaceAndBuiltinData(surfaceDescription, input, normalizedWorldViewDir, posInput, surfaceData, builtinData);

				outputDepth = posInput.deviceDepth;

				#ifdef WRITE_NORMAL_BUFFER
					EncodeIntoNormalBuffer(ConvertSurfaceDataToNormalData(surfaceData), posInput.positionSS, outNormalBuffer);
					#ifdef WRITE_MSAA_DEPTH
					depthColor = packedInput.positionCS.z;
					#endif
				#endif
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "Motion Vectors"
			Tags { "LightMode"="MotionVectors" }
			Stencil
			{
				Ref 40
				WriteMask 40
				Comp Always
				Pass Replace
			}


			HLSLPROGRAM
			#pragma shader_feature_local_fragment _DISABLE_DECALS
			#pragma shader_feature_local_fragment _DISABLE_SSR
			#define _MATERIAL_FEATURE_TRANSMISSION 1
			#define ASE_SRP_VERSION 140011
			#ifdef UNITY_COLORSPACE_GAMMA//AI_SRP
			#define unity_ColorSpaceDielectricSpec half4(0.220916301, 0.220916301, 0.220916301, 1.0 - 0.220916301)//AI_SRP
			#else//AI_SRP
			#define unity_ColorSpaceDielectricSpec half4(0.04, 0.04, 0.04, 1.0 - 0.04) //AI_SRP
			#endif//AI_SRP
			#define ASE_USING_SAMPLING_MACROS 1

			#pragma vertex Vert
			#pragma fragment Frag

			#if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define OUTPUT_SPLIT_LIGHTING
			#endif

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			//#if defined( ASE_SRP_VERSION ) && ASE_SRP_VERSION < 60900
			//#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Wind.hlsl"
			//#endif
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"

			#define SHADERPASS SHADERPASS_VELOCITY
			#pragma multi_compile _ WRITE_NORMAL_BUFFER
			#pragma multi_compile _ WRITE_MSAA_DEPTH

			#define VARYINGS_NEED_POSITION_WS

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"

			//#if defined( ASE_SRP_VERSION ) && ASE_SRP_VERSION < 60900
			//#define T2W(var, index) var.worldToTangent[index]
			//#else
			#define T2W(var, index) var.tangentToWorld[index]
			//#endif

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/CommonLighting.hlsl"
			#define ai_ObjectToWorld GetObjectToWorldMatrix()
			#define ai_WorldToObject GetWorldToObjectMatrix()
			#define AI_INV_TWO_PI  INV_TWO_PI
			#define AI_PI          PI
			#define AI_INV_PI      INV_PI
			#define ASE_NEEDS_VERT_NORMAL
			#pragma shader_feature_local_fragment TVE_PIPELINE_STANDARD TVE_PIPELINE_UNIVERSAL TVE_PIPELINE_HD
			#pragma shader_feature_local_vertex TVE_MOTION_BASE_BENDING
			#pragma shader_feature_local_vertex TVE_MOTION_WIND_ELEMENT
			#pragma shader_feature_local_fragment TVE_OVERLAY
			#pragma shader_feature_local_fragment TVE_OVERLAY_ELEMENT
			#pragma shader_feature_local_fragment TVE_EMISSIVE
			#pragma shader_feature_local_fragment TVE_EMISSIVE_ELEMENT
			#pragma shader_feature_local_fragment TVE_SUBSURFACE
			#pragma shader_feature_local_fragment TVE_SUBSURFACE_ELEMENT
			  
			struct TVEVisualData
			{  
				half Dummy;  
				half3 Albedo;
				half2 NormalTS;
				half3 NormalWS; 
				half4 Shader;
				half4 Emissive;
				half AlphaClip;
				half AlphaFade;
				half MultiMask;
				half Grayscale;
				half Luminosity;
				half3 Translucency;
				half Transmission;
				half Thickness;
				float Diffusion;
			};  
			    
			struct TVEModelData
			{    
				half Dummy;    
				half3 PositionOS;
				half3 PositionWS;
				half3 PositionWO;
				half3 PositionRawOS;
				half3 PositionAddOS;
				half3 PivotOS;
				half3 PivotWS;
				half3 PivotWO;
				half3 NormalOS;
				half3 NormalWS;
				half3 NormalRawOS;
				half3 NormalRawWS;
				half4 TangentOS;
				half3 ViewDirWS;
				half4 VertexData;
				half4 MotionData;
				half4 BoundsData;
				half4 RotationData;
			};    
			      
			struct TVEGlobalData
			{      
				half Dummy;      
				half4 CoatParams;
				half4 PaintParams;
				half4 GlowParams;
				half4 AtmoParams;
				half4 FadeParams;
				half4 FormParams;
				half4 LandParams;
				half4 WindParams;
				half4 PushParams;
			};      
			        
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END
			//#pragma editor_sync_compilation


			struct AttributesMesh
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 texcoord : TEXCOORD0;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VaryingsMeshToPS
			{
				float4 positionCS : SV_Position;
				float3 positionRWS;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			struct AttributesPass
			{
				float3 previousPositionOS : TEXCOORD4;
			};

			struct VaryingsPassToPS
			{
				float4 positionCS;
				float4 previousPositionCS;
			};

			#define VARYINGS_NEED_PASS
			struct VaryingsToPS
			{
				VaryingsMeshToPS vmesh;
				VaryingsPassToPS vpass;
			};

			struct PackedVaryingsToPS
			{
				float4 vmeshPositionCS : SV_Position;
				float3 vmeshInterp00 : TEXCOORD0;
				float3 vpassInterpolators0 : TEXCOORD1;
				float3 vpassInterpolators1 : TEXCOORD2;
				float4 UVsFrame122_g156549 : TEXCOORD3;
				float4 UVsFrame222_g156549 : TEXCOORD4;
				float4 UVsFrame322_g156549 : TEXCOORD5;
				float4 octaframe22_g156549 : TEXCOORD6;
				float4 viewPos22_g156549 : TEXCOORD7;
				float4 ase_texcoord8 : TEXCOORD8;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START( UnityPerMaterial )
			float4 _DrynessColor;
			half4 _ImpostorColor;
			half4 _ImpostorColorTwo;
			float4 _OverlayGlitterTex_ST;
			half4 _InteractionColoring;
			float4 _AI_SizeOffset;
			half4 _SizeFadeColoring;
			half4 _VariationColoring;
			half4 _VariationColorTwo;
			half4 _VariationColorOne;
			half4 _VariationNoiseRemap;
			half4 _DitherColoring;
			half4 _TintingColoring;
			float4 _TintingColor;
			half4 _TintingLumaRemap;
			half4 _DrynessColoring;
			half4 _CutoutColoring;
			half4 _WetnessColoring;
			half4 _OverlayColor;
			half4 _OverlayProjRemap;
			half4 _DrynessLumaRemap;
			half4 _OverlayLumaRemap;
			half4 _OverlayColoringOn;
			half4 _OverlayColoringOff;
			half4 _SubsurfaceColor;
			half4 _OverlayGlitterColor;
			half4 _EmissiveColor;
			float4 _SubsurfaceDiffusion_Asset;
			half4 _OverlayBlendRemap1;
			float3 _AI_Offset;
			half _GlobalEnd;
			half _CutoutMultiValue;
			half _CutoutAlphaValue;
			half _CutoutNoiseValue;
			half _CutoutNoiseTillingValue;
			half _DitherLiteInfo;
			half _ImpostorMetallicValue;
			half _EmissiveExposureValue;
			float _emissive_power_value;
			half _DitherEnd;
			half _ImpostorColorMode;
			half _DitherConstantValue;
			half _EmissiveIntensityValue;
			half _GlobalLiteInfo;
			half _DitherDistanceValue;
			half _DitherCategory;
			half _DitherDistanceMaxValue;
			half _CutoutShadowMode;
			half _CutoutElementMode;
			half _OverlayIntensityValue;
			half _WetnessCategory;
			half _WetnessEnd;
			half _WetnessElementMode;
			half _WetnessIntensityValue;
			half _WetnessContrastValue;
			half _CutoutIntensityValue;
			half _WetnessSmoothnessValue;
			half _OverlayLumaValue;
			half _CutoutCategory;
			half _CutoutEnd;
			half _SubsurfaceIntensityValue;
			half _CutoutSpace;
			half _ImpostorSmoothnessValue;
			half _CutoutLiteInfo;
			half _OverlayGlitterDistValue;
			half _DitherDistanceMinValue;
			half _DitherShadowMode;
			half _SubsurfaceAmbientValue;
			half _SubsurfaceShadowValue;
			half _SubsurfaceElementMode;
			half _EmissiveCategory;
			half _GlobalCategory;
			half _EmissiveEnd;
			half _SubsurfaceNormalValue;
			half _EmissivePowerMode;
			half _EmissiveElementMode;
			half _OverlayCategory;
			half _OverlayEnd;
			half _OverlaySpace;
			half _OverlayElementMode;
			half _OverlayBakeInfo;
			half _EmissivePowerValue;
			half _OverlaySubsurfaceValue;
			half _SubsurfaceDirectValue;
			half _SubsurfaceCategory;
			half _DitherMultiValue;
			half _DitherNoiseTillingValue;
			half _OverlayProjValue;
			half _OverlaySmoothnessValue;
			half _SizeFadeCategory;
			half _SizeFadeEnd;
			half _SubsurfaceEnd;
			half _SizeFadeElementMode;
			half _SizeFadeScaleMode;
			half _SizeFadeScaleValue;
			half _SizeFadeDistMinValue;
			half _OverlayNormalValue;
			half _WetnessLiteInfo;
			half _SizeFadeDistMaxValue;
			half _SizeFadeIntensityValue;
			half _SizeFadeLiteInfo;
			half _ImpostorAlphaClipValue;
			half _DrynessMultiValue;
			half _RenderMotion;
			half _RenderShadow;
			half _ImpostorCategory;
			half _IsImpostorShader;
			half _IsSubsurfaceShader;
			half _IsLiteShader;
			half _ImpostorEnd;
			half _MotionWindCategory;
			half _MotionWindEnd;
			half _MotionWindElementMode;
			half _MotionInteractionCategory;
			half _MotionInteractionEnd;
			half _InteractionLiteInfo;
			half _MotionPushIntensityValue;
			half _MotionPushPivotValue;
			half _MotionPushMaskValue;
			half _MotionPushElementMode;
			half _IsIdentifier;
			half _IsConverted;
			half _IsCollected;
			half _HasDefaultTextures;
			half _OverlayGlitterTillingValue;
			half _OverlayGlitterIntensityValue;
			half _OverlayLiteInfo;
			half _SubsurfaceScatteringValue;
			half _SubsurfaceAngleValue;
			float _SubsurfaceDiffusion;
			half _SubsurfaceSpace;
			half _IsVersion;
			float _AI_Frames;
			half _RenderDecals;
			half _CategoryRender;
			half _EndRender;
			half _NoiseCategory;
			half _NoiseEnd;
			half _IsInitialized;
			half _IsTVEShader;
			half _IsCustomShader;
			half _IsShared;
			half _RenderSSR;
			half _DrynessLumaValue;
			float _AI_FramesX;
			float _AI_ImpostorSize;
			half _TintingSpace;
			half _TintingElementMode;
			half _TintingIntensityValue;
			half _TintingGrayValue;
			half _TintingMultiValue;
			half _TintingLumaValue;
			half _DrynessLiteInfo;
			half _DrynessCategory;
			half _DrynessEnd;
			half _DrynessSpace;
			half _DrynessElementMode;
			half _DrynessIntensityValue;
			half _SubsurfaceMultiValue;
			half _DrynessGrayValue;
			half _DrynessShiftValue;
			half _DrynessSmoothnessValue;
			half _DrynessSubsurfaceValue;
			half _TintingEnd;
			half _TintingCategory;
			half _TintingLiteInfo;
			half _VariationNoiseTillingValue;
			float _AI_Parallax;
			float _AI_TextureBias;
			float _AI_DepthSize;
			float _AI_ShadowBias;
			float _AI_ShadowView;
			float _AI_Clip;
			half _MotionBaseIntensityValue;
			half _MotionBasePivotValue;
			float _AI_FramesY;
			half _MotionTillingValue;
			half _global_wind_layer_value;
			half _MotionDelayValue;
			half _VariationLiteInfo;
			half _VariationCategory;
			half _VariationEnd;
			half _VariationIntensityValue;
			half _VariationMultiValue;
			half _VariationNoisePivotsValue1;
			half _MotionIntensityValue;
			half _SubsurfaceThicknessValue;
			float _BlendMode;
			CBUFFER_END

			TEXTURE2D(_OverlayGlitterTex);
			SAMPLER(sampler_OverlayGlitterTex);
			TEXTURE3D(_NoiseTex3D);
			SAMPLER(sampler_NoiseTex3D);
			float4x4 unity_CameraProjection;
			float4x4 unity_CameraInvProjection;
			float4x4 unity_WorldToCamera;
			float4x4 unity_CameraToWorld;
			TEXTURE2D(_Albedo);
			SAMPLER(sampler_Albedo);
			TEXTURE2D(_Normals);
			SAMPLER(sampler_Normals);
			float3 TVE_WorldOrigin;
			TEXTURE2D(_MotionNoiseTex);
			SAMPLER(sampler_Linear_Repeat);
			float TVE_WindLayers[10];
			TEXTURE2D_ARRAY(TVE_WindBaseTex);
			half4 TVE_RenderBaseCoords;
			SAMPLER(sampler_Linear_Clamp);
			TEXTURE2D_ARRAY(TVE_WindNearTex);
			half4 TVE_RenderNearCoords;
			float4 TVE_RenderNearPositionR;
			half TVE_RenderNearFadeValue;
			half4 TVE_WindParams;
			half _DisableSRPBatcher;
			TEXTURE2D(_MasksA);
			TEXTURE2D(_MasksB);
			SAMPLER(sampler_MasksA);
			SAMPLER(sampler_MasksB);
			half4 TVE_CoatParams;
			half4 TVE_PaintParams;
			half4 TVE_GlowParams;
			half4 TVE_AtmoParams;
			half4 TVE_FormParams;
			half4 TVE_PushParams;
			half TVE_IsEnabled;


			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"

			float2 VectortoOctahedron( float3 N )
			{
				N /= dot( 1.0, abs( N ) );
				if( N.z <= 0 )
				{
				N.xy = ( 1 - abs( N.yx ) ) * ( N.xy >= 0 ? 1.0 : -1.0 );
				}
				return N.xy;
			}
			
			float3 OctahedronToVector( float2 Oct )
			{
				float3 N = float3( Oct, 1.0 - dot( 1.0, abs( Oct ) ) );
				if(N.z< 0 )
				{
				N.xy = ( 1 - abs( N.yx) ) * (N.xy >= 0 ? 1.0 : -1.0 );
				}
				return normalize( N);
			}
			
			inline void RayPlaneIntersectionUV( float3 normalOS, float3 rayPosition, float3 rayDirection, inout float2 uvs, inout float3 localNormal )
			{
				float lDotN = dot( rayDirection, normalOS ); 
				float p0l0DotN = dot( -rayPosition, normalOS );
				float t = p0l0DotN / lDotN;
				float3 p = rayDirection * t + rayPosition;
				float3 upVector = float3( 0, 1, 0 );
				float3 tangent = normalize( cross( upVector, normalOS ) + float3( -0.001, 0, 0 ) );
				float3 bitangent = cross( tangent, normalOS );
				float frameX = dot( p, tangent );
				float frameZ = dot( p, bitangent );
				uvs = -float2( frameX, frameZ );
				if( t <= 0.0 )
				uvs = 0;
				float3x3 worldToLocal = float3x3( tangent, bitangent, normalOS );
				localNormal = normalize( mul( worldToLocal, rayDirection ) );
			}
			
			inline void OctaImpostorVertex( inout float4 positionOS, inout float3 normalOS, inout float4 uvsFrame1, inout float4 uvsFrame2, inout float4 uvsFrame3, inout float4 octaFrame, inout float4 viewPos )
			{
				float2 uvOffset = _AI_SizeOffset.zw;
				float parallax = -_AI_Parallax; 
				float UVscale = _AI_ImpostorSize;
				float framesXY = _AI_Frames;
				float prevFrame = framesXY - 1;
				float3 fractions = 1.0 / float3( framesXY, prevFrame, UVscale );
				float fractionsFrame = fractions.x;
				float fractionsPrevFrame = fractions.y;
				float fractionsUVscale = fractions.z;
				float3 worldCameraPos;
				#if defined(UNITY_PASS_SHADOWCASTER)
				float3 worldOrigin = 0;
				float4 perspective = float4( 0, 0, 0, 1 );
				if ( UNITY_MATRIX_P[ 3 ][ 3 ] == 1 )
				{
				perspective = float4( 0, 0, 5000, 0 );
				worldOrigin = ai_ObjectToWorld._m03_m13_m23;
				}
				worldCameraPos = worldOrigin + mul( UNITY_MATRIX_I_V, perspective ).xyz;
				#else
				if ( UNITY_MATRIX_P[ 3 ][ 3 ] == 1 )
				{
				worldCameraPos = ai_ObjectToWorld._m03_m13_m23 + UNITY_MATRIX_I_V._m02_m12_m22 * 5000;
				}
				else
				{
				worldCameraPos = GetCameraRelativePositionWS( _WorldSpaceCameraPos );
				}
				#endif
				float3 objectCameraPosition = mul( ai_WorldToObject, float4( worldCameraPos, 1 ) ).xyz - _AI_Offset.xyz; 
				float3 objectCameraDirection = normalize( objectCameraPosition );
				float3 upVector = float3( 0,1,0 );
				float3 objectHorizontalVector = normalize( cross( objectCameraDirection, upVector ) );
				float3 objectVerticalVector = cross( objectHorizontalVector, objectCameraDirection );
				float2 uvExpansion = positionOS.xy;
				float3 billboard = objectHorizontalVector * uvExpansion.x + objectVerticalVector * uvExpansion.y;
				float3 localDir = billboard - objectCameraPosition; 
				objectCameraDirection = trunc( objectCameraDirection * 65536.0 ) / 65536.0;
				float2 frameOcta = VectortoOctahedron( objectCameraDirection.xzy ) * 0.5 + 0.5;
				float2 prevOctaFrame = frameOcta * prevFrame;
				float2 baseOctaFrame = floor( prevOctaFrame );
				float2 fractionOctaFrame = ( baseOctaFrame * fractionsFrame );
				float2 octaFrame1 = ( baseOctaFrame * fractionsPrevFrame ) * 2.0 - 1.0;
				float3 octa1WorldY = OctahedronToVector( octaFrame1 ).xzy;
				float3 octa1LocalY;
				float2 uvFrame1;
				RayPlaneIntersectionUV( octa1WorldY, objectCameraPosition, localDir, /*inout*/ uvFrame1, /*inout*/ octa1LocalY );
				float2 uvParallax1 = octa1LocalY.xy * fractionsFrame * parallax;
				uvFrame1 = ( uvFrame1 * fractionsUVscale + 0.5 ) * fractionsFrame + fractionOctaFrame;
				uvsFrame1 = float4( uvParallax1, uvFrame1) - float4( 0, 0, uvOffset );
				float2 fractPrevOctaFrame = frac( prevOctaFrame );
				float2 cornerDifference = lerp( float2( 0,1 ) , float2( 1,0 ) , saturate( ceil( ( fractPrevOctaFrame.x - fractPrevOctaFrame.y ) ) ));
				float2 octaFrame2 = ( ( baseOctaFrame + cornerDifference ) * fractionsPrevFrame ) * 2.0 - 1.0;
				float3 octa2WorldY = OctahedronToVector( octaFrame2 ).xzy;
				float3 octa2LocalY;
				float2 uvFrame2;
				RayPlaneIntersectionUV( octa2WorldY, objectCameraPosition, localDir, /*inout*/ uvFrame2, /*inout*/ octa2LocalY );
				float2 uvParallax2 = octa2LocalY.xy * fractionsFrame * parallax;
				uvFrame2 = ( uvFrame2 * fractionsUVscale + 0.5 ) * fractionsFrame + ( ( cornerDifference * fractionsFrame ) + fractionOctaFrame );
				uvsFrame2 = float4( uvParallax2, uvFrame2) - float4( 0, 0, uvOffset );
				float2 octaFrame3 = ( ( baseOctaFrame + 1 ) * fractionsPrevFrame  ) * 2.0 - 1.0;
				float3 octa3WorldY = OctahedronToVector( octaFrame3 ).xzy;
				float3 octa3LocalY;
				float2 uvFrame3;
				RayPlaneIntersectionUV( octa3WorldY, objectCameraPosition, localDir, /*inout*/ uvFrame3, /*inout*/ octa3LocalY );
				float2 uvParallax3 = octa3LocalY.xy * fractionsFrame * parallax;
				uvFrame3 = ( uvFrame3 * fractionsUVscale + 0.5 ) * fractionsFrame + ( fractionOctaFrame + fractionsFrame );
				uvsFrame3 = float4( uvParallax3, uvFrame3) - float4( 0, 0, uvOffset );
				octaFrame = 0;
				octaFrame.xy = prevOctaFrame;
				octaFrame.zw = fractionOctaFrame;
				positionOS.xyz = billboard + _AI_Offset.xyz;
				normalOS.xyz = objectCameraDirection;
				viewPos = 0;
				viewPos.xyz = TransformWorldToView( TransformObjectToWorld( positionOS.xyz ) );
			}
			
			float3 ObjectPosition_UNITY_MATRIX_M(  )
			{
				return float3(UNITY_MATRIX_M[0].w, UNITY_MATRIX_M[1].w, UNITY_MATRIX_M[2].w );
			}
			
			inline void OctaImpostorFragment( inout SurfaceOutput o, out float4 positionCS, out float3 positionWS, float4 uvsFrame1, float4 uvsFrame2, float4 uvsFrame3, float4 octaFrame, float4 interpViewPos, out float4 output0, out float4 output1 )
			{
				float depthBias = -1.0;
				float textureBias = _AI_TextureBias;
				float2 fraction = frac( octaFrame.xy );
				float2 invFraction = 1 - fraction;
				float3 weights;
				weights.x = min( invFraction.x, invFraction.y );
				weights.y = abs( fraction.x - fraction.y );
				weights.z = min( fraction.x, fraction.y );
				float4 parallaxSample1 = SAMPLE_TEXTURE2D_BIAS( _Normals, sampler_Normals, uvsFrame1.zw, depthBias );
				float2 parallax1 = ( ( 0.5 - parallaxSample1.a ) * uvsFrame1.xy ) + uvsFrame1.zw;
				float4 parallaxSample2 = SAMPLE_TEXTURE2D_BIAS( _Normals, sampler_Normals, uvsFrame2.zw, depthBias );
				float2 parallax2 = ( ( 0.5 - parallaxSample2.a ) * uvsFrame2.xy ) + uvsFrame2.zw;
				float4 parallaxSample3 = SAMPLE_TEXTURE2D_BIAS( _Normals, sampler_Normals, uvsFrame3.zw, depthBias );
				float2 parallax3 = ( ( 0.5 - parallaxSample3.a ) * uvsFrame3.xy ) + uvsFrame3.zw;
				float4 albedo1 = SAMPLE_TEXTURE2D_BIAS( _Albedo, sampler_Albedo, parallax1, textureBias );
				float4 albedo2 = SAMPLE_TEXTURE2D_BIAS( _Albedo, sampler_Albedo, parallax2, textureBias );
				float4 albedo3 = SAMPLE_TEXTURE2D_BIAS( _Albedo, sampler_Albedo, parallax3, textureBias );
				float4 blendedAlbedo = albedo1 * weights.x + albedo2 * weights.y + albedo3 * weights.z;
				o.Alpha = ( blendedAlbedo.a - _AI_Clip );
				clip( o.Alpha );
				float t = ceil( fraction.x - fraction.y );
				float4 cornerDifference = float4( t, 1 - t, 1, 1 );
				float2 step_1 = ( parallax1 - octaFrame.zw ) * _AI_Frames;
				float4 step23 = ( float4( parallax2, parallax3 ) -  octaFrame.zwzw ) * _AI_Frames - cornerDifference;
				step_1 = step_1 * (1-step_1);
				step23 = step23 * (1-step23);
				float3 steps;
				steps.x = step_1.x * step_1.y;
				steps.y = step23.x * step23.y;
				steps.z = step23.z * step23.w;
				steps = step(-steps, 0);
				float final = dot( steps, weights );
				clip( final - 0.5 );
				o.Albedo = blendedAlbedo.rgb;
				#if defined(AI_HD_RENDERPIPELINE)
				float4 feat1 = _Features.SampleLevel( SamplerState_Point_Repeat, parallax1, 0);
				o.Diffusion = feat1.rgb;
				o.Features = feat1.a;
				float4 test1 = _Specular.SampleLevel( SamplerState_Point_Repeat, parallax1, 0);
				o.MetalTangent = test1.b;
				#endif
				float4 normals1 = SAMPLE_TEXTURE2D_BIAS( _Normals, sampler_Normals, parallax1, textureBias );
				float4 normals2 = SAMPLE_TEXTURE2D_BIAS( _Normals, sampler_Normals, parallax2, textureBias );
				float4 normals3 = SAMPLE_TEXTURE2D_BIAS( _Normals, sampler_Normals, parallax3, textureBias );
				float4 blendedNormal = normals1 * weights.x  + normals2 * weights.y + normals3 * weights.z;
				float4 output0a = SAMPLE_TEXTURE2D_BIAS( _MasksA, sampler_MasksA, parallax1, textureBias );
				float4 output0b = SAMPLE_TEXTURE2D_BIAS( _MasksA, sampler_MasksA, parallax2, textureBias );
				float4 output0c = SAMPLE_TEXTURE2D_BIAS( _MasksA, sampler_MasksA, parallax3, textureBias );
				output0 = output0a * weights.x  + output0b * weights.y + output0c * weights.z; 
				float4 output1a = SAMPLE_TEXTURE2D_BIAS( _MasksB, sampler_MasksB, parallax1, textureBias );
				float4 output1b = SAMPLE_TEXTURE2D_BIAS( _MasksB, sampler_MasksB, parallax2, textureBias );
				float4 output1c = SAMPLE_TEXTURE2D_BIAS( _MasksB, sampler_MasksB, parallax3, textureBias );
				output1 = output1a * weights.x  + output1b * weights.y + output1c * weights.z; 
				float3 localNormal = blendedNormal.rgb * 2.0 - 1.0;
				float3 worldNormal = normalize( mul( (float3x3)ai_ObjectToWorld, localNormal ) );
				o.Normal = worldNormal;
				float3 viewPos = interpViewPos.xyz;
				float depthOffset = ( ( parallaxSample1.a * weights.x + parallaxSample2.a * weights.y + parallaxSample3.a * weights.z ) - 0.5 /** 2.0 - 1.0*/ ) /** 0.5*/ * _AI_DepthSize * length( ai_ObjectToWorld[ 2 ].xyz );
				#if ( defined(SHADERPASS) && ((defined(SHADERPASS_SHADOWS) && SHADERPASS == SHADERPASS_SHADOWS) || (defined(SHADERPASS_SHADOWCASTER) && SHADERPASS == SHADERPASS_SHADOWCASTER)) ) || defined(UNITY_PASS_SHADOWCASTER)
				viewPos.z += depthOffset * _AI_ShadowView;
				viewPos.z += -_AI_ShadowBias;
				#else 
				viewPos.z += depthOffset;
				#endif
				positionWS = mul( UNITY_MATRIX_I_V, float4( viewPos.xyz, 1 ) ).xyz;
				positionCS = mul( UNITY_MATRIX_P, float4( viewPos, 1 ) );
				#if defined(UNITY_PASS_SHADOWCASTER) && !defined(SHADERPASS)
				#if UNITY_REVERSED_Z
				positionCS.z = min( positionCS.z, positionCS.w * UNITY_NEAR_CLIP_VALUE );
				#else
				positionCS.z = max( positionCS.z, positionCS.w * UNITY_NEAR_CLIP_VALUE );
				#endif
				#endif
				positionCS.xyz /= positionCS.w;
				if( UNITY_NEAR_CLIP_VALUE < 0 )
				positionCS = positionCS * 0.5 + 0.5;
			}
			
			float3 ASEGetEmissionHDRColor(float3 ldrColor, float luminanceIntensity, float exposureWeight, float inverseCurrentExposureMultiplier)
			{
				float3 hdrColor = ldrColor * luminanceIntensity;
				hdrColor = lerp( hdrColor* inverseCurrentExposureMultiplier, hdrColor, exposureWeight);
				return hdrColor;
			}
			

			void BuildSurfaceData(FragInputs fragInputs, inout SmoothSurfaceDescription surfaceDescription, float3 V, out SurfaceData surfaceData, out float3 bentNormalWS)
			{
				ZERO_INITIALIZE(SurfaceData, surfaceData);

				surfaceData.perceptualSmoothness =      surfaceDescription.Smoothness;

				surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;
				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
					surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
				#endif
				#ifdef _MATERIAL_FEATURE_TRANSMISSION
					surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
				#endif
				#ifdef _MATERIAL_FEATURE_ANISOTROPY
					surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;
				#endif

				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
					surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
				#endif
				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
					surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
				#endif

				#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
					surfaceData.baseColor *= (1.0 - Max3(surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b));
				#endif

				GetNormalWS( fragInputs, float3( 0.0, 0.0, 1.0 ), surfaceData.normalWS, float3( 1.0, 1.0, 1.0 ) );
				bentNormalWS = surfaceData.normalWS;

				surfaceData.geomNormalWS = T2W(fragInputs, 2);

				#ifdef _HAS_REFRACTION
					if (_EnableSSRefraction)
					{

						surfaceData.transmittanceMask = (1.0 - surfaceDescription.Alpha);
						surfaceDescription.Alpha = 1.0;
					}
					else
					{
						surfaceData.ior = 1.0;
						surfaceData.transmittanceColor = float3(1.0, 1.0, 1.0);
						surfaceData.atDistance = 1.0;
						surfaceData.transmittanceMask = 0.0;
						surfaceDescription.Alpha = 1.0;
					}
				#else
					surfaceData.ior = 1.0;
					surfaceData.transmittanceColor = float3(1.0, 1.0, 1.0);
					surfaceData.atDistance = 1.0;
					surfaceData.transmittanceMask = 0.0;
				#endif

					surfaceData.tangentWS = normalize(T2W(fragInputs, 0).xyz);    // The tangent is not normalize in worldToTangent for mikkt. TODO: Check if it expected that we normalize with Morten. Tag: SURFACE_GRADIENT
					surfaceData.tangentWS = Orthonormalize(surfaceData.tangentWS, surfaceData.normalWS);

				#if defined(_SPECULAR_OCCLUSION_CUSTOM)
				#elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
					surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO(V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness(surfaceData.perceptualSmoothness));
				#elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
					surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion(ClampNdotV(dot(surfaceData.normalWS, V)), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness(surfaceData.perceptualSmoothness));
				#else
					surfaceData.specularOcclusion = 1.0;
				#endif
				#ifdef _ENABLE_GEOMETRIC_SPECULAR_AA
					surfaceData.perceptualSmoothness = GeometricNormalFiltering(surfaceData.perceptualSmoothness, T2W(fragInputs, 2), surfaceDescription.SpecularAAScreenSpaceVariance, surfaceDescription.SpecularAAThreshold);
				#endif
			}

			void GetSurfaceAndBuiltinData( SmoothSurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
			{
				//#ifdef LOD_FADE_CROSSFADE
				//	uint3 fadeMaskSeed = asuint((int3)(V * _ScreenSize.xyx));
				//	LODDitheringTransition(fadeMaskSeed, unity_LODFade.x);
				//#endif

				#ifdef _ALPHATEST_ON
					DoAlphaTest ( surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold );
				#endif
					float3 bentNormalWS;
					BuildSurfaceData(fragInputs, surfaceDescription, V, surfaceData, bentNormalWS);

				#if HAVE_DECALS
				if( _EnableDecals )
				{
					DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, surfaceDescription.Alpha);
					ApplyDecalToSurfaceData(decalSurfaceData, fragInputs.tangentToWorld[2], surfaceData);
				}
				#endif

				#if defined( ASE_SRP_VERSION ) && ASE_SRP_VERSION <= 50702
					InitBuiltinData( surfaceDescription.Alpha, bentNormalWS, -T2W(fragInputs, 2), fragInputs.positionRWS, fragInputs.texCoord1, fragInputs.texCoord2, builtinData );
				#else
					InitBuiltinData( posInput, surfaceDescription.Alpha, bentNormalWS, -T2W(fragInputs, 2), fragInputs.texCoord1, fragInputs.texCoord2, builtinData );
				#endif

				builtinData.depthOffset = 0.0;

				#if (SHADERPASS == SHADERPASS_DISTORTION)
					builtinData.distortion = surfaceDescription.Distortion;
					builtinData.distortionBlur = surfaceDescription.DistortionBlur;
				#else
					builtinData.distortion = float2(0.0, 0.0);
					builtinData.distortionBlur = 0.0;
				#endif

				PostInitBuiltinData(V, posInput, surfaceData, builtinData);
			}

			VaryingsPassToPS UnpackVaryingsPassToPS(PackedVaryingsToPS input)
			{
				VaryingsPassToPS output;
				output.positionCS = float4(input.vpassInterpolators0.xy, 0.0, input.vpassInterpolators0.z);
				output.previousPositionCS = float4(input.vpassInterpolators1.xy, 0.0, input.vpassInterpolators1.z);

				return output;
			}

#if UNITY_VERSION < 201930
			float3 TransformPreviousObjectToWorldNormal(float3 normalOS)
			{
			#ifdef UNITY_ASSUME_UNIFORM_SCALING
				return normalize(mul((float3x3)unity_MatrixPreviousM, normalOS));
			#else
				return normalize(mul(normalOS, (float3x3)unity_MatrixPreviousMI));
			#endif
			}

			float3 TransformPreviousObjectToWorld(float3 positionOS)
			{
				float4x4 previousModelMatrix = ApplyCameraTranslationToMatrix(unity_MatrixPreviousM);
				return mul(previousModelMatrix, float4(positionOS, 1.0)).xyz;
			}
#endif

			void VelocityPositionZBias(VaryingsToPS input)
			{
			#if defined(UNITY_REVERSED_Z)
				input.vmesh.positionCS.z -= unity_MotionVectorsParams.z * input.vmesh.positionCS.w;
			#else
				input.vmesh.positionCS.z += unity_MotionVectorsParams.z * input.vmesh.positionCS.w;
			#endif
			}

			PackedVaryingsToPS Vert(AttributesMesh inputMesh, AttributesPass inputPass  )
			{
				PackedVaryingsToPS outputPackedVaryingsToPS;
				VaryingsToPS varyingsType;
				VaryingsMeshToPS outputVaryingsMeshToPS;

				ZERO_INITIALIZE( PackedVaryingsToPS, outputPackedVaryingsToPS );
				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, outputVaryingsMeshToPS);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(outputVaryingsMeshToPS);

				TVEModelData Data16_g158299 = (TVEModelData)0;
				float In_Dummy16_g158299 = 0.0;
				TVEModelData Data16_g158264 = (TVEModelData)0;
				half4 Dummy181_g158262 = ( ( _MotionWindCategory + _MotionWindEnd ) + _MotionWindElementMode + ( _MotionInteractionCategory + _MotionInteractionEnd ) + ( _InteractionLiteInfo + _InteractionColoring + _MotionPushIntensityValue + _MotionPushPivotValue + _MotionPushMaskValue + _MotionPushElementMode ) );
				float In_Dummy16_g158264 = Dummy181_g158262.r;
				TVEModelData Data16_g157153 = (TVEModelData)0;
				float In_Dummy16_g157153 = 0.0;
				OctaImpostorVertex( inputMesh.positionOS, inputMesh.normalOS, outputPackedVaryingsToPS.UVsFrame122_g156549, outputPackedVaryingsToPS.UVsFrame222_g156549, outputPackedVaryingsToPS.UVsFrame322_g156549, outputPackedVaryingsToPS.octaframe22_g156549, outputPackedVaryingsToPS.viewPos22_g156549 );
				float3 worldPosOut22_g156549 = GetAbsolutePositionWS( mul( UNITY_MATRIX_I_V, float4( outputPackedVaryingsToPS.viewPos22_g156549.xyz, 1.0 ) ).xyz );
				half3 Input_PositionWS218_g157146 = worldPosOut22_g156549;
				float3 worldToObj278_g157146 = mul( GetWorldToObjectMatrix(), float4( GetCameraRelativePositionWS(Input_PositionWS218_g157146), 1 ) ).xyz;
				half3 Model_PositionOS131_g157146 = worldToObj278_g157146;
				float3 In_PositionOS16_g157153 = Model_PositionOS131_g157146;
				half3 Model_PositionWS122_g157146 = Input_PositionWS218_g157146;
				float3 In_PositionWS16_g157153 = Model_PositionWS122_g157146;
				half3 Model_PositionWO132_g157146 = ( Model_PositionWS122_g157146 - TVE_WorldOrigin );
				float3 In_PositionWO16_g157153 = Model_PositionWO132_g157146;
				float3 In_PositionRawOS16_g157153 = Model_PositionOS131_g157146;
				float3 In_PositionAddOS16_g157153 = float3( 0,0,0 );
				float3 In_PivotOS16_g157153 = float3( 0,0,0 );
				float3 localObjectPosition_UNITY_MATRIX_M14_g157148 = ObjectPosition_UNITY_MATRIX_M();
				#ifdef SHADEROPTIONS_CAMERA_RELATIVE_RENDERING
				float3 staticSwitch13_g157148 = ( localObjectPosition_UNITY_MATRIX_M14_g157148 + _WorldSpaceCameraPos );
				#else
				float3 staticSwitch13_g157148 = localObjectPosition_UNITY_MATRIX_M14_g157148;
				#endif
				half3 ObjectData20_g157150 = staticSwitch13_g157148;
				float3 ase_worldPos = GetAbsolutePositionWS( TransformObjectToWorld( (inputMesh.positionOS).xyz ) );
				half3 WorldData19_g157150 = ase_worldPos;
				#ifdef TVE_OBJECT_BATCHED
				float3 staticSwitch14_g157150 = WorldData19_g157150;
				#else
				float3 staticSwitch14_g157150 = ObjectData20_g157150;
				#endif
				float3 temp_output_124_0_g157148 = staticSwitch14_g157150;
				float3 vertexToFrag281_g157146 = temp_output_124_0_g157148;
				half3 Model_PivotWS121_g157146 = vertexToFrag281_g157146;
				float3 In_PivotWS16_g157153 = Model_PivotWS121_g157146;
				half3 Model_PivotWO133_g157146 = ( Model_PivotWS121_g157146 - TVE_WorldOrigin );
				float3 In_PivotWO16_g157153 = Model_PivotWO133_g157146;
				half3 Model_NormalOS134_g157146 = inputMesh.normalOS;
				float3 In_NormalOS16_g157153 = Model_NormalOS134_g157146;
				float3 ase_worldNormal = TransformObjectToWorldNormal(inputMesh.normalOS);
				half3 Model_Normal_WS95_g157146 = ase_worldNormal;
				float3 In_NormalWS16_g157153 = Model_Normal_WS95_g157146;
				float3 In_NormalRawOS16_g157153 = Model_NormalOS134_g157146;
				float3 In_NormalRawWS16_g157153 = Model_Normal_WS95_g157146;
				float4 In_TangentOS16_g157153 = float4( 0,1,0,1 );
				float3 normalizeResult326_g157146 = normalize( ( _WorldSpaceCameraPos - Model_PositionWS122_g157146 ) );
				half3 Model_ViewDirWS322_g157146 = normalizeResult326_g157146;
				float3 In_ViewDirWS16_g157153 = Model_ViewDirWS322_g157146;
				float4 In_VertexData16_g157153 = float4( 1,1,1,1 );
				float4 In_MotionData16_g157153 = float4( 0,0,0,0 );
				float4 In_BoundsData16_g157153 = float4( 1,1,1,1 );
				float4 In_RotationData16_g157153 = float4( 0,0,0,0 );
				Data16_g157153.Dummy = In_Dummy16_g157153;
				Data16_g157153.PositionOS = In_PositionOS16_g157153;
				Data16_g157153.PositionWS = In_PositionWS16_g157153;
				Data16_g157153.PositionWO = In_PositionWO16_g157153;
				Data16_g157153.PositionRawOS = In_PositionRawOS16_g157153;
				Data16_g157153.PositionAddOS = In_PositionAddOS16_g157153;
				Data16_g157153.PivotOS = In_PivotOS16_g157153;
				Data16_g157153.PivotWS = In_PivotWS16_g157153;
				Data16_g157153.PivotWO = In_PivotWO16_g157153;
				Data16_g157153.NormalOS = In_NormalOS16_g157153;
				Data16_g157153.NormalWS = In_NormalWS16_g157153;
				Data16_g157153.NormalRawOS = In_NormalRawOS16_g157153;
				Data16_g157153.NormalRawWS = In_NormalRawWS16_g157153;
				Data16_g157153.TangentOS = In_TangentOS16_g157153;
				Data16_g157153.ViewDirWS = In_ViewDirWS16_g157153;
				Data16_g157153.VertexData = In_VertexData16_g157153;
				Data16_g157153.MotionData = In_MotionData16_g157153;
				Data16_g157153.BoundsData = In_BoundsData16_g157153;
				Data16_g157153.RotationData = In_RotationData16_g157153;
				TVEModelData Data15_g158263 = Data16_g157153;
				float Out_Dummy15_g158263 = 0;
				float3 Out_PositionOS15_g158263 = float3( 0,0,0 );
				float3 Out_PositionWS15_g158263 = float3( 0,0,0 );
				float3 Out_PositionWO15_g158263 = float3( 0,0,0 );
				float3 Out_PositionRawOS15_g158263 = float3( 0,0,0 );
				float3 Out_PositionAddOS15_g158263 = float3( 0,0,0 );
				float3 Out_PivotOS15_g158263 = float3( 0,0,0 );
				float3 Out_PivotWS15_g158263 = float3( 0,0,0 );
				float3 Out_PivotWO15_g158263 = float3( 0,0,0 );
				float3 Out_NormalOS15_g158263 = float3( 0,0,0 );
				float3 Out_NormalWS15_g158263 = float3( 0,0,0 );
				float3 Out_NormalRawOS15_g158263 = float3( 0,0,0 );
				float3 Out_NormalRawWS15_g158263 = float3( 0,0,0 );
				float4 Out_TangentOS15_g158263 = float4( 0,0,0,0 );
				float3 Out_ViewDirWS15_g158263 = float3( 0,0,0 );
				float4 Out_VertexData15_g158263 = float4( 0,0,0,0 );
				float4 Out_MotionData15_g158263 = float4( 0,0,0,0 );
				float4 Out_BoundsData15_g158263 = float4( 0,0,0,0 );
				float4 Out_RotationData15_g158263 = float4( 0,0,0,0 );
				Out_Dummy15_g158263 = Data15_g158263.Dummy;
				Out_PositionOS15_g158263 = Data15_g158263.PositionOS;
				Out_PositionWS15_g158263 = Data15_g158263.PositionWS;
				Out_PositionWO15_g158263 = Data15_g158263.PositionWO;
				Out_PositionRawOS15_g158263 = Data15_g158263.PositionRawOS;
				Out_PositionAddOS15_g158263 = Data15_g158263.PositionAddOS;
				Out_PivotOS15_g158263 = Data15_g158263.PivotOS;
				Out_PivotWS15_g158263 = Data15_g158263.PivotWS;
				Out_PivotWO15_g158263 = Data15_g158263.PivotWO;
				Out_NormalOS15_g158263 = Data15_g158263.NormalOS;
				Out_NormalWS15_g158263 = Data15_g158263.NormalWS;
				Out_NormalRawOS15_g158263 = Data15_g158263.NormalRawOS;
				Out_NormalRawWS15_g158263 = Data15_g158263.NormalRawWS;
				Out_TangentOS15_g158263 = Data15_g158263.TangentOS;
				Out_ViewDirWS15_g158263 = Data15_g158263.ViewDirWS;
				Out_VertexData15_g158263 = Data15_g158263.VertexData;
				Out_MotionData15_g158263 = Data15_g158263.MotionData;
				Out_BoundsData15_g158263 = Data15_g158263.BoundsData;
				Out_RotationData15_g158263 = Data15_g158263.RotationData;
				float3 temp_output_1567_0_g158262 = Out_PositionOS15_g158263;
				float3 In_PositionOS16_g158264 = temp_output_1567_0_g158262;
				float3 In_PositionWS16_g158264 = Out_PositionWS15_g158263;
				float3 temp_output_1567_17_g158262 = Out_PositionWO15_g158263;
				float3 In_PositionWO16_g158264 = temp_output_1567_17_g158262;
				float3 In_PositionRawOS16_g158264 = Out_PositionRawOS15_g158263;
				float3 In_PositionAddOS16_g158264 = Out_PositionAddOS15_g158263;
				float3 In_PivotOS16_g158264 = Out_PivotOS15_g158263;
				float3 In_PivotWS16_g158264 = Out_PivotWS15_g158263;
				float3 temp_output_1567_19_g158262 = Out_PivotWO15_g158263;
				float3 In_PivotWO16_g158264 = temp_output_1567_19_g158262;
				float3 In_NormalOS16_g158264 = Out_NormalOS15_g158263;
				float3 In_NormalWS16_g158264 = Out_NormalWS15_g158263;
				float3 In_NormalRawOS16_g158264 = Out_NormalRawOS15_g158263;
				float3 In_NormalRawWS16_g158264 = Out_NormalRawWS15_g158263;
				float4 In_TangentOS16_g158264 = Out_TangentOS15_g158263;
				float3 In_ViewDirWS16_g158264 = Out_ViewDirWS15_g158263;
				float4 In_VertexData16_g158264 = Out_VertexData15_g158263;
				float4 In_MotionData16_g158264 = Out_MotionData15_g158263;
				float4 In_BoundsData16_g158264 = Out_BoundsData15_g158263;
				float2 temp_cast_1 = (0.0).xx;
				half3 Model_PositionOS147_g158262 = temp_output_1567_0_g158262;
				half Base_Mask217_g158262 = saturate( ( Model_PositionOS147_g158262.y / _AI_Offset.y ) );
				half3 Model_PositionWO162_g158262 = temp_output_1567_17_g158262;
				half3 Model_PivotWO402_g158262 = temp_output_1567_19_g158262;
				float3 lerpResult829_g158262 = lerp( Model_PositionWO162_g158262 , Model_PivotWO402_g158262 , _MotionBasePivotValue);
				half3 Base_Position1394_g158262 = lerpResult829_g158262;
				half3 Input_PositionWO419_g158267 = Base_Position1394_g158262;
				half Flow_Tillling1397_g158262 = _MotionTillingValue;
				half Input_MotionTilling321_g158267 = ( Flow_Tillling1397_g158262 + 0.2 );
				half2 Noise_Coord515_g158267 = ( -(Input_PositionWO419_g158267).xz * Input_MotionTilling321_g158267 * 0.005 );
				half4 Noise_Params535_g158267 = SAMPLE_TEXTURE2D_LOD( _MotionNoiseTex, sampler_Linear_Repeat, Noise_Coord515_g158267, 0.0 );
				float2 temp_output_648_0_g158267 = (Noise_Params535_g158267).rg;
				half Flow_Value1602_g158262 = _MotionIntensityValue;
				half Input_MotionValue629_g158267 = Flow_Value1602_g158262;
				float2 lerpResult645_g158267 = lerp( float2( 0.5,0.5 ) , temp_output_648_0_g158267 , Input_MotionValue629_g158267);
				float3 appendResult566_g158267 = (float3(lerpResult645_g158267 , (Noise_Params535_g158267).b));
				float temp_output_136_0_g158268 = _global_wind_layer_value;
				float temp_output_19_0_g158270 = TVE_WindLayers[(int)temp_output_136_0_g158268];
				half3 Input_Position180_g158271 = Input_PositionWO419_g158267;
				float2 temp_output_75_0_g158271 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g158271).xz ) );
				float temp_output_82_0_g158271 = temp_output_136_0_g158268;
				float2 temp_output_119_0_g158271 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g158271).xz ) );
				float temp_output_7_0_g158276 = 1.0;
				float temp_output_10_0_g158276 = ( TVE_RenderNearFadeValue - temp_output_7_0_g158276 );
				float4 lerpResult131_g158271 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_WindBaseTex, sampler_Linear_Clamp, temp_output_75_0_g158271,temp_output_82_0_g158271, 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_WindNearTex, sampler_Linear_Repeat, temp_output_119_0_g158271,temp_output_82_0_g158271, 0.0 ) , saturate( ( ( saturate( ( distance( Input_Position180_g158271 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g158276 ) / temp_output_10_0_g158276 ) ));
				float4 temp_output_17_0_g158270 = lerpResult131_g158271;
				float4 temp_output_3_0_g158270 = TVE_WindParams;
				float4 ifLocalVar18_g158270 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g158270 >= 0.5 )
				ifLocalVar18_g158270 = temp_output_17_0_g158270;
				else
				ifLocalVar18_g158270 = temp_output_3_0_g158270;
				float4 lerpResult22_g158270 = lerp( temp_output_3_0_g158270 , temp_output_17_0_g158270 , temp_output_19_0_g158270);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g158270 = lerpResult22_g158270;
				#else
				float4 staticSwitch24_g158270 = ifLocalVar18_g158270;
				#endif
				float4 temp_output_610_0_g158267 = staticSwitch24_g158270;
				float3 appendResult643_g158267 = (float3((temp_output_610_0_g158267).rg , (temp_output_610_0_g158267).b));
				float3 lerpResult623_g158267 = lerp( appendResult566_g158267 , appendResult643_g158267 , (temp_output_610_0_g158267).a);
				#ifdef TVE_MOTION_WIND_ELEMENT
				float3 staticSwitch612_g158267 = lerpResult623_g158267;
				#else
				float3 staticSwitch612_g158267 = appendResult566_g158267;
				#endif
				float3 temp_output_1620_567_g158262 = staticSwitch612_g158267;
				half Base_Noise1590_g158262 = (temp_output_1620_567_g158262).z;
				float2 break83_g158266 = ((temp_output_1620_567_g158262).xy*2.0 + -1.0);
				float3 appendResult79_g158266 = (float3(break83_g158266.x , 0.0 , break83_g158266.y));
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				half2 Base_Direction893_g158262 = (( mul( GetWorldToObjectMatrix(), float4( appendResult79_g158266 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half Base_Intensity1615_g158262 = length( Base_Direction893_g158262 );
				half Flow_Delay1626_g158262 = _MotionDelayValue;
				float lerpResult1623_g158262 = lerp( 1.0 , ( Base_Intensity1615_g158262 * Base_Intensity1615_g158262 ) , Flow_Delay1626_g158262);
				#ifdef TVE_MOTION_BASE_BENDING
				float2 staticSwitch1573_g158262 = ( _MotionBaseIntensityValue * Base_Mask217_g158262 * Base_Noise1590_g158262 * Base_Direction893_g158262 * lerpResult1623_g158262 );
				#else
				float2 staticSwitch1573_g158262 = temp_cast_1;
				#endif
				half2 Base_Motion1440_g158262 = staticSwitch1573_g158262;
				half2 Final_RoationData1570_g158262 = Base_Motion1440_g158262;
				float4 In_RotationData16_g158264 = float4( Final_RoationData1570_g158262, 0.0 , 0.0 );
				Data16_g158264.Dummy = In_Dummy16_g158264;
				Data16_g158264.PositionOS = In_PositionOS16_g158264;
				Data16_g158264.PositionWS = In_PositionWS16_g158264;
				Data16_g158264.PositionWO = In_PositionWO16_g158264;
				Data16_g158264.PositionRawOS = In_PositionRawOS16_g158264;
				Data16_g158264.PositionAddOS = In_PositionAddOS16_g158264;
				Data16_g158264.PivotOS = In_PivotOS16_g158264;
				Data16_g158264.PivotWS = In_PivotWS16_g158264;
				Data16_g158264.PivotWO = In_PivotWO16_g158264;
				Data16_g158264.NormalOS = In_NormalOS16_g158264;
				Data16_g158264.NormalWS = In_NormalWS16_g158264;
				Data16_g158264.NormalRawOS = In_NormalRawOS16_g158264;
				Data16_g158264.NormalRawWS = In_NormalRawWS16_g158264;
				Data16_g158264.TangentOS = In_TangentOS16_g158264;
				Data16_g158264.ViewDirWS = In_ViewDirWS16_g158264;
				Data16_g158264.VertexData = In_VertexData16_g158264;
				Data16_g158264.MotionData = In_MotionData16_g158264;
				Data16_g158264.BoundsData = In_BoundsData16_g158264;
				Data16_g158264.RotationData = In_RotationData16_g158264;
				TVEModelData Data15_g158298 = Data16_g158264;
				float Out_Dummy15_g158298 = 0;
				float3 Out_PositionOS15_g158298 = float3( 0,0,0 );
				float3 Out_PositionWS15_g158298 = float3( 0,0,0 );
				float3 Out_PositionWO15_g158298 = float3( 0,0,0 );
				float3 Out_PositionRawOS15_g158298 = float3( 0,0,0 );
				float3 Out_PositionAddOS15_g158298 = float3( 0,0,0 );
				float3 Out_PivotOS15_g158298 = float3( 0,0,0 );
				float3 Out_PivotWS15_g158298 = float3( 0,0,0 );
				float3 Out_PivotWO15_g158298 = float3( 0,0,0 );
				float3 Out_NormalOS15_g158298 = float3( 0,0,0 );
				float3 Out_NormalWS15_g158298 = float3( 0,0,0 );
				float3 Out_NormalRawOS15_g158298 = float3( 0,0,0 );
				float3 Out_NormalRawWS15_g158298 = float3( 0,0,0 );
				float4 Out_TangentOS15_g158298 = float4( 0,0,0,0 );
				float3 Out_ViewDirWS15_g158298 = float3( 0,0,0 );
				float4 Out_VertexData15_g158298 = float4( 0,0,0,0 );
				float4 Out_MotionData15_g158298 = float4( 0,0,0,0 );
				float4 Out_BoundsData15_g158298 = float4( 0,0,0,0 );
				float4 Out_RotationData15_g158298 = float4( 0,0,0,0 );
				Out_Dummy15_g158298 = Data15_g158298.Dummy;
				Out_PositionOS15_g158298 = Data15_g158298.PositionOS;
				Out_PositionWS15_g158298 = Data15_g158298.PositionWS;
				Out_PositionWO15_g158298 = Data15_g158298.PositionWO;
				Out_PositionRawOS15_g158298 = Data15_g158298.PositionRawOS;
				Out_PositionAddOS15_g158298 = Data15_g158298.PositionAddOS;
				Out_PivotOS15_g158298 = Data15_g158298.PivotOS;
				Out_PivotWS15_g158298 = Data15_g158298.PivotWS;
				Out_PivotWO15_g158298 = Data15_g158298.PivotWO;
				Out_NormalOS15_g158298 = Data15_g158298.NormalOS;
				Out_NormalWS15_g158298 = Data15_g158298.NormalWS;
				Out_NormalRawOS15_g158298 = Data15_g158298.NormalRawOS;
				Out_NormalRawWS15_g158298 = Data15_g158298.NormalRawWS;
				Out_TangentOS15_g158298 = Data15_g158298.TangentOS;
				Out_ViewDirWS15_g158298 = Data15_g158298.ViewDirWS;
				Out_VertexData15_g158298 = Data15_g158298.VertexData;
				Out_MotionData15_g158298 = Data15_g158298.MotionData;
				Out_BoundsData15_g158298 = Data15_g158298.BoundsData;
				Out_RotationData15_g158298 = Data15_g158298.RotationData;
				half3 Model_PositionOS147_g158297 = Out_PositionOS15_g158298;
				half3 Input_False58_g158303 = Model_PositionOS147_g158297;
				half3 VertexPos40_g158300 = Model_PositionOS147_g158297;
				half3 VertexPos40_g158301 = VertexPos40_g158300;
				float3 appendResult74_g158301 = (float3(VertexPos40_g158301.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g158301 = appendResult74_g158301;
				float3 break84_g158301 = VertexPos40_g158301;
				float3 appendResult81_g158301 = (float3(0.0 , break84_g158301.y , break84_g158301.z));
				half3 VertexPosOtherAxis82_g158301 = appendResult81_g158301;
				float4 temp_output_1567_33_g158297 = Out_RotationData15_g158298;
				half4 Model_VertexBend1569_g158297 = temp_output_1567_33_g158297;
				half2 Angle44_g158300 = (Model_VertexBend1569_g158297).xy;
				half Angle44_g158301 = (Angle44_g158300).y;
				half3 VertexPos40_g158302 = ( VertexPosRotationAxis50_g158301 + ( VertexPosOtherAxis82_g158301 * cos( Angle44_g158301 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g158301 ) * sin( Angle44_g158301 ) ) );
				float3 appendResult74_g158302 = (float3(0.0 , 0.0 , VertexPos40_g158302.z));
				half3 VertexPosRotationAxis50_g158302 = appendResult74_g158302;
				float3 break84_g158302 = VertexPos40_g158302;
				float3 appendResult81_g158302 = (float3(break84_g158302.x , break84_g158302.y , 0.0));
				half3 VertexPosOtherAxis82_g158302 = appendResult81_g158302;
				half Angle44_g158302 = -(Angle44_g158300).x;
				half3 Input_True57_g158303 = ( VertexPosRotationAxis50_g158302 + ( VertexPosOtherAxis82_g158302 * cos( Angle44_g158302 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g158302 ) * sin( Angle44_g158302 ) ) );
				#ifdef TVE_MOTION_BASE_BENDING
				float3 staticSwitch65_g158303 = Input_True57_g158303;
				#else
				float3 staticSwitch65_g158303 = Input_False58_g158303;
				#endif
				#ifdef TVE_MOTION_PUSH_BENDING
				float3 staticSwitch67_g158303 = Input_True57_g158303;
				#else
				float3 staticSwitch67_g158303 = staticSwitch65_g158303;
				#endif
				#ifdef TVE_BLANKET_BENDING
				float3 staticSwitch69_g158303 = Input_True57_g158303;
				#else
				float3 staticSwitch69_g158303 = staticSwitch67_g158303;
				#endif
				float3 temp_output_1578_0_g158297 = staticSwitch69_g158303;
				float3 temp_output_1567_31_g158297 = Out_PositionAddOS15_g158298;
				half3 Model_PositionADD1568_g158297 = temp_output_1567_31_g158297;
				half3 Final_PositionOS178_g158297 = ( temp_output_1578_0_g158297 + Model_PositionADD1568_g158297 );
				float3 In_PositionOS16_g158299 = Final_PositionOS178_g158297;
				float3 In_PositionWS16_g158299 = Out_PositionWS15_g158298;
				float3 In_PositionWO16_g158299 = Out_PositionWO15_g158298;
				float3 In_PositionRawOS16_g158299 = Out_PositionRawOS15_g158298;
				float3 In_PositionAddOS16_g158299 = temp_output_1567_31_g158297;
				float3 In_PivotOS16_g158299 = Out_PivotOS15_g158298;
				float3 In_PivotWS16_g158299 = Out_PivotWS15_g158298;
				float3 In_PivotWO16_g158299 = Out_PivotWO15_g158298;
				float3 In_NormalOS16_g158299 = Out_NormalOS15_g158298;
				float3 In_NormalWS16_g158299 = Out_NormalWS15_g158298;
				float3 In_NormalRawOS16_g158299 = Out_NormalRawOS15_g158298;
				float3 In_NormalRawWS16_g158299 = Out_NormalRawWS15_g158298;
				float4 In_TangentOS16_g158299 = Out_TangentOS15_g158298;
				float3 In_ViewDirWS16_g158299 = Out_ViewDirWS15_g158298;
				float4 In_VertexData16_g158299 = Out_VertexData15_g158298;
				float4 In_MotionData16_g158299 = Out_MotionData15_g158298;
				float4 In_BoundsData16_g158299 = Out_BoundsData15_g158298;
				float4 In_RotationData16_g158299 = temp_output_1567_33_g158297;
				Data16_g158299.Dummy = In_Dummy16_g158299;
				Data16_g158299.PositionOS = In_PositionOS16_g158299;
				Data16_g158299.PositionWS = In_PositionWS16_g158299;
				Data16_g158299.PositionWO = In_PositionWO16_g158299;
				Data16_g158299.PositionRawOS = In_PositionRawOS16_g158299;
				Data16_g158299.PositionAddOS = In_PositionAddOS16_g158299;
				Data16_g158299.PivotOS = In_PivotOS16_g158299;
				Data16_g158299.PivotWS = In_PivotWS16_g158299;
				Data16_g158299.PivotWO = In_PivotWO16_g158299;
				Data16_g158299.NormalOS = In_NormalOS16_g158299;
				Data16_g158299.NormalWS = In_NormalWS16_g158299;
				Data16_g158299.NormalRawOS = In_NormalRawOS16_g158299;
				Data16_g158299.NormalRawWS = In_NormalRawWS16_g158299;
				Data16_g158299.TangentOS = In_TangentOS16_g158299;
				Data16_g158299.ViewDirWS = In_ViewDirWS16_g158299;
				Data16_g158299.VertexData = In_VertexData16_g158299;
				Data16_g158299.MotionData = In_MotionData16_g158299;
				Data16_g158299.BoundsData = In_BoundsData16_g158299;
				Data16_g158299.RotationData = In_RotationData16_g158299;
				TVEModelData Data15_g158319 = Data16_g158299;
				float Out_Dummy15_g158319 = 0;
				float3 Out_PositionOS15_g158319 = float3( 0,0,0 );
				float3 Out_PositionWS15_g158319 = float3( 0,0,0 );
				float3 Out_PositionWO15_g158319 = float3( 0,0,0 );
				float3 Out_PositionRawOS15_g158319 = float3( 0,0,0 );
				float3 Out_PositionAddOS15_g158319 = float3( 0,0,0 );
				float3 Out_PivotOS15_g158319 = float3( 0,0,0 );
				float3 Out_PivotWS15_g158319 = float3( 0,0,0 );
				float3 Out_PivotWO15_g158319 = float3( 0,0,0 );
				float3 Out_NormalOS15_g158319 = float3( 0,0,0 );
				float3 Out_NormalWS15_g158319 = float3( 0,0,0 );
				float3 Out_NormalRawOS15_g158319 = float3( 0,0,0 );
				float3 Out_NormalRawWS15_g158319 = float3( 0,0,0 );
				float4 Out_TangentOS15_g158319 = float4( 0,0,0,0 );
				float3 Out_ViewDirWS15_g158319 = float3( 0,0,0 );
				float4 Out_VertexData15_g158319 = float4( 0,0,0,0 );
				float4 Out_MotionData15_g158319 = float4( 0,0,0,0 );
				float4 Out_BoundsData15_g158319 = float4( 0,0,0,0 );
				float4 Out_RotationData15_g158319 = float4( 0,0,0,0 );
				Out_Dummy15_g158319 = Data15_g158319.Dummy;
				Out_PositionOS15_g158319 = Data15_g158319.PositionOS;
				Out_PositionWS15_g158319 = Data15_g158319.PositionWS;
				Out_PositionWO15_g158319 = Data15_g158319.PositionWO;
				Out_PositionRawOS15_g158319 = Data15_g158319.PositionRawOS;
				Out_PositionAddOS15_g158319 = Data15_g158319.PositionAddOS;
				Out_PivotOS15_g158319 = Data15_g158319.PivotOS;
				Out_PivotWS15_g158319 = Data15_g158319.PivotWS;
				Out_PivotWO15_g158319 = Data15_g158319.PivotWO;
				Out_NormalOS15_g158319 = Data15_g158319.NormalOS;
				Out_NormalWS15_g158319 = Data15_g158319.NormalWS;
				Out_NormalRawOS15_g158319 = Data15_g158319.NormalRawOS;
				Out_NormalRawWS15_g158319 = Data15_g158319.NormalRawWS;
				Out_TangentOS15_g158319 = Data15_g158319.TangentOS;
				Out_ViewDirWS15_g158319 = Data15_g158319.ViewDirWS;
				Out_VertexData15_g158319 = Data15_g158319.VertexData;
				Out_MotionData15_g158319 = Data15_g158319.MotionData;
				Out_BoundsData15_g158319 = Data15_g158319.BoundsData;
				Out_RotationData15_g158319 = Data15_g158319.RotationData;
				float3 temp_output_31_0_g158312 = Out_PositionOS15_g158319;
				float3 temp_output_6_0_g158326 = ( ( temp_output_31_0_g158312 - Out_PositionRawOS15_g158319 ) + _DisableSRPBatcher );
				half4 Dummy_Data505 = ( ( ( _VariationLiteInfo + _VariationColoring ) + ( _VariationCategory + _VariationEnd ) + ( _VariationIntensityValue + _VariationColorTwo + _VariationColorOne ) + ( _VariationMultiValue + _VariationNoiseRemap + _VariationNoisePivotsValue1 + _VariationNoiseTillingValue ) ) + ( ( _TintingLiteInfo + _TintingColoring ) + ( _TintingCategory + _TintingEnd + _TintingSpace + 0.0 + _TintingElementMode ) + ( _TintingIntensityValue + _TintingColor + _TintingGrayValue ) + ( _TintingMultiValue + _TintingLumaValue + _TintingLumaRemap ) + 0.0 + 0.0 ) + ( ( _DrynessLiteInfo + _DrynessColoring ) + ( _DrynessCategory + _DrynessEnd + _DrynessSpace + _DrynessElementMode + 0.0 ) + ( _DrynessIntensityValue + _DrynessColor + _DrynessGrayValue + _DrynessShiftValue + _DrynessSmoothnessValue + _DrynessSubsurfaceValue ) + ( _DrynessMultiValue + _DrynessLumaValue + _DrynessLumaRemap ) + 0.0 + 0.0 ) + ( ( _WetnessLiteInfo + _WetnessColoring ) + ( _WetnessCategory + _WetnessEnd + _WetnessElementMode + 0.0 ) + ( _WetnessIntensityValue + _WetnessContrastValue + _WetnessSmoothnessValue ) + float4( 0,0,0,0 ) + float4( 0,0,0,0 ) ) + ( ( _CutoutLiteInfo + _CutoutColoring ) + ( _CutoutCategory + _CutoutEnd + _CutoutSpace + _CutoutElementMode + 0.0 ) + ( _CutoutIntensityValue + _CutoutShadowMode ) + ( _CutoutMultiValue + _CutoutAlphaValue + _CutoutNoiseValue + _CutoutNoiseTillingValue ) + 0.0 ) + ( ( _DitherLiteInfo + _DitherColoring ) + ( _DitherCategory + _DitherEnd ) + ( _DitherConstantValue + 0.0 + 0.0 + ( _DitherDistanceValue + _DitherDistanceMaxValue + _DitherDistanceMinValue ) + _DitherShadowMode ) + ( _DitherMultiValue + _DitherNoiseTillingValue ) ) + ( ( _SizeFadeLiteInfo + _SizeFadeColoring ) + ( _SizeFadeCategory + _SizeFadeEnd + _SizeFadeElementMode ) + ( _SizeFadeIntensityValue + _SizeFadeScaleMode + _SizeFadeScaleValue + _SizeFadeDistMinValue + _SizeFadeDistMaxValue ) ) );
				#ifdef TVE_REGISTER
				float4 staticSwitch14_g158326 = ( float4( temp_output_6_0_g158326 , 0.0 ) + ( Dummy_Data505 * float4( 0,0,0,0 ) ) );
				#else
				float4 staticSwitch14_g158326 = float4( temp_output_6_0_g158326 , 0.0 );
				#endif
				
				outputPackedVaryingsToPS.ase_texcoord8.xy = inputMesh.texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				outputPackedVaryingsToPS.ase_texcoord8.zw = 0;
				inputMesh.positionOS.xyz += staticSwitch14_g158326.rgb;

				float3 positionRWS = TransformObjectToWorld( inputMesh.positionOS.xyz );

				outputVaryingsMeshToPS.positionRWS = positionRWS;
				outputVaryingsMeshToPS.positionCS = TransformWorldToHClip(positionRWS);

				varyingsType.vmesh = outputVaryingsMeshToPS;

				VelocityPositionZBias(varyingsType);
				varyingsType.vpass.positionCS = mul(_NonJitteredViewProjMatrix, float4(varyingsType.vmesh.positionRWS, 1.0));

				bool forceNoMotion = unity_MotionVectorsParams.y == 0.0;
				if (forceNoMotion)
				{
					varyingsType.vpass.previousPositionCS = float4(0.0, 0.0, 0.0, 1.0);
				}
				else
				{
					bool hasDeformation = unity_MotionVectorsParams.x > 0.0; // Skin or morph target
					float3 previousPositionRWS = TransformPreviousObjectToWorld(hasDeformation ? inputPass.previousPositionOS : inputMesh.positionOS.xyz );
					varyingsType.vpass.previousPositionCS = mul(_PrevViewProjMatrix, float4(previousPositionRWS, 1.0));
				}

				outputPackedVaryingsToPS.vmeshPositionCS = varyingsType.vmesh.positionCS;
				outputPackedVaryingsToPS.vmeshInterp00.xyz = varyingsType.vmesh.positionRWS;
				outputPackedVaryingsToPS.vpassInterpolators0 = float3(varyingsType.vpass.positionCS.xyw);
				outputPackedVaryingsToPS.vpassInterpolators1 = float3(varyingsType.vpass.previousPositionCS.xyw);
				return outputPackedVaryingsToPS;
			}

			void Frag(  PackedVaryingsToPS packedInput
				, out float4 outVelocity : SV_Target0
				#ifdef WRITE_NORMAL_BUFFER
				, out float4 outNormalBuffer : SV_Target1
					#ifdef WRITE_MSAA_DEPTH
					, out float1 depthColor : SV_Target2
					#endif
				#endif
				, out float outputDepth : SV_Depth
				
			)
			{
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( packedInput );
				UNITY_SETUP_INSTANCE_ID( packedInput );

				#ifdef LOD_FADE_CROSSFADE
				float3 VC = GetWorldSpaceNormalizeViewDir(packedInput.vmeshInterp00.xyz);
				LODDitheringTransition(ComputeFadeMaskSeed(VC, packedInput.vmeshPositionCS.xy), unity_LODFade.x);
				#endif

				FragInputs input;

				ZERO_INITIALIZE(FragInputs, input);
				SmoothSurfaceDescription surfaceDescription = (SmoothSurfaceDescription)0;
				SurfaceOutput o = (SurfaceOutput)0;

				o.Normal = float3( 0, 0, 1 );
				float4 positionCS = 0;
				float3 positionWS = 0;

				float localBreakData4_g158315 = ( 0.0 );
				float localCompData3_g158307 = ( 0.0 );
				TVEVisualData Data3_g158307 = (TVEVisualData)0;
				half Dummy145_g158305 = ( _SubsurfaceCategory + _SubsurfaceEnd + ( _SubsurfaceDirectValue + _SubsurfaceNormalValue + _SubsurfaceAmbientValue + _SubsurfaceShadowValue ) + _SubsurfaceElementMode );
				float In_Dummy3_g158307 = Dummy145_g158305;
				float localBreakData4_g158306 = ( 0.0 );
				float localCompData3_g158259 = ( 0.0 );
				TVEVisualData Data3_g158259 = (TVEVisualData)0;
				half Dummy145_g158247 = ( _EmissiveCategory + _EmissiveEnd + ( _EmissivePowerMode + _EmissivePowerValue ) + _EmissiveElementMode + 0.0 );
				float In_Dummy3_g158259 = Dummy145_g158247;
				float localBreakData4_g158258 = ( 0.0 );
				float localCompData3_g158220 = ( 0.0 );
				TVEVisualData Data3_g158220 = (TVEVisualData)0;
				float2 uv_OverlayGlitterTex = packedInput.ase_texcoord8.xy * _OverlayGlitterTex_ST.xy + _OverlayGlitterTex_ST.zw;
				half4 Dummy594_g158217 = ( ( _OverlayCategory + _OverlayEnd + _OverlaySpace + _OverlayElementMode + _OverlayBakeInfo ) + ( _OverlayLiteInfo + _OverlayColoringOn + _OverlayColoringOff ) + ( SAMPLE_TEXTURE2D( _OverlayGlitterTex, sampler_OverlayGlitterTex, uv_OverlayGlitterTex ) + _OverlayGlitterTillingValue + _OverlayGlitterIntensityValue + _OverlayGlitterColor + _OverlayGlitterDistValue ) );
				float In_Dummy3_g158220 = Dummy594_g158217.r;
				float localBreakData4_g158218 = ( 0.0 );
				float localCompData3_g157221 = ( 0.0 );
				TVEVisualData Data3_g157221 = (TVEVisualData)0;
				float4 output0 = 0;
				float4 output1 = 0;
				OctaImpostorFragment( o, positionCS, positionWS, packedInput.UVsFrame122_g156549, packedInput.UVsFrame222_g156549, packedInput.UVsFrame322_g156549, packedInput.octaframe22_g156549, packedInput.viewPos22_g156549, output0, output1 );
				float In_Dummy3_g157221 = output1.r;
				float4 break227_g157220 = output0;
				half Local_MultiMask249_g157220 = break227_g157220.b;
				float lerpResult289_g157220 = lerp( 1.0 , Local_MultiMask249_g157220 , _ImpostorColorMode);
				float3 lerpResult292_g157220 = lerp( (_ImpostorColorTwo).rgb , (_ImpostorColor).rgb , lerpResult289_g157220);
				half3 Local_Albedo239_g157220 = ( o.Albedo * lerpResult292_g157220 );
				float3 In_Albedo3_g157221 = Local_Albedo239_g157220;
				float2 temp_cast_4 = (0.5).xx;
				float2 In_NormalTS3_g157221 = temp_cast_4;
				float3 In_NormalWS3_g157221 = o.Normal;
				half Local_Metallic247_g157220 = break227_g157220.r;
				half Final_Metallic238_g157220 = ( Local_Metallic247_g157220 * _ImpostorMetallicValue );
				half Local_Smoothness250_g157220 = break227_g157220.a;
				half Final_Smoothness233_g157220 = ( Local_Smoothness250_g157220 * _ImpostorSmoothnessValue );
				float4 appendResult257_g157220 = (float4(Final_Metallic238_g157220 , 1.0 , 1.0 , Final_Smoothness233_g157220));
				float4 In_Shader3_g157221 = appendResult257_g157220;
				half Local_EmissiveMask248_g157220 = break227_g157220.g;
				float4 appendResult286_g157220 = (float4(Local_EmissiveMask248_g157220 , Local_EmissiveMask248_g157220 , Local_EmissiveMask248_g157220 , 1.0));
				float4 In_Emissive3_g157221 = appendResult286_g157220;
				float3 temp_output_3_0_g157222 = Local_Albedo239_g157220;
				float dotResult20_g157222 = dot( temp_output_3_0_g157222 , float3(0.2126,0.7152,0.0722) );
				half Local_Grayscale268_g157220 = dotResult20_g157222;
				float In_Grayscale3_g157221 = Local_Grayscale268_g157220;
				float clampResult267_g157220 = clamp( saturate( ( Local_Grayscale268_g157220 * 5.0 ) ) , 0.2 , 1.0 );
				half Local_Luminosity269_g157220 = clampResult267_g157220;
				float In_Luminosity3_g157221 = Local_Luminosity269_g157220;
				float In_MultiMask3_g157221 = Local_MultiMask249_g157220;
				float In_AlphaClip3_g157221 = 0.0;
				float In_AlphaFade3_g157221 = 1.0;
				float3 temp_cast_5 = (1.0).xxx;
				float3 In_Translucency3_g157221 = temp_cast_5;
				float In_Transmission3_g157221 = 1.0;
				float In_Thickness3_g157221 = 0.0;
				float In_Diffusion3_g157221 = 0.0;
				Data3_g157221.Dummy = In_Dummy3_g157221;
				Data3_g157221.Albedo = In_Albedo3_g157221;
				Data3_g157221.NormalTS = In_NormalTS3_g157221;
				Data3_g157221.NormalWS = In_NormalWS3_g157221;
				Data3_g157221.Shader = In_Shader3_g157221;
				Data3_g157221.Emissive= In_Emissive3_g157221;
				Data3_g157221.MultiMask = In_MultiMask3_g157221;
				Data3_g157221.Grayscale = In_Grayscale3_g157221;
				Data3_g157221.Luminosity = In_Luminosity3_g157221;
				Data3_g157221.AlphaClip = In_AlphaClip3_g157221;
				Data3_g157221.AlphaFade = In_AlphaFade3_g157221;
				Data3_g157221.Translucency = In_Translucency3_g157221;
				Data3_g157221.Transmission = In_Transmission3_g157221;
				Data3_g157221.Thickness = In_Thickness3_g157221;
				Data3_g157221.Diffusion = In_Diffusion3_g157221;
				TVEVisualData Data4_g158218 = Data3_g157221;
				float Out_Dummy4_g158218 = 0;
				float3 Out_Albedo4_g158218 = float3( 0,0,0 );
				float2 Out_NormalTS4_g158218 = float2( 0,0 );
				float3 Out_NormalWS4_g158218 = float3( 0,0,0 );
				float4 Out_Shader4_g158218 = float4( 0,0,0,0 );
				float4 Out_Emissive4_g158218 = float4( 0,0,0,0 );
				float Out_MultiMask4_g158218 = 0;
				float Out_Grayscale4_g158218 = 0;
				float Out_Luminosity4_g158218 = 0;
				float Out_AlphaClip4_g158218 = 0;
				float Out_AlphaFade4_g158218 = 0;
				float3 Out_Translucency4_g158218 = float3( 0,0,0 );
				float Out_Transmission4_g158218 = 0;
				float Out_Thickness4_g158218 = 0;
				float Out_Diffusion4_g158218 = 0;
				Out_Dummy4_g158218 = Data4_g158218.Dummy;
				Out_Albedo4_g158218 = Data4_g158218.Albedo;
				Out_NormalTS4_g158218 = Data4_g158218.NormalTS;
				Out_NormalWS4_g158218 = Data4_g158218.NormalWS;
				Out_Shader4_g158218 = Data4_g158218.Shader;
				Out_Emissive4_g158218= Data4_g158218.Emissive;
				Out_MultiMask4_g158218 = Data4_g158218.MultiMask;
				Out_Grayscale4_g158218 = Data4_g158218.Grayscale;
				Out_Luminosity4_g158218= Data4_g158218.Luminosity;
				Out_AlphaClip4_g158218 = Data4_g158218.AlphaClip;
				Out_AlphaFade4_g158218 = Data4_g158218.AlphaFade;
				Out_Translucency4_g158218 = Data4_g158218.Translucency;
				Out_Transmission4_g158218 = Data4_g158218.Transmission;
				Out_Thickness4_g158218 = Data4_g158218.Thickness;
				Out_Diffusion4_g158218 = Data4_g158218.Diffusion;
				half3 Visual_Albedo127_g158217 = Out_Albedo4_g158218;
				float3 temp_output_622_0_g158217 = (_OverlayColor).rgb;
				half Overlay_TexMask906_g158217 = 1.0;
				float3 temp_output_739_21_g158217 = Out_NormalWS4_g158218;
				half3 Visual_NormalWS749_g158217 = temp_output_739_21_g158217;
				float clampResult17_g158237 = clamp( saturate( (Visual_NormalWS749_g158217).y ) , 0.0001 , 0.9999 );
				float temp_output_7_0_g158236 = _OverlayProjRemap.x;
				float temp_output_10_0_g158236 = ( _OverlayProjRemap.y - temp_output_7_0_g158236 );
				float lerpResult842_g158217 = lerp( 1.0 , saturate( ( ( clampResult17_g158237 - temp_output_7_0_g158236 ) / ( temp_output_10_0_g158236 + 0.0001 ) ) ) , _OverlayProjValue);
				half Overlay_MaskProj457_g158217 = lerpResult842_g158217;
				float temp_output_739_15_g158217 = Out_Luminosity4_g158218;
				half Visual_Luminosity654_g158217 = temp_output_739_15_g158217;
				float clampResult17_g158239 = clamp( Visual_Luminosity654_g158217 , 0.0001 , 0.9999 );
				float temp_output_7_0_g158238 = _OverlayLumaRemap.x;
				float temp_output_10_0_g158238 = ( _OverlayLumaRemap.y - temp_output_7_0_g158238 );
				float lerpResult587_g158217 = lerp( 1.0 , saturate( ( ( clampResult17_g158239 - temp_output_7_0_g158238 ) / ( temp_output_10_0_g158238 + 0.0001 ) ) ) , _OverlayLumaValue);
				half Overlay_MaskLuma438_g158217 = lerpResult587_g158217;
				half Overlay_VertMask801_g158217 = 1.0;
				half Overlay_MaskNoise427_g158217 = 1.0;
				float localBuildGlobalData204_g157155 = ( 0.0 );
				TVEGlobalData Data204_g157155 = (TVEGlobalData)0;
				half Dummy211_g157155 = ( _GlobalLiteInfo + ( _GlobalCategory + _GlobalEnd ) );
				float In_Dummy204_g157155 = Dummy211_g157155;
				float4 temp_output_362_164_g157155 = TVE_CoatParams;
				half4 Coat_Params302_g157155 = temp_output_362_164_g157155;
				float4 In_CoatParams204_g157155 = Coat_Params302_g157155;
				float4 temp_output_361_164_g157155 = TVE_PaintParams;
				half4 Paint_Params71_g157155 = temp_output_361_164_g157155;
				float4 In_PaintParams204_g157155 = Paint_Params71_g157155;
				float4 temp_output_365_163_g157155 = TVE_GlowParams;
				half4 Glow_Params248_g157155 = temp_output_365_163_g157155;
				float4 In_GlowParams204_g157155 = Glow_Params248_g157155;
				float4 temp_output_363_141_g157155 = TVE_AtmoParams;
				half4 Atmo_Params80_g157155 = temp_output_363_141_g157155;
				float4 In_AtmoParams204_g157155 = Atmo_Params80_g157155;
				float4 temp_output_364_139_g157155 = TVE_FormParams;
				half4 Form_Params112_g157155 = temp_output_364_139_g157155;
				float4 In_FormParams204_g157155 = Form_Params112_g157155;
				float4 temp_output_366_145_g157155 = TVE_WindParams;
				half4 Wind_Params88_g157155 = temp_output_366_145_g157155;
				float4 In_WindParams204_g157155 = Wind_Params88_g157155;
				float4 temp_output_367_145_g157155 = TVE_PushParams;
				half4 Push_Params335_g157155 = temp_output_367_145_g157155;
				float4 In_PushParams204_g157155 = Push_Params335_g157155;
				Data204_g157155.Dummy = In_Dummy204_g157155;
				Data204_g157155.CoatParams = In_CoatParams204_g157155;
				Data204_g157155.PaintParams = In_PaintParams204_g157155;
				Data204_g157155.GlowParams = In_GlowParams204_g157155;
				Data204_g157155.AtmoParams = In_AtmoParams204_g157155;
				Data204_g157155.FormParams= In_FormParams204_g157155;
				Data204_g157155.WindParams = In_WindParams204_g157155;
				Data204_g157155.PushParams = In_PushParams204_g157155;
				TVEGlobalData Data15_g158219 = Data204_g157155;
				float Out_Dummy15_g158219 = 0;
				float4 Out_CoatParams15_g158219 = float4( 0,0,0,0 );
				float4 Out_PaintParams15_g158219 = float4( 0,0,0,0 );
				float4 Out_GlowParams15_g158219 = float4( 0,0,0,0 );
				float4 Out_AtmoParams15_g158219 = float4( 0,0,0,0 );
				float4 Out_FadeParams15_g158219 = float4( 0,0,0,0 );
				float4 Out_FormParams15_g158219 = float4( 0,0,0,0 );
				float4 Out_LandParams15_g158219 = float4( 0,0,0,0 );
				float4 Out_WindParams15_g158219 = float4( 0,0,0,0 );
				float4 Out_PushParams15_g158219 = float4( 0,0,0,0 );
				Out_Dummy15_g158219 = Data15_g158219.Dummy;
				Out_CoatParams15_g158219 = Data15_g158219.CoatParams;
				Out_PaintParams15_g158219 = Data15_g158219.PaintParams;
				Out_GlowParams15_g158219 = Data15_g158219.GlowParams;
				Out_AtmoParams15_g158219= Data15_g158219.AtmoParams;
				Out_FadeParams15_g158219= Data15_g158219.FadeParams;
				Out_FormParams15_g158219 = Data15_g158219.FormParams;
				Out_LandParams15_g158219 = Data15_g158219.LandParams;
				Out_WindParams15_g158219 = Data15_g158219.WindParams;
				Out_PushParams15_g158219 = Data15_g158219.PushParams;
				half4 Global_AtmoParams516_g158217 = Out_AtmoParams15_g158219;
				#ifdef TVE_OVERLAY_ELEMENT
				float staticSwitch705_g158217 = (Global_AtmoParams516_g158217).z;
				#else
				float staticSwitch705_g158217 = 1.0;
				#endif
				half Overlay_MaskGlobal429_g158217 = staticSwitch705_g158217;
				half Custom_Mask646_g158217 = 1.0;
				float temp_output_7_0_g158244 = _OverlayBlendRemap1.x;
				float temp_output_10_0_g158244 = ( _OverlayBlendRemap1.y - temp_output_7_0_g158244 );
				half Overlay_Mask494_g158217 = saturate( ( ( ( _OverlayIntensityValue * Overlay_TexMask906_g158217 * Overlay_MaskProj457_g158217 * Overlay_MaskLuma438_g158217 * Overlay_VertMask801_g158217 * Overlay_MaskNoise427_g158217 * Overlay_MaskGlobal429_g158217 * Custom_Mask646_g158217 ) - temp_output_7_0_g158244 ) / ( temp_output_10_0_g158244 + 0.0001 ) ) );
				float3 lerpResult467_g158217 = lerp( Visual_Albedo127_g158217 , temp_output_622_0_g158217 , Overlay_Mask494_g158217);
				#ifdef TVE_OVERLAY
				float3 staticSwitch577_g158217 = lerpResult467_g158217;
				#else
				float3 staticSwitch577_g158217 = Visual_Albedo127_g158217;
				#endif
				half3 Final_Albedo493_g158217 = staticSwitch577_g158217;
				float3 In_Albedo3_g158220 = Final_Albedo493_g158217;
				half2 Visual_NormalTS535_g158217 = Out_NormalTS4_g158218;
				float2 lerpResult551_g158217 = lerp( Visual_NormalTS535_g158217 , ( Visual_NormalTS535_g158217 * _OverlayNormalValue ) , Overlay_Mask494_g158217);
				#ifdef TVE_OVERLAY
				float2 staticSwitch583_g158217 = lerpResult551_g158217;
				#else
				float2 staticSwitch583_g158217 = Visual_NormalTS535_g158217;
				#endif
				half2 Final_NormalTS499_g158217 = staticSwitch583_g158217;
				float2 In_NormalTS3_g158220 = Final_NormalTS499_g158217;
				float3 In_NormalWS3_g158220 = temp_output_739_21_g158217;
				half4 Visual_Masks536_g158217 = Out_Shader4_g158218;
				float4 appendResult585_g158217 = (float4(0.0 , 1.0 , 0.0 , _OverlaySmoothnessValue));
				float4 lerpResult584_g158217 = lerp( Visual_Masks536_g158217 , appendResult585_g158217 , Overlay_Mask494_g158217);
				#ifdef TVE_OVERLAY
				float4 staticSwitch586_g158217 = lerpResult584_g158217;
				#else
				float4 staticSwitch586_g158217 = Visual_Masks536_g158217;
				#endif
				half4 Final_Masks482_g158217 = staticSwitch586_g158217;
				float4 In_Shader3_g158220 = Final_Masks482_g158217;
				float4 In_Emissive3_g158220 = Out_Emissive4_g158218;
				float temp_output_739_12_g158217 = Out_Grayscale4_g158218;
				float In_Grayscale3_g158220 = temp_output_739_12_g158217;
				float In_Luminosity3_g158220 = temp_output_739_15_g158217;
				float In_MultiMask3_g158220 = Out_MultiMask4_g158218;
				float In_AlphaClip3_g158220 = Out_AlphaClip4_g158218;
				float In_AlphaFade3_g158220 = Out_AlphaFade4_g158218;
				float3 In_Translucency3_g158220 = Out_Translucency4_g158218;
				half Visual_Transmission699_g158217 = Out_Transmission4_g158218;
				float lerpResult746_g158217 = lerp( Visual_Transmission699_g158217 , ( Visual_Transmission699_g158217 * _OverlaySubsurfaceValue ) , ( Overlay_VertMask801_g158217 * Overlay_MaskNoise427_g158217 * Overlay_MaskGlobal429_g158217 ));
				#ifdef TVE_OVERLAY
				float staticSwitch703_g158217 = lerpResult746_g158217;
				#else
				float staticSwitch703_g158217 = Visual_Transmission699_g158217;
				#endif
				half Final_Transmission702_g158217 = staticSwitch703_g158217;
				float In_Transmission3_g158220 = Final_Transmission702_g158217;
				float In_Thickness3_g158220 = Out_Thickness4_g158218;
				float In_Diffusion3_g158220 = Out_Diffusion4_g158218;
				Data3_g158220.Dummy = In_Dummy3_g158220;
				Data3_g158220.Albedo = In_Albedo3_g158220;
				Data3_g158220.NormalTS = In_NormalTS3_g158220;
				Data3_g158220.NormalWS = In_NormalWS3_g158220;
				Data3_g158220.Shader = In_Shader3_g158220;
				Data3_g158220.Emissive= In_Emissive3_g158220;
				Data3_g158220.MultiMask = In_MultiMask3_g158220;
				Data3_g158220.Grayscale = In_Grayscale3_g158220;
				Data3_g158220.Luminosity = In_Luminosity3_g158220;
				Data3_g158220.AlphaClip = In_AlphaClip3_g158220;
				Data3_g158220.AlphaFade = In_AlphaFade3_g158220;
				Data3_g158220.Translucency = In_Translucency3_g158220;
				Data3_g158220.Transmission = In_Transmission3_g158220;
				Data3_g158220.Thickness = In_Thickness3_g158220;
				Data3_g158220.Diffusion = In_Diffusion3_g158220;
				TVEVisualData Data4_g158258 = Data3_g158220;
				float Out_Dummy4_g158258 = 0;
				float3 Out_Albedo4_g158258 = float3( 0,0,0 );
				float2 Out_NormalTS4_g158258 = float2( 0,0 );
				float3 Out_NormalWS4_g158258 = float3( 0,0,0 );
				float4 Out_Shader4_g158258 = float4( 0,0,0,0 );
				float4 Out_Emissive4_g158258 = float4( 0,0,0,0 );
				float Out_MultiMask4_g158258 = 0;
				float Out_Grayscale4_g158258 = 0;
				float Out_Luminosity4_g158258 = 0;
				float Out_AlphaClip4_g158258 = 0;
				float Out_AlphaFade4_g158258 = 0;
				float3 Out_Translucency4_g158258 = float3( 0,0,0 );
				float Out_Transmission4_g158258 = 0;
				float Out_Thickness4_g158258 = 0;
				float Out_Diffusion4_g158258 = 0;
				Out_Dummy4_g158258 = Data4_g158258.Dummy;
				Out_Albedo4_g158258 = Data4_g158258.Albedo;
				Out_NormalTS4_g158258 = Data4_g158258.NormalTS;
				Out_NormalWS4_g158258 = Data4_g158258.NormalWS;
				Out_Shader4_g158258 = Data4_g158258.Shader;
				Out_Emissive4_g158258= Data4_g158258.Emissive;
				Out_MultiMask4_g158258 = Data4_g158258.MultiMask;
				Out_Grayscale4_g158258 = Data4_g158258.Grayscale;
				Out_Luminosity4_g158258= Data4_g158258.Luminosity;
				Out_AlphaClip4_g158258 = Data4_g158258.AlphaClip;
				Out_AlphaFade4_g158258 = Data4_g158258.AlphaFade;
				Out_Translucency4_g158258 = Data4_g158258.Translucency;
				Out_Transmission4_g158258 = Data4_g158258.Transmission;
				Out_Thickness4_g158258 = Data4_g158258.Thickness;
				Out_Diffusion4_g158258 = Data4_g158258.Diffusion;
				float3 temp_output_297_0_g158247 = Out_Albedo4_g158258;
				float3 In_Albedo3_g158259 = temp_output_297_0_g158247;
				float2 In_NormalTS3_g158259 = Out_NormalTS4_g158258;
				float3 In_NormalWS3_g158259 = Out_NormalWS4_g158258;
				float4 In_Shader3_g158259 = Out_Shader4_g158258;
				float4 temp_cast_6 = (0.0).xxxx;
				half4 Visual_Emissive255_g158247 = Out_Emissive4_g158258;
				half Emissive_MeshMask221_g158247 = 1.0;
				half Emissive_Mask103_g158247 = 1.0;
				float temp_output_279_0_g158247 = ( Emissive_MeshMask221_g158247 * Emissive_Mask103_g158247 );
				float3 appendResult293_g158247 = (float3(temp_output_279_0_g158247 , temp_output_279_0_g158247 , temp_output_279_0_g158247));
				half3 Local_EmissiveColor278_g158247 = appendResult293_g158247;
				float3 temp_cast_7 = (1.0).xxx;
				TVEGlobalData Data15_g158249 = Data204_g157155;
				float Out_Dummy15_g158249 = 0;
				float4 Out_CoatParams15_g158249 = float4( 0,0,0,0 );
				float4 Out_PaintParams15_g158249 = float4( 0,0,0,0 );
				float4 Out_GlowParams15_g158249 = float4( 0,0,0,0 );
				float4 Out_AtmoParams15_g158249 = float4( 0,0,0,0 );
				float4 Out_FadeParams15_g158249 = float4( 0,0,0,0 );
				float4 Out_FormParams15_g158249 = float4( 0,0,0,0 );
				float4 Out_LandParams15_g158249 = float4( 0,0,0,0 );
				float4 Out_WindParams15_g158249 = float4( 0,0,0,0 );
				float4 Out_PushParams15_g158249 = float4( 0,0,0,0 );
				Out_Dummy15_g158249 = Data15_g158249.Dummy;
				Out_CoatParams15_g158249 = Data15_g158249.CoatParams;
				Out_PaintParams15_g158249 = Data15_g158249.PaintParams;
				Out_GlowParams15_g158249 = Data15_g158249.GlowParams;
				Out_AtmoParams15_g158249= Data15_g158249.AtmoParams;
				Out_FadeParams15_g158249= Data15_g158249.FadeParams;
				Out_FormParams15_g158249 = Data15_g158249.FormParams;
				Out_LandParams15_g158249 = Data15_g158249.LandParams;
				Out_WindParams15_g158249 = Data15_g158249.WindParams;
				Out_PushParams15_g158249 = Data15_g158249.PushParams;
				half4 Global_GlowParams179_g158247 = Out_GlowParams15_g158249;
				float3 lerpResult299_g158247 = lerp( float3( 1,1,1 ) , (Global_GlowParams179_g158247).xyz , TVE_IsEnabled);
				#ifdef TVE_EMISSIVE_ELEMENT
				float3 staticSwitch228_g158247 = lerpResult299_g158247;
				#else
				float3 staticSwitch228_g158247 = temp_cast_7;
				#endif
				half3 Emissive_GlobalMask248_g158247 = staticSwitch228_g158247;
				half3 Local_EmissiveValue88_g158247 = ( _EmissiveIntensityValue * (_EmissiveColor).rgb * Emissive_GlobalMask248_g158247 );
				half3 Emissive_Blend260_g158247 = ( ( (Visual_Emissive255_g158247).xyz * Local_EmissiveColor278_g158247 ) * Local_EmissiveValue88_g158247 );
				float3 temp_output_3_0_g158257 = Emissive_Blend260_g158247;
				float temp_output_15_0_g158257 = _emissive_power_value;
				float3 hdEmission22_g158257 = ASEGetEmissionHDRColor(temp_output_3_0_g158257,temp_output_15_0_g158257,_EmissiveExposureValue,GetInverseCurrentExposureMultiplier());
				float4 appendResult295_g158247 = (float4(hdEmission22_g158257 , Emissive_Mask103_g158247));
				#ifdef TVE_EMISSIVE
				float4 staticSwitch129_g158247 = appendResult295_g158247;
				#else
				float4 staticSwitch129_g158247 = temp_cast_6;
				#endif
				half4 Final_Emissive184_g158247 = staticSwitch129_g158247;
				float4 In_Emissive3_g158259 = Final_Emissive184_g158247;
				float In_Grayscale3_g158259 = Out_Grayscale4_g158258;
				float In_Luminosity3_g158259 = Out_Luminosity4_g158258;
				float temp_output_297_11_g158247 = Out_MultiMask4_g158258;
				float In_MultiMask3_g158259 = temp_output_297_11_g158247;
				float In_AlphaClip3_g158259 = Out_AlphaClip4_g158258;
				float In_AlphaFade3_g158259 = Out_AlphaFade4_g158258;
				float3 In_Translucency3_g158259 = Out_Translucency4_g158258;
				float In_Transmission3_g158259 = Out_Transmission4_g158258;
				float In_Thickness3_g158259 = Out_Thickness4_g158258;
				float In_Diffusion3_g158259 = Out_Diffusion4_g158258;
				Data3_g158259.Dummy = In_Dummy3_g158259;
				Data3_g158259.Albedo = In_Albedo3_g158259;
				Data3_g158259.NormalTS = In_NormalTS3_g158259;
				Data3_g158259.NormalWS = In_NormalWS3_g158259;
				Data3_g158259.Shader = In_Shader3_g158259;
				Data3_g158259.Emissive= In_Emissive3_g158259;
				Data3_g158259.MultiMask = In_MultiMask3_g158259;
				Data3_g158259.Grayscale = In_Grayscale3_g158259;
				Data3_g158259.Luminosity = In_Luminosity3_g158259;
				Data3_g158259.AlphaClip = In_AlphaClip3_g158259;
				Data3_g158259.AlphaFade = In_AlphaFade3_g158259;
				Data3_g158259.Translucency = In_Translucency3_g158259;
				Data3_g158259.Transmission = In_Transmission3_g158259;
				Data3_g158259.Thickness = In_Thickness3_g158259;
				Data3_g158259.Diffusion = In_Diffusion3_g158259;
				TVEVisualData Data4_g158306 = Data3_g158259;
				float Out_Dummy4_g158306 = 0;
				float3 Out_Albedo4_g158306 = float3( 0,0,0 );
				float2 Out_NormalTS4_g158306 = float2( 0,0 );
				float3 Out_NormalWS4_g158306 = float3( 0,0,0 );
				float4 Out_Shader4_g158306 = float4( 0,0,0,0 );
				float4 Out_Emissive4_g158306 = float4( 0,0,0,0 );
				float Out_MultiMask4_g158306 = 0;
				float Out_Grayscale4_g158306 = 0;
				float Out_Luminosity4_g158306 = 0;
				float Out_AlphaClip4_g158306 = 0;
				float Out_AlphaFade4_g158306 = 0;
				float3 Out_Translucency4_g158306 = float3( 0,0,0 );
				float Out_Transmission4_g158306 = 0;
				float Out_Thickness4_g158306 = 0;
				float Out_Diffusion4_g158306 = 0;
				Out_Dummy4_g158306 = Data4_g158306.Dummy;
				Out_Albedo4_g158306 = Data4_g158306.Albedo;
				Out_NormalTS4_g158306 = Data4_g158306.NormalTS;
				Out_NormalWS4_g158306 = Data4_g158306.NormalWS;
				Out_Shader4_g158306 = Data4_g158306.Shader;
				Out_Emissive4_g158306= Data4_g158306.Emissive;
				Out_MultiMask4_g158306 = Data4_g158306.MultiMask;
				Out_Grayscale4_g158306 = Data4_g158306.Grayscale;
				Out_Luminosity4_g158306= Data4_g158306.Luminosity;
				Out_AlphaClip4_g158306 = Data4_g158306.AlphaClip;
				Out_AlphaFade4_g158306 = Data4_g158306.AlphaFade;
				Out_Translucency4_g158306 = Data4_g158306.Translucency;
				Out_Transmission4_g158306 = Data4_g158306.Transmission;
				Out_Thickness4_g158306 = Data4_g158306.Thickness;
				Out_Diffusion4_g158306 = Data4_g158306.Diffusion;
				half3 Visual_Albedo199_g158305 = Out_Albedo4_g158306;
				half3 Final_Albedo312_g158305 = Visual_Albedo199_g158305;
				float3 In_Albedo3_g158307 = Final_Albedo312_g158305;
				float2 In_NormalTS3_g158307 = Out_NormalTS4_g158306;
				float3 In_NormalWS3_g158307 = Out_NormalWS4_g158306;
				float4 In_Shader3_g158307 = Out_Shader4_g158306;
				float4 In_Emissive3_g158307 = Out_Emissive4_g158306;
				float In_Grayscale3_g158307 = Out_Grayscale4_g158306;
				float In_Luminosity3_g158307 = Out_Luminosity4_g158306;
				float temp_output_301_11_g158305 = Out_MultiMask4_g158306;
				float In_MultiMask3_g158307 = temp_output_301_11_g158305;
				float In_AlphaClip3_g158307 = Out_AlphaClip4_g158306;
				float In_AlphaFade3_g158307 = Out_AlphaFade4_g158306;
				float3 temp_cast_8 = (0.0).xxx;
				half3 Subsurface_Color264_g158305 = ( (_SubsurfaceColor).rgb * Visual_Albedo199_g158305 );
				half Visual_Transmission138_g158305 = Out_Transmission4_g158306;
				half Subsurface_Value268_g158305 = _SubsurfaceIntensityValue;
				TVEGlobalData Data15_g158309 = Data204_g157155;
				float Out_Dummy15_g158309 = 0;
				float4 Out_CoatParams15_g158309 = float4( 0,0,0,0 );
				float4 Out_PaintParams15_g158309 = float4( 0,0,0,0 );
				float4 Out_GlowParams15_g158309 = float4( 0,0,0,0 );
				float4 Out_AtmoParams15_g158309 = float4( 0,0,0,0 );
				float4 Out_FadeParams15_g158309 = float4( 0,0,0,0 );
				float4 Out_FormParams15_g158309 = float4( 0,0,0,0 );
				float4 Out_LandParams15_g158309 = float4( 0,0,0,0 );
				float4 Out_WindParams15_g158309 = float4( 0,0,0,0 );
				float4 Out_PushParams15_g158309 = float4( 0,0,0,0 );
				Out_Dummy15_g158309 = Data15_g158309.Dummy;
				Out_CoatParams15_g158309 = Data15_g158309.CoatParams;
				Out_PaintParams15_g158309 = Data15_g158309.PaintParams;
				Out_GlowParams15_g158309 = Data15_g158309.GlowParams;
				Out_AtmoParams15_g158309= Data15_g158309.AtmoParams;
				Out_FadeParams15_g158309= Data15_g158309.FadeParams;
				Out_FormParams15_g158309 = Data15_g158309.FormParams;
				Out_LandParams15_g158309 = Data15_g158309.LandParams;
				Out_WindParams15_g158309 = Data15_g158309.WindParams;
				Out_PushParams15_g158309 = Data15_g158309.PushParams;
				half4 Global_GlowParams373_g158305 = Out_GlowParams15_g158309;
				float lerpResult403_g158305 = lerp( 1.0 , saturate( (Global_GlowParams373_g158305).w ) , TVE_IsEnabled);
				#ifdef TVE_SUBSURFACE_ELEMENT
				float staticSwitch367_g158305 = lerpResult403_g158305;
				#else
				float staticSwitch367_g158305 = 1.0;
				#endif
				half Subsurface_GlobalMask369_g158305 = staticSwitch367_g158305;
				half Visual_MultiMask292_g158305 = temp_output_301_11_g158305;
				float lerpResult293_g158305 = lerp( 1.0 , Visual_MultiMask292_g158305 , _SubsurfaceMultiValue);
				half Subsurface_MultiMask296_g158305 = lerpResult293_g158305;
				half Custom_Mask363_g158305 = 1.0;
				#ifdef TVE_SUBSURFACE
				float staticSwitch345_g158305 = ( Visual_Transmission138_g158305 * Subsurface_Value268_g158305 * Subsurface_GlobalMask369_g158305 * Subsurface_MultiMask296_g158305 * Custom_Mask363_g158305 );
				#else
				float staticSwitch345_g158305 = 0.0;
				#endif
				half Final_Transmission269_g158305 = staticSwitch345_g158305;
				#ifdef TVE_SUBSURFACE
				float3 staticSwitch348_g158305 = ( Subsurface_Color264_g158305 * Final_Transmission269_g158305 * 10.0 );
				#else
				float3 staticSwitch348_g158305 = temp_cast_8;
				#endif
				half3 Final_Translucency254_g158305 = staticSwitch348_g158305;
				float3 In_Translucency3_g158307 = Final_Translucency254_g158305;
				float In_Transmission3_g158307 = Final_Transmission269_g158305;
				#ifdef TVE_SUBSURFACE
				float staticSwitch351_g158305 = _SubsurfaceThicknessValue;
				#else
				float staticSwitch351_g158305 = 1.0;
				#endif
				half Final_Thickness275_g158305 = staticSwitch351_g158305;
				float In_Thickness3_g158307 = Final_Thickness275_g158305;
				float Final_Diffusion340_g158305 = _SubsurfaceDiffusion;
				float In_Diffusion3_g158307 = Final_Diffusion340_g158305;
				Data3_g158307.Dummy = In_Dummy3_g158307;
				Data3_g158307.Albedo = In_Albedo3_g158307;
				Data3_g158307.NormalTS = In_NormalTS3_g158307;
				Data3_g158307.NormalWS = In_NormalWS3_g158307;
				Data3_g158307.Shader = In_Shader3_g158307;
				Data3_g158307.Emissive= In_Emissive3_g158307;
				Data3_g158307.MultiMask = In_MultiMask3_g158307;
				Data3_g158307.Grayscale = In_Grayscale3_g158307;
				Data3_g158307.Luminosity = In_Luminosity3_g158307;
				Data3_g158307.AlphaClip = In_AlphaClip3_g158307;
				Data3_g158307.AlphaFade = In_AlphaFade3_g158307;
				Data3_g158307.Translucency = In_Translucency3_g158307;
				Data3_g158307.Transmission = In_Transmission3_g158307;
				Data3_g158307.Thickness = In_Thickness3_g158307;
				Data3_g158307.Diffusion = In_Diffusion3_g158307;
				TVEVisualData Data4_g158315 = Data3_g158307;
				float Out_Dummy4_g158315 = 0;
				float3 Out_Albedo4_g158315 = float3( 0,0,0 );
				float2 Out_NormalTS4_g158315 = float2( 0,0 );
				float3 Out_NormalWS4_g158315 = float3( 0,0,0 );
				float4 Out_Shader4_g158315 = float4( 0,0,0,0 );
				float4 Out_Emissive4_g158315 = float4( 0,0,0,0 );
				float Out_MultiMask4_g158315 = 0;
				float Out_Grayscale4_g158315 = 0;
				float Out_Luminosity4_g158315 = 0;
				float Out_AlphaClip4_g158315 = 0;
				float Out_AlphaFade4_g158315 = 0;
				float3 Out_Translucency4_g158315 = float3( 0,0,0 );
				float Out_Transmission4_g158315 = 0;
				float Out_Thickness4_g158315 = 0;
				float Out_Diffusion4_g158315 = 0;
				Out_Dummy4_g158315 = Data4_g158315.Dummy;
				Out_Albedo4_g158315 = Data4_g158315.Albedo;
				Out_NormalTS4_g158315 = Data4_g158315.NormalTS;
				Out_NormalWS4_g158315 = Data4_g158315.NormalWS;
				Out_Shader4_g158315 = Data4_g158315.Shader;
				Out_Emissive4_g158315= Data4_g158315.Emissive;
				Out_MultiMask4_g158315 = Data4_g158315.MultiMask;
				Out_Grayscale4_g158315 = Data4_g158315.Grayscale;
				Out_Luminosity4_g158315= Data4_g158315.Luminosity;
				Out_AlphaClip4_g158315 = Data4_g158315.AlphaClip;
				Out_AlphaFade4_g158315 = Data4_g158315.AlphaFade;
				Out_Translucency4_g158315 = Data4_g158315.Translucency;
				Out_Transmission4_g158315 = Data4_g158315.Transmission;
				Out_Thickness4_g158315 = Data4_g158315.Thickness;
				Out_Diffusion4_g158315 = Data4_g158315.Diffusion;
				float4 break24_g158312 = Out_Shader4_g158315;
				
				surfaceDescription.Smoothness = break24_g158312.w;
				surfaceDescription.Alpha = 1;

				#ifdef _ALPHATEST_ON
				surfaceDescription.AlphaClipThreshold = 0;
				#endif

				packedInput.vmeshPositionCS.zw = positionCS.zw;
				float3 positionRWS = positionWS;
				float3 normalWS = o.Normal;

				//#if defined( ASE_SRP_VERSION ) && ASE_SRP_VERSION < 60900
				//input.worldToTangent = k_identity3x3;
				//#else
				input.tangentToWorld = k_identity3x3;
				//#endif
				input.positionSS = packedInput.vmeshPositionCS;
				input.positionRWS = positionRWS;

				PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS);

				float3 normalizedWorldViewDir = GetWorldSpaceNormalizeViewDir( input.positionRWS );

				SurfaceData surfaceData;
				BuiltinData builtinData;

				GetSurfaceAndBuiltinData(surfaceDescription, input, normalizedWorldViewDir, posInput, surfaceData, builtinData);

				VaryingsPassToPS inputPass = UnpackVaryingsPassToPS(packedInput);
				//#if defined( ASE_SRP_VERSION ) && ASE_SRP_VERSION <= 50702
				//float2 velocity = CalculateVelocity(inputPass.positionCS, inputPass.previousPositionCS);
				//EncodeVelocity(velocity * 0.5, outVelocity);
				//#else
				float2 velocity = CalculateMotionVector( inputPass.positionCS, inputPass.previousPositionCS );
				EncodeMotionVector( velocity * 0.5, outVelocity );
				//#endif

				bool forceNoMotion = unity_MotionVectorsParams.y == 0.0;
				if (forceNoMotion)
					outVelocity = float4(0.0, 0.0, 0.0, 0.0);

				#ifdef WRITE_NORMAL_BUFFER
					EncodeIntoNormalBuffer(ConvertSurfaceDataToNormalData(surfaceData), posInput.positionSS, outNormalBuffer);

					#ifdef WRITE_MSAA_DEPTH
					depthColor = packedInput.vmeshPositionCS.z;
					#endif
				#endif

				outputDepth = posInput.deviceDepth;
			}

			ENDHLSL
		}

		
		Pass
        {
			
			Name "Forward"
			Tags { "LightMode"="Forward" }
			Stencil
			{
				Ref 10
				WriteMask 14
				Comp Always
				Pass Replace
			}


			ColorMask [_ColorMaskTransparentVelOne] 1
			ColorMask [_ColorMaskTransparentVelTwo] 2

			HLSLPROGRAM

			#pragma shader_feature_local_fragment _DISABLE_DECALS
			#pragma shader_feature_local_fragment _DISABLE_SSR
			#define _MATERIAL_FEATURE_TRANSMISSION 1
			#define ASE_SRP_VERSION 140011
			#ifdef UNITY_COLORSPACE_GAMMA//AI_SRP
			#define unity_ColorSpaceDielectricSpec half4(0.220916301, 0.220916301, 0.220916301, 1.0 - 0.220916301)//AI_SRP
			#else//AI_SRP
			#define unity_ColorSpaceDielectricSpec half4(0.04, 0.04, 0.04, 1.0 - 0.04) //AI_SRP
			#endif//AI_SRP
			#define ASE_USING_SAMPLING_MACROS 1


			#pragma vertex Vert
			#pragma fragment Frag



			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			//#if defined( ASE_SRP_VERSION ) && ASE_SRP_VERSION < 60900
			//#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Wind.hlsl"
			//#endif
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"

			#define SHADERPASS SHADERPASS_FORWARD
			//#pragma multi_compile _ LIGHTMAP_ON
			//#pragma multi_compile _ DIRLIGHTMAP_COMBINED
			//#pragma multi_compile _ DYNAMICLIGHTMAP_ON
			//#pragma multi_compile _ SHADOWS_SHADOWMASK
			//#pragma multi_compile DECALS_OFF DECALS_3RT DECALS_4RT
			//#define LIGHTLOOP_TILE_PASS
			//#pragma multi_compile_fragment _ SHADOWS_SHADOWMASK
			#pragma multi_compile_fragment SHADOW_LOW SHADOW_MEDIUM SHADOW_HIGH
			#pragma multi_compile_fragment AREA_SHADOW_MEDIUM AREA_SHADOW_HIGH
			#pragma multi_compile_fragment PROBE_VOLUMES_OFF PROBE_VOLUMES_L1 PROBE_VOLUMES_L2
			#pragma multi_compile_fragment SCREEN_SPACE_SHADOWS_OFF SCREEN_SPACE_SHADOWS_ON
			#pragma multi_compile_fragment USE_FPTL_LIGHTLIST USE_CLUSTERED_LIGHTLIST

			#ifndef SHADER_STAGE_FRAGMENT
			#define SHADOW_LOW
			#define USE_FPTL_LIGHTLIST
			#endif

			#define VARYINGS_NEED_POSITION_WS
			#define VARYINGS_NEED_TANGENT_TO_WORLD
			#define VARYINGS_NEED_TEXCOORD1
			#define VARYINGS_NEED_TEXCOORD2

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Lighting/Lighting.hlsl"

			#define HAS_LIGHTLOOP
			
			#if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define OUTPUT_SPLIT_LIGHTING
			#endif

			#define T2W(var, index) var.tangentToWorld[index]

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/CommonLighting.hlsl"
			#define ai_ObjectToWorld GetObjectToWorldMatrix()
			#define ai_WorldToObject GetWorldToObjectMatrix()
			#define AI_INV_TWO_PI  INV_TWO_PI
			#define AI_PI          PI
			#define AI_INV_PI      INV_PI
			#define ASE_NEEDS_VERT_NORMAL
			#pragma shader_feature_local_fragment TVE_PIPELINE_STANDARD TVE_PIPELINE_UNIVERSAL TVE_PIPELINE_HD
			#pragma shader_feature_local_vertex TVE_MOTION_BASE_BENDING
			#pragma shader_feature_local_vertex TVE_MOTION_WIND_ELEMENT
			#pragma shader_feature_local_fragment TVE_OVERLAY
			#pragma shader_feature_local_fragment TVE_OVERLAY_ELEMENT
			#pragma shader_feature_local_fragment TVE_EMISSIVE
			#pragma shader_feature_local_fragment TVE_EMISSIVE_ELEMENT
			#pragma shader_feature_local_fragment TVE_SUBSURFACE
			#pragma shader_feature_local_fragment TVE_SUBSURFACE_ELEMENT
			  
			struct TVEVisualData
			{  
				half Dummy;  
				half3 Albedo;
				half2 NormalTS;
				half3 NormalWS; 
				half4 Shader;
				half4 Emissive;
				half AlphaClip;
				half AlphaFade;
				half MultiMask;
				half Grayscale;
				half Luminosity;
				half3 Translucency;
				half Transmission;
				half Thickness;
				float Diffusion;
			};  
			    
			struct TVEModelData
			{    
				half Dummy;    
				half3 PositionOS;
				half3 PositionWS;
				half3 PositionWO;
				half3 PositionRawOS;
				half3 PositionAddOS;
				half3 PivotOS;
				half3 PivotWS;
				half3 PivotWO;
				half3 NormalOS;
				half3 NormalWS;
				half3 NormalRawOS;
				half3 NormalRawWS;
				half4 TangentOS;
				half3 ViewDirWS;
				half4 VertexData;
				half4 MotionData;
				half4 BoundsData;
				half4 RotationData;
			};    
			      
			struct TVEGlobalData
			{      
				half Dummy;      
				half4 CoatParams;
				half4 PaintParams;
				half4 GlowParams;
				half4 AtmoParams;
				half4 FadeParams;
				half4 FormParams;
				half4 LandParams;
				half4 WindParams;
				half4 PushParams;
			};      
			        
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END
			//#pragma editor_sync_compilation


			struct AttributesMesh
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 texcoord : TEXCOORD0;
				float4 uv1 : TEXCOORD1;
				float4 uv2 : TEXCOORD2;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryingsMeshToPS
			{
				float4 positionCS : SV_Position;
				float3 interp00 : TEXCOORD0;
				float3 interp01 : TEXCOORD1;
				float4 interp02 : TEXCOORD2;
				float4 interp03 : TEXCOORD3;
				float4 interp04 : TEXCOORD4;
				float4 interp05 : TEXCOORD5;
				float4 UVsFrame122_g156549 : TEXCOORD6;
				float4 UVsFrame222_g156549 : TEXCOORD7;
				float4 UVsFrame322_g156549 : TEXCOORD8;
				float4 octaframe22_g156549 : TEXCOORD9;
				float4 viewPos22_g156549 : TEXCOORD10;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START( UnityPerMaterial )
			float4 _DrynessColor;
			half4 _ImpostorColor;
			half4 _ImpostorColorTwo;
			float4 _OverlayGlitterTex_ST;
			half4 _InteractionColoring;
			float4 _AI_SizeOffset;
			half4 _SizeFadeColoring;
			half4 _VariationColoring;
			half4 _VariationColorTwo;
			half4 _VariationColorOne;
			half4 _VariationNoiseRemap;
			half4 _DitherColoring;
			half4 _TintingColoring;
			float4 _TintingColor;
			half4 _TintingLumaRemap;
			half4 _DrynessColoring;
			half4 _CutoutColoring;
			half4 _WetnessColoring;
			half4 _OverlayColor;
			half4 _OverlayProjRemap;
			half4 _DrynessLumaRemap;
			half4 _OverlayLumaRemap;
			half4 _OverlayColoringOn;
			half4 _OverlayColoringOff;
			half4 _SubsurfaceColor;
			half4 _OverlayGlitterColor;
			half4 _EmissiveColor;
			float4 _SubsurfaceDiffusion_Asset;
			half4 _OverlayBlendRemap1;
			float3 _AI_Offset;
			half _GlobalEnd;
			half _CutoutMultiValue;
			half _CutoutAlphaValue;
			half _CutoutNoiseValue;
			half _CutoutNoiseTillingValue;
			half _DitherLiteInfo;
			half _ImpostorMetallicValue;
			half _EmissiveExposureValue;
			float _emissive_power_value;
			half _DitherEnd;
			half _ImpostorColorMode;
			half _DitherConstantValue;
			half _EmissiveIntensityValue;
			half _GlobalLiteInfo;
			half _DitherDistanceValue;
			half _DitherCategory;
			half _DitherDistanceMaxValue;
			half _CutoutShadowMode;
			half _CutoutElementMode;
			half _OverlayIntensityValue;
			half _WetnessCategory;
			half _WetnessEnd;
			half _WetnessElementMode;
			half _WetnessIntensityValue;
			half _WetnessContrastValue;
			half _CutoutIntensityValue;
			half _WetnessSmoothnessValue;
			half _OverlayLumaValue;
			half _CutoutCategory;
			half _CutoutEnd;
			half _SubsurfaceIntensityValue;
			half _CutoutSpace;
			half _ImpostorSmoothnessValue;
			half _CutoutLiteInfo;
			half _OverlayGlitterDistValue;
			half _DitherDistanceMinValue;
			half _DitherShadowMode;
			half _SubsurfaceAmbientValue;
			half _SubsurfaceShadowValue;
			half _SubsurfaceElementMode;
			half _EmissiveCategory;
			half _GlobalCategory;
			half _EmissiveEnd;
			half _SubsurfaceNormalValue;
			half _EmissivePowerMode;
			half _EmissiveElementMode;
			half _OverlayCategory;
			half _OverlayEnd;
			half _OverlaySpace;
			half _OverlayElementMode;
			half _OverlayBakeInfo;
			half _EmissivePowerValue;
			half _OverlaySubsurfaceValue;
			half _SubsurfaceDirectValue;
			half _SubsurfaceCategory;
			half _DitherMultiValue;
			half _DitherNoiseTillingValue;
			half _OverlayProjValue;
			half _OverlaySmoothnessValue;
			half _SizeFadeCategory;
			half _SizeFadeEnd;
			half _SubsurfaceEnd;
			half _SizeFadeElementMode;
			half _SizeFadeScaleMode;
			half _SizeFadeScaleValue;
			half _SizeFadeDistMinValue;
			half _OverlayNormalValue;
			half _WetnessLiteInfo;
			half _SizeFadeDistMaxValue;
			half _SizeFadeIntensityValue;
			half _SizeFadeLiteInfo;
			half _ImpostorAlphaClipValue;
			half _DrynessMultiValue;
			half _RenderMotion;
			half _RenderShadow;
			half _ImpostorCategory;
			half _IsImpostorShader;
			half _IsSubsurfaceShader;
			half _IsLiteShader;
			half _ImpostorEnd;
			half _MotionWindCategory;
			half _MotionWindEnd;
			half _MotionWindElementMode;
			half _MotionInteractionCategory;
			half _MotionInteractionEnd;
			half _InteractionLiteInfo;
			half _MotionPushIntensityValue;
			half _MotionPushPivotValue;
			half _MotionPushMaskValue;
			half _MotionPushElementMode;
			half _IsIdentifier;
			half _IsConverted;
			half _IsCollected;
			half _HasDefaultTextures;
			half _OverlayGlitterTillingValue;
			half _OverlayGlitterIntensityValue;
			half _OverlayLiteInfo;
			half _SubsurfaceScatteringValue;
			half _SubsurfaceAngleValue;
			float _SubsurfaceDiffusion;
			half _SubsurfaceSpace;
			half _IsVersion;
			float _AI_Frames;
			half _RenderDecals;
			half _CategoryRender;
			half _EndRender;
			half _NoiseCategory;
			half _NoiseEnd;
			half _IsInitialized;
			half _IsTVEShader;
			half _IsCustomShader;
			half _IsShared;
			half _RenderSSR;
			half _DrynessLumaValue;
			float _AI_FramesX;
			float _AI_ImpostorSize;
			half _TintingSpace;
			half _TintingElementMode;
			half _TintingIntensityValue;
			half _TintingGrayValue;
			half _TintingMultiValue;
			half _TintingLumaValue;
			half _DrynessLiteInfo;
			half _DrynessCategory;
			half _DrynessEnd;
			half _DrynessSpace;
			half _DrynessElementMode;
			half _DrynessIntensityValue;
			half _SubsurfaceMultiValue;
			half _DrynessGrayValue;
			half _DrynessShiftValue;
			half _DrynessSmoothnessValue;
			half _DrynessSubsurfaceValue;
			half _TintingEnd;
			half _TintingCategory;
			half _TintingLiteInfo;
			half _VariationNoiseTillingValue;
			float _AI_Parallax;
			float _AI_TextureBias;
			float _AI_DepthSize;
			float _AI_ShadowBias;
			float _AI_ShadowView;
			float _AI_Clip;
			half _MotionBaseIntensityValue;
			half _MotionBasePivotValue;
			float _AI_FramesY;
			half _MotionTillingValue;
			half _global_wind_layer_value;
			half _MotionDelayValue;
			half _VariationLiteInfo;
			half _VariationCategory;
			half _VariationEnd;
			half _VariationIntensityValue;
			half _VariationMultiValue;
			half _VariationNoisePivotsValue1;
			half _MotionIntensityValue;
			half _SubsurfaceThicknessValue;
			float _BlendMode;
			CBUFFER_END

			TEXTURE2D(_OverlayGlitterTex);
			SAMPLER(sampler_OverlayGlitterTex);
			TEXTURE3D(_NoiseTex3D);
			SAMPLER(sampler_NoiseTex3D);
			float4x4 unity_CameraProjection;
			float4x4 unity_CameraInvProjection;
			float4x4 unity_WorldToCamera;
			float4x4 unity_CameraToWorld;
			TEXTURE2D(_Albedo);
			SAMPLER(sampler_Albedo);
			TEXTURE2D(_Normals);
			SAMPLER(sampler_Normals);
			float3 TVE_WorldOrigin;
			TEXTURE2D(_MotionNoiseTex);
			SAMPLER(sampler_Linear_Repeat);
			float TVE_WindLayers[10];
			TEXTURE2D_ARRAY(TVE_WindBaseTex);
			half4 TVE_RenderBaseCoords;
			SAMPLER(sampler_Linear_Clamp);
			TEXTURE2D_ARRAY(TVE_WindNearTex);
			half4 TVE_RenderNearCoords;
			float4 TVE_RenderNearPositionR;
			half TVE_RenderNearFadeValue;
			half4 TVE_WindParams;
			half _DisableSRPBatcher;
			TEXTURE2D(_MasksA);
			TEXTURE2D(_MasksB);
			SAMPLER(sampler_MasksA);
			SAMPLER(sampler_MasksB);
			half4 TVE_CoatParams;
			half4 TVE_PaintParams;
			half4 TVE_GlowParams;
			half4 TVE_AtmoParams;
			half4 TVE_FormParams;
			half4 TVE_PushParams;
			half TVE_IsEnabled;


			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Lighting/LightLoop/LightLoopDef.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Lighting/LightLoop/LightLoop.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"

			float2 VectortoOctahedron( float3 N )
			{
				N /= dot( 1.0, abs( N ) );
				if( N.z <= 0 )
				{
				N.xy = ( 1 - abs( N.yx ) ) * ( N.xy >= 0 ? 1.0 : -1.0 );
				}
				return N.xy;
			}
			
			float3 OctahedronToVector( float2 Oct )
			{
				float3 N = float3( Oct, 1.0 - dot( 1.0, abs( Oct ) ) );
				if(N.z< 0 )
				{
				N.xy = ( 1 - abs( N.yx) ) * (N.xy >= 0 ? 1.0 : -1.0 );
				}
				return normalize( N);
			}
			
			inline void RayPlaneIntersectionUV( float3 normalOS, float3 rayPosition, float3 rayDirection, inout float2 uvs, inout float3 localNormal )
			{
				float lDotN = dot( rayDirection, normalOS ); 
				float p0l0DotN = dot( -rayPosition, normalOS );
				float t = p0l0DotN / lDotN;
				float3 p = rayDirection * t + rayPosition;
				float3 upVector = float3( 0, 1, 0 );
				float3 tangent = normalize( cross( upVector, normalOS ) + float3( -0.001, 0, 0 ) );
				float3 bitangent = cross( tangent, normalOS );
				float frameX = dot( p, tangent );
				float frameZ = dot( p, bitangent );
				uvs = -float2( frameX, frameZ );
				if( t <= 0.0 )
				uvs = 0;
				float3x3 worldToLocal = float3x3( tangent, bitangent, normalOS );
				localNormal = normalize( mul( worldToLocal, rayDirection ) );
			}
			
			inline void OctaImpostorVertex( inout float4 positionOS, inout float3 normalOS, inout float4 uvsFrame1, inout float4 uvsFrame2, inout float4 uvsFrame3, inout float4 octaFrame, inout float4 viewPos )
			{
				float2 uvOffset = _AI_SizeOffset.zw;
				float parallax = -_AI_Parallax; 
				float UVscale = _AI_ImpostorSize;
				float framesXY = _AI_Frames;
				float prevFrame = framesXY - 1;
				float3 fractions = 1.0 / float3( framesXY, prevFrame, UVscale );
				float fractionsFrame = fractions.x;
				float fractionsPrevFrame = fractions.y;
				float fractionsUVscale = fractions.z;
				float3 worldCameraPos;
				#if defined(UNITY_PASS_SHADOWCASTER)
				float3 worldOrigin = 0;
				float4 perspective = float4( 0, 0, 0, 1 );
				if ( UNITY_MATRIX_P[ 3 ][ 3 ] == 1 )
				{
				perspective = float4( 0, 0, 5000, 0 );
				worldOrigin = ai_ObjectToWorld._m03_m13_m23;
				}
				worldCameraPos = worldOrigin + mul( UNITY_MATRIX_I_V, perspective ).xyz;
				#else
				if ( UNITY_MATRIX_P[ 3 ][ 3 ] == 1 )
				{
				worldCameraPos = ai_ObjectToWorld._m03_m13_m23 + UNITY_MATRIX_I_V._m02_m12_m22 * 5000;
				}
				else
				{
				worldCameraPos = GetCameraRelativePositionWS( _WorldSpaceCameraPos );
				}
				#endif
				float3 objectCameraPosition = mul( ai_WorldToObject, float4( worldCameraPos, 1 ) ).xyz - _AI_Offset.xyz; 
				float3 objectCameraDirection = normalize( objectCameraPosition );
				float3 upVector = float3( 0,1,0 );
				float3 objectHorizontalVector = normalize( cross( objectCameraDirection, upVector ) );
				float3 objectVerticalVector = cross( objectHorizontalVector, objectCameraDirection );
				float2 uvExpansion = positionOS.xy;
				float3 billboard = objectHorizontalVector * uvExpansion.x + objectVerticalVector * uvExpansion.y;
				float3 localDir = billboard - objectCameraPosition; 
				objectCameraDirection = trunc( objectCameraDirection * 65536.0 ) / 65536.0;
				float2 frameOcta = VectortoOctahedron( objectCameraDirection.xzy ) * 0.5 + 0.5;
				float2 prevOctaFrame = frameOcta * prevFrame;
				float2 baseOctaFrame = floor( prevOctaFrame );
				float2 fractionOctaFrame = ( baseOctaFrame * fractionsFrame );
				float2 octaFrame1 = ( baseOctaFrame * fractionsPrevFrame ) * 2.0 - 1.0;
				float3 octa1WorldY = OctahedronToVector( octaFrame1 ).xzy;
				float3 octa1LocalY;
				float2 uvFrame1;
				RayPlaneIntersectionUV( octa1WorldY, objectCameraPosition, localDir, /*inout*/ uvFrame1, /*inout*/ octa1LocalY );
				float2 uvParallax1 = octa1LocalY.xy * fractionsFrame * parallax;
				uvFrame1 = ( uvFrame1 * fractionsUVscale + 0.5 ) * fractionsFrame + fractionOctaFrame;
				uvsFrame1 = float4( uvParallax1, uvFrame1) - float4( 0, 0, uvOffset );
				float2 fractPrevOctaFrame = frac( prevOctaFrame );
				float2 cornerDifference = lerp( float2( 0,1 ) , float2( 1,0 ) , saturate( ceil( ( fractPrevOctaFrame.x - fractPrevOctaFrame.y ) ) ));
				float2 octaFrame2 = ( ( baseOctaFrame + cornerDifference ) * fractionsPrevFrame ) * 2.0 - 1.0;
				float3 octa2WorldY = OctahedronToVector( octaFrame2 ).xzy;
				float3 octa2LocalY;
				float2 uvFrame2;
				RayPlaneIntersectionUV( octa2WorldY, objectCameraPosition, localDir, /*inout*/ uvFrame2, /*inout*/ octa2LocalY );
				float2 uvParallax2 = octa2LocalY.xy * fractionsFrame * parallax;
				uvFrame2 = ( uvFrame2 * fractionsUVscale + 0.5 ) * fractionsFrame + ( ( cornerDifference * fractionsFrame ) + fractionOctaFrame );
				uvsFrame2 = float4( uvParallax2, uvFrame2) - float4( 0, 0, uvOffset );
				float2 octaFrame3 = ( ( baseOctaFrame + 1 ) * fractionsPrevFrame  ) * 2.0 - 1.0;
				float3 octa3WorldY = OctahedronToVector( octaFrame3 ).xzy;
				float3 octa3LocalY;
				float2 uvFrame3;
				RayPlaneIntersectionUV( octa3WorldY, objectCameraPosition, localDir, /*inout*/ uvFrame3, /*inout*/ octa3LocalY );
				float2 uvParallax3 = octa3LocalY.xy * fractionsFrame * parallax;
				uvFrame3 = ( uvFrame3 * fractionsUVscale + 0.5 ) * fractionsFrame + ( fractionOctaFrame + fractionsFrame );
				uvsFrame3 = float4( uvParallax3, uvFrame3) - float4( 0, 0, uvOffset );
				octaFrame = 0;
				octaFrame.xy = prevOctaFrame;
				octaFrame.zw = fractionOctaFrame;
				positionOS.xyz = billboard + _AI_Offset.xyz;
				normalOS.xyz = objectCameraDirection;
				viewPos = 0;
				viewPos.xyz = TransformWorldToView( TransformObjectToWorld( positionOS.xyz ) );
			}
			
			float3 ObjectPosition_UNITY_MATRIX_M(  )
			{
				return float3(UNITY_MATRIX_M[0].w, UNITY_MATRIX_M[1].w, UNITY_MATRIX_M[2].w );
			}
			
			inline void OctaImpostorFragment( inout SurfaceOutput o, out float4 positionCS, out float3 positionWS, float4 uvsFrame1, float4 uvsFrame2, float4 uvsFrame3, float4 octaFrame, float4 interpViewPos, out float4 output0, out float4 output1 )
			{
				float depthBias = -1.0;
				float textureBias = _AI_TextureBias;
				float2 fraction = frac( octaFrame.xy );
				float2 invFraction = 1 - fraction;
				float3 weights;
				weights.x = min( invFraction.x, invFraction.y );
				weights.y = abs( fraction.x - fraction.y );
				weights.z = min( fraction.x, fraction.y );
				float4 parallaxSample1 = SAMPLE_TEXTURE2D_BIAS( _Normals, sampler_Normals, uvsFrame1.zw, depthBias );
				float2 parallax1 = ( ( 0.5 - parallaxSample1.a ) * uvsFrame1.xy ) + uvsFrame1.zw;
				float4 parallaxSample2 = SAMPLE_TEXTURE2D_BIAS( _Normals, sampler_Normals, uvsFrame2.zw, depthBias );
				float2 parallax2 = ( ( 0.5 - parallaxSample2.a ) * uvsFrame2.xy ) + uvsFrame2.zw;
				float4 parallaxSample3 = SAMPLE_TEXTURE2D_BIAS( _Normals, sampler_Normals, uvsFrame3.zw, depthBias );
				float2 parallax3 = ( ( 0.5 - parallaxSample3.a ) * uvsFrame3.xy ) + uvsFrame3.zw;
				float4 albedo1 = SAMPLE_TEXTURE2D_BIAS( _Albedo, sampler_Albedo, parallax1, textureBias );
				float4 albedo2 = SAMPLE_TEXTURE2D_BIAS( _Albedo, sampler_Albedo, parallax2, textureBias );
				float4 albedo3 = SAMPLE_TEXTURE2D_BIAS( _Albedo, sampler_Albedo, parallax3, textureBias );
				float4 blendedAlbedo = albedo1 * weights.x + albedo2 * weights.y + albedo3 * weights.z;
				o.Alpha = ( blendedAlbedo.a - _AI_Clip );
				clip( o.Alpha );
				float t = ceil( fraction.x - fraction.y );
				float4 cornerDifference = float4( t, 1 - t, 1, 1 );
				float2 step_1 = ( parallax1 - octaFrame.zw ) * _AI_Frames;
				float4 step23 = ( float4( parallax2, parallax3 ) -  octaFrame.zwzw ) * _AI_Frames - cornerDifference;
				step_1 = step_1 * (1-step_1);
				step23 = step23 * (1-step23);
				float3 steps;
				steps.x = step_1.x * step_1.y;
				steps.y = step23.x * step23.y;
				steps.z = step23.z * step23.w;
				steps = step(-steps, 0);
				float final = dot( steps, weights );
				clip( final - 0.5 );
				o.Albedo = blendedAlbedo.rgb;
				#if defined(AI_HD_RENDERPIPELINE)
				float4 feat1 = _Features.SampleLevel( SamplerState_Point_Repeat, parallax1, 0);
				o.Diffusion = feat1.rgb;
				o.Features = feat1.a;
				float4 test1 = _Specular.SampleLevel( SamplerState_Point_Repeat, parallax1, 0);
				o.MetalTangent = test1.b;
				#endif
				float4 normals1 = SAMPLE_TEXTURE2D_BIAS( _Normals, sampler_Normals, parallax1, textureBias );
				float4 normals2 = SAMPLE_TEXTURE2D_BIAS( _Normals, sampler_Normals, parallax2, textureBias );
				float4 normals3 = SAMPLE_TEXTURE2D_BIAS( _Normals, sampler_Normals, parallax3, textureBias );
				float4 blendedNormal = normals1 * weights.x  + normals2 * weights.y + normals3 * weights.z;
				float4 output0a = SAMPLE_TEXTURE2D_BIAS( _MasksA, sampler_MasksA, parallax1, textureBias );
				float4 output0b = SAMPLE_TEXTURE2D_BIAS( _MasksA, sampler_MasksA, parallax2, textureBias );
				float4 output0c = SAMPLE_TEXTURE2D_BIAS( _MasksA, sampler_MasksA, parallax3, textureBias );
				output0 = output0a * weights.x  + output0b * weights.y + output0c * weights.z; 
				float4 output1a = SAMPLE_TEXTURE2D_BIAS( _MasksB, sampler_MasksB, parallax1, textureBias );
				float4 output1b = SAMPLE_TEXTURE2D_BIAS( _MasksB, sampler_MasksB, parallax2, textureBias );
				float4 output1c = SAMPLE_TEXTURE2D_BIAS( _MasksB, sampler_MasksB, parallax3, textureBias );
				output1 = output1a * weights.x  + output1b * weights.y + output1c * weights.z; 
				float3 localNormal = blendedNormal.rgb * 2.0 - 1.0;
				float3 worldNormal = normalize( mul( (float3x3)ai_ObjectToWorld, localNormal ) );
				o.Normal = worldNormal;
				float3 viewPos = interpViewPos.xyz;
				float depthOffset = ( ( parallaxSample1.a * weights.x + parallaxSample2.a * weights.y + parallaxSample3.a * weights.z ) - 0.5 /** 2.0 - 1.0*/ ) /** 0.5*/ * _AI_DepthSize * length( ai_ObjectToWorld[ 2 ].xyz );
				#if ( defined(SHADERPASS) && ((defined(SHADERPASS_SHADOWS) && SHADERPASS == SHADERPASS_SHADOWS) || (defined(SHADERPASS_SHADOWCASTER) && SHADERPASS == SHADERPASS_SHADOWCASTER)) ) || defined(UNITY_PASS_SHADOWCASTER)
				viewPos.z += depthOffset * _AI_ShadowView;
				viewPos.z += -_AI_ShadowBias;
				#else 
				viewPos.z += depthOffset;
				#endif
				positionWS = mul( UNITY_MATRIX_I_V, float4( viewPos.xyz, 1 ) ).xyz;
				positionCS = mul( UNITY_MATRIX_P, float4( viewPos, 1 ) );
				#if defined(UNITY_PASS_SHADOWCASTER) && !defined(SHADERPASS)
				#if UNITY_REVERSED_Z
				positionCS.z = min( positionCS.z, positionCS.w * UNITY_NEAR_CLIP_VALUE );
				#else
				positionCS.z = max( positionCS.z, positionCS.w * UNITY_NEAR_CLIP_VALUE );
				#endif
				#endif
				positionCS.xyz /= positionCS.w;
				if( UNITY_NEAR_CLIP_VALUE < 0 )
				positionCS = positionCS * 0.5 + 0.5;
			}
			
			float3 ASEGetEmissionHDRColor(float3 ldrColor, float luminanceIntensity, float exposureWeight, float inverseCurrentExposureMultiplier)
			{
				float3 hdrColor = ldrColor * luminanceIntensity;
				hdrColor = lerp( hdrColor* inverseCurrentExposureMultiplier, hdrColor, exposureWeight);
				return hdrColor;
			}
			

			void BuildSurfaceData(FragInputs fragInputs, inout GlobalSurfaceDescription surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData, out float3 bentNormalWS)
			{
				ZERO_INITIALIZE(SurfaceData, surfaceData);
				surfaceData.baseColor =                 surfaceDescription.Albedo;
				surfaceData.perceptualSmoothness =      surfaceDescription.Smoothness;
				surfaceData.ambientOcclusion =          surfaceDescription.Occlusion;
				surfaceData.specularColor =             surfaceDescription.Specular;
				surfaceData.coatMask =                  surfaceDescription.CoatMask;

				#ifdef _HAS_REFRACTION
					if (_EnableSSRefraction)
					{
						surfaceData.ior =                       surfaceDescription.RefractionIndex;
						surfaceData.transmittanceColor =        surfaceDescription.RefractionColor;
						surfaceData.atDistance =                surfaceDescription.RefractionDistance;

						surfaceData.transmittanceMask = (1.0 - surfaceDescription.Alpha);
						surfaceDescription.Alpha = 1.0;
					}
					else
					{
						surfaceData.ior = 1.0;
						surfaceData.transmittanceColor = float3(1.0, 1.0, 1.0);
						surfaceData.atDistance = 1.0;
						surfaceData.transmittanceMask = 0.0;
						surfaceDescription.Alpha = 1.0;
					}
				#else
					surfaceData.ior = 1.0;
					surfaceData.transmittanceColor = float3(1.0, 1.0, 1.0);
					surfaceData.atDistance = 1.0;
					surfaceData.transmittanceMask = 0.0;
				#endif

				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
					surfaceData.iridescenceMask =           surfaceDescription.IridescenceMask;
					surfaceData.iridescenceThickness =      surfaceDescription.IridescenceThickness;
				#endif

				surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;
				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
					surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
				#endif
				#ifdef _MATERIAL_FEATURE_TRANSMISSION
					surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
				#endif
				#ifdef _MATERIAL_FEATURE_ANISOTROPY
					surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;
				#endif
				#ifdef ASE_LIT_CLEAR_COAT
					surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_CLEAR_COAT;
				#endif
				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
					surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
				#endif
				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
					surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
				#endif

				#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
					surfaceData.baseColor *= (1.0 - Max3(surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b));
				#endif

				GetNormalWS( fragInputs, float3( 0.0, 0.0, 1.0 ), surfaceData.normalWS, float3( 1.0, 1.0, 1.0 ) );

				bentNormalWS = surfaceData.normalWS;

				#ifdef ASE_BENT_NORMAL
					GetNormalWS(fragInputs, surfaceDescription.BentNormal, bentNormalWS, float3( 1, 1, 1 ) );
				#endif

				surfaceData.geomNormalWS = T2W(fragInputs, 2);

				#if defined(_HAS_REFRACTION) || defined(_MATERIAL_FEATURE_TRANSMISSION)
					surfaceData.thickness = surfaceDescription.Thickness;
				#endif

				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
					surfaceData.subsurfaceMask = surfaceDescription.SubsurfaceMask;
				#endif

				#ifdef _MATERIAL_FEATURE_TRANSMISSION
				surfaceData.transmissionMask = surfaceDescription.TransmissionMask;
				#endif

				#if defined( _MATERIAL_FEATURE_SUBSURFACE_SCATTERING ) || defined( _MATERIAL_FEATURE_TRANSMISSION )
					surfaceData.diffusionProfileHash = asuint(surfaceDescription.DiffusionProfile);
				#endif

				surfaceData.tangentWS = normalize( T2W(fragInputs, 0).xyz );
				#ifdef _MATERIAL_FEATURE_ANISOTROPY
					surfaceData.anisotropy = surfaceDescription.Anisotropy;
					surfaceData.tangentWS = TransformTangentToWorld(surfaceDescription.Tangent, fragInputs.worldToTangent);
				#endif
				surfaceData.tangentWS = Orthonormalize(surfaceData.tangentWS, surfaceData.normalWS);

				#if defined(_SPECULAR_OCCLUSION_CUSTOM)
					surfaceData.specularOcclusion = surfaceDescription.SpecularOcclusion;
				#elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
					surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO(V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness(surfaceData.perceptualSmoothness));
				#elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
					surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion(ClampNdotV(dot(surfaceData.normalWS, V)), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness(surfaceData.perceptualSmoothness));
				#else
					surfaceData.specularOcclusion = 1.0;
				#endif

				#ifdef _ENABLE_GEOMETRIC_SPECULAR_AA
					surfaceData.perceptualSmoothness = GeometricNormalFiltering(surfaceData.perceptualSmoothness, T2W(fragInputs, 2), surfaceDescription.SpecularAAScreenSpaceVariance, surfaceDescription.SpecularAAThreshold);
				#endif
			}

			void GetSurfaceAndBuiltinData(GlobalSurfaceDescription surfaceDescription,FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
			{
				//#ifdef LOD_FADE_CROSSFADE
				//	uint3 fadeMaskSeed = asuint((int3)(V * _ScreenSize.xyx));
				//	LODDitheringTransition(fadeMaskSeed, unity_LODFade.x);
				//#endif

				#ifdef _ALPHATEST_ON
						DoAlphaTest(surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold);
				#endif

				float3 bentNormalWS;
				BuildSurfaceData(fragInputs, surfaceDescription, V, posInput, surfaceData, bentNormalWS);

				#if HAVE_DECALS
				if( _EnableDecals )
				{
					DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, surfaceDescription.Alpha);
					ApplyDecalToSurfaceData(decalSurfaceData, fragInputs.tangentToWorld[2], surfaceData);
				}
				#endif

				#if defined( ASE_SRP_VERSION ) && ASE_SRP_VERSION <= 50702
					InitBuiltinData( surfaceDescription.Alpha, bentNormalWS, -T2W(fragInputs, 2), fragInputs.positionRWS, fragInputs.texCoord1, fragInputs.texCoord2, builtinData );
				#else
					InitBuiltinData( posInput, surfaceDescription.Alpha, bentNormalWS, -T2W(fragInputs, 2), fragInputs.texCoord1, fragInputs.texCoord2, builtinData );
				#endif

				builtinData.emissiveColor = surfaceDescription.Emission;

				builtinData.depthOffset = 0.0;

				#if (SHADERPASS == SHADERPASS_DISTORTION)
					builtinData.distortion = surfaceDescription.Distortion;
					builtinData.distortionBlur = surfaceDescription.DistortionBlur;
				#else
					builtinData.distortion = float2(0.0, 0.0);
					builtinData.distortionBlur = 0.0;
				#endif

				PostInitBuiltinData(V, posInput, surfaceData, builtinData);
			}

			PackedVaryingsMeshToPS Vert(AttributesMesh inputMesh )
			{
				PackedVaryingsMeshToPS outputPackedVaryingsMeshToPS;

				UNITY_SETUP_INSTANCE_ID( inputMesh );
				UNITY_TRANSFER_INSTANCE_ID( inputMesh, outputPackedVaryingsMeshToPS );
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( outputPackedVaryingsMeshToPS );

				TVEModelData Data16_g158299 = (TVEModelData)0;
				float In_Dummy16_g158299 = 0.0;
				TVEModelData Data16_g158264 = (TVEModelData)0;
				half4 Dummy181_g158262 = ( ( _MotionWindCategory + _MotionWindEnd ) + _MotionWindElementMode + ( _MotionInteractionCategory + _MotionInteractionEnd ) + ( _InteractionLiteInfo + _InteractionColoring + _MotionPushIntensityValue + _MotionPushPivotValue + _MotionPushMaskValue + _MotionPushElementMode ) );
				float In_Dummy16_g158264 = Dummy181_g158262.r;
				TVEModelData Data16_g157153 = (TVEModelData)0;
				float In_Dummy16_g157153 = 0.0;
				OctaImpostorVertex( inputMesh.positionOS, inputMesh.normalOS, outputPackedVaryingsMeshToPS.UVsFrame122_g156549, outputPackedVaryingsMeshToPS.UVsFrame222_g156549, outputPackedVaryingsMeshToPS.UVsFrame322_g156549, outputPackedVaryingsMeshToPS.octaframe22_g156549, outputPackedVaryingsMeshToPS.viewPos22_g156549 );
				float3 worldPosOut22_g156549 = GetAbsolutePositionWS( mul( UNITY_MATRIX_I_V, float4( outputPackedVaryingsMeshToPS.viewPos22_g156549.xyz, 1.0 ) ).xyz );
				half3 Input_PositionWS218_g157146 = worldPosOut22_g156549;
				float3 worldToObj278_g157146 = mul( GetWorldToObjectMatrix(), float4( GetCameraRelativePositionWS(Input_PositionWS218_g157146), 1 ) ).xyz;
				half3 Model_PositionOS131_g157146 = worldToObj278_g157146;
				float3 In_PositionOS16_g157153 = Model_PositionOS131_g157146;
				half3 Model_PositionWS122_g157146 = Input_PositionWS218_g157146;
				float3 In_PositionWS16_g157153 = Model_PositionWS122_g157146;
				half3 Model_PositionWO132_g157146 = ( Model_PositionWS122_g157146 - TVE_WorldOrigin );
				float3 In_PositionWO16_g157153 = Model_PositionWO132_g157146;
				float3 In_PositionRawOS16_g157153 = Model_PositionOS131_g157146;
				float3 In_PositionAddOS16_g157153 = float3( 0,0,0 );
				float3 In_PivotOS16_g157153 = float3( 0,0,0 );
				float3 localObjectPosition_UNITY_MATRIX_M14_g157148 = ObjectPosition_UNITY_MATRIX_M();
				#ifdef SHADEROPTIONS_CAMERA_RELATIVE_RENDERING
				float3 staticSwitch13_g157148 = ( localObjectPosition_UNITY_MATRIX_M14_g157148 + _WorldSpaceCameraPos );
				#else
				float3 staticSwitch13_g157148 = localObjectPosition_UNITY_MATRIX_M14_g157148;
				#endif
				half3 ObjectData20_g157150 = staticSwitch13_g157148;
				float3 ase_worldPos = GetAbsolutePositionWS( TransformObjectToWorld( (inputMesh.positionOS).xyz ) );
				half3 WorldData19_g157150 = ase_worldPos;
				#ifdef TVE_OBJECT_BATCHED
				float3 staticSwitch14_g157150 = WorldData19_g157150;
				#else
				float3 staticSwitch14_g157150 = ObjectData20_g157150;
				#endif
				float3 temp_output_124_0_g157148 = staticSwitch14_g157150;
				float3 vertexToFrag281_g157146 = temp_output_124_0_g157148;
				half3 Model_PivotWS121_g157146 = vertexToFrag281_g157146;
				float3 In_PivotWS16_g157153 = Model_PivotWS121_g157146;
				half3 Model_PivotWO133_g157146 = ( Model_PivotWS121_g157146 - TVE_WorldOrigin );
				float3 In_PivotWO16_g157153 = Model_PivotWO133_g157146;
				half3 Model_NormalOS134_g157146 = inputMesh.normalOS;
				float3 In_NormalOS16_g157153 = Model_NormalOS134_g157146;
				float3 ase_worldNormal = TransformObjectToWorldNormal(inputMesh.normalOS);
				half3 Model_Normal_WS95_g157146 = ase_worldNormal;
				float3 In_NormalWS16_g157153 = Model_Normal_WS95_g157146;
				float3 In_NormalRawOS16_g157153 = Model_NormalOS134_g157146;
				float3 In_NormalRawWS16_g157153 = Model_Normal_WS95_g157146;
				float4 In_TangentOS16_g157153 = float4( 0,1,0,1 );
				float3 normalizeResult326_g157146 = normalize( ( _WorldSpaceCameraPos - Model_PositionWS122_g157146 ) );
				half3 Model_ViewDirWS322_g157146 = normalizeResult326_g157146;
				float3 In_ViewDirWS16_g157153 = Model_ViewDirWS322_g157146;
				float4 In_VertexData16_g157153 = float4( 1,1,1,1 );
				float4 In_MotionData16_g157153 = float4( 0,0,0,0 );
				float4 In_BoundsData16_g157153 = float4( 1,1,1,1 );
				float4 In_RotationData16_g157153 = float4( 0,0,0,0 );
				Data16_g157153.Dummy = In_Dummy16_g157153;
				Data16_g157153.PositionOS = In_PositionOS16_g157153;
				Data16_g157153.PositionWS = In_PositionWS16_g157153;
				Data16_g157153.PositionWO = In_PositionWO16_g157153;
				Data16_g157153.PositionRawOS = In_PositionRawOS16_g157153;
				Data16_g157153.PositionAddOS = In_PositionAddOS16_g157153;
				Data16_g157153.PivotOS = In_PivotOS16_g157153;
				Data16_g157153.PivotWS = In_PivotWS16_g157153;
				Data16_g157153.PivotWO = In_PivotWO16_g157153;
				Data16_g157153.NormalOS = In_NormalOS16_g157153;
				Data16_g157153.NormalWS = In_NormalWS16_g157153;
				Data16_g157153.NormalRawOS = In_NormalRawOS16_g157153;
				Data16_g157153.NormalRawWS = In_NormalRawWS16_g157153;
				Data16_g157153.TangentOS = In_TangentOS16_g157153;
				Data16_g157153.ViewDirWS = In_ViewDirWS16_g157153;
				Data16_g157153.VertexData = In_VertexData16_g157153;
				Data16_g157153.MotionData = In_MotionData16_g157153;
				Data16_g157153.BoundsData = In_BoundsData16_g157153;
				Data16_g157153.RotationData = In_RotationData16_g157153;
				TVEModelData Data15_g158263 = Data16_g157153;
				float Out_Dummy15_g158263 = 0;
				float3 Out_PositionOS15_g158263 = float3( 0,0,0 );
				float3 Out_PositionWS15_g158263 = float3( 0,0,0 );
				float3 Out_PositionWO15_g158263 = float3( 0,0,0 );
				float3 Out_PositionRawOS15_g158263 = float3( 0,0,0 );
				float3 Out_PositionAddOS15_g158263 = float3( 0,0,0 );
				float3 Out_PivotOS15_g158263 = float3( 0,0,0 );
				float3 Out_PivotWS15_g158263 = float3( 0,0,0 );
				float3 Out_PivotWO15_g158263 = float3( 0,0,0 );
				float3 Out_NormalOS15_g158263 = float3( 0,0,0 );
				float3 Out_NormalWS15_g158263 = float3( 0,0,0 );
				float3 Out_NormalRawOS15_g158263 = float3( 0,0,0 );
				float3 Out_NormalRawWS15_g158263 = float3( 0,0,0 );
				float4 Out_TangentOS15_g158263 = float4( 0,0,0,0 );
				float3 Out_ViewDirWS15_g158263 = float3( 0,0,0 );
				float4 Out_VertexData15_g158263 = float4( 0,0,0,0 );
				float4 Out_MotionData15_g158263 = float4( 0,0,0,0 );
				float4 Out_BoundsData15_g158263 = float4( 0,0,0,0 );
				float4 Out_RotationData15_g158263 = float4( 0,0,0,0 );
				Out_Dummy15_g158263 = Data15_g158263.Dummy;
				Out_PositionOS15_g158263 = Data15_g158263.PositionOS;
				Out_PositionWS15_g158263 = Data15_g158263.PositionWS;
				Out_PositionWO15_g158263 = Data15_g158263.PositionWO;
				Out_PositionRawOS15_g158263 = Data15_g158263.PositionRawOS;
				Out_PositionAddOS15_g158263 = Data15_g158263.PositionAddOS;
				Out_PivotOS15_g158263 = Data15_g158263.PivotOS;
				Out_PivotWS15_g158263 = Data15_g158263.PivotWS;
				Out_PivotWO15_g158263 = Data15_g158263.PivotWO;
				Out_NormalOS15_g158263 = Data15_g158263.NormalOS;
				Out_NormalWS15_g158263 = Data15_g158263.NormalWS;
				Out_NormalRawOS15_g158263 = Data15_g158263.NormalRawOS;
				Out_NormalRawWS15_g158263 = Data15_g158263.NormalRawWS;
				Out_TangentOS15_g158263 = Data15_g158263.TangentOS;
				Out_ViewDirWS15_g158263 = Data15_g158263.ViewDirWS;
				Out_VertexData15_g158263 = Data15_g158263.VertexData;
				Out_MotionData15_g158263 = Data15_g158263.MotionData;
				Out_BoundsData15_g158263 = Data15_g158263.BoundsData;
				Out_RotationData15_g158263 = Data15_g158263.RotationData;
				float3 temp_output_1567_0_g158262 = Out_PositionOS15_g158263;
				float3 In_PositionOS16_g158264 = temp_output_1567_0_g158262;
				float3 In_PositionWS16_g158264 = Out_PositionWS15_g158263;
				float3 temp_output_1567_17_g158262 = Out_PositionWO15_g158263;
				float3 In_PositionWO16_g158264 = temp_output_1567_17_g158262;
				float3 In_PositionRawOS16_g158264 = Out_PositionRawOS15_g158263;
				float3 In_PositionAddOS16_g158264 = Out_PositionAddOS15_g158263;
				float3 In_PivotOS16_g158264 = Out_PivotOS15_g158263;
				float3 In_PivotWS16_g158264 = Out_PivotWS15_g158263;
				float3 temp_output_1567_19_g158262 = Out_PivotWO15_g158263;
				float3 In_PivotWO16_g158264 = temp_output_1567_19_g158262;
				float3 In_NormalOS16_g158264 = Out_NormalOS15_g158263;
				float3 In_NormalWS16_g158264 = Out_NormalWS15_g158263;
				float3 In_NormalRawOS16_g158264 = Out_NormalRawOS15_g158263;
				float3 In_NormalRawWS16_g158264 = Out_NormalRawWS15_g158263;
				float4 In_TangentOS16_g158264 = Out_TangentOS15_g158263;
				float3 In_ViewDirWS16_g158264 = Out_ViewDirWS15_g158263;
				float4 In_VertexData16_g158264 = Out_VertexData15_g158263;
				float4 In_MotionData16_g158264 = Out_MotionData15_g158263;
				float4 In_BoundsData16_g158264 = Out_BoundsData15_g158263;
				float2 temp_cast_1 = (0.0).xx;
				half3 Model_PositionOS147_g158262 = temp_output_1567_0_g158262;
				half Base_Mask217_g158262 = saturate( ( Model_PositionOS147_g158262.y / _AI_Offset.y ) );
				half3 Model_PositionWO162_g158262 = temp_output_1567_17_g158262;
				half3 Model_PivotWO402_g158262 = temp_output_1567_19_g158262;
				float3 lerpResult829_g158262 = lerp( Model_PositionWO162_g158262 , Model_PivotWO402_g158262 , _MotionBasePivotValue);
				half3 Base_Position1394_g158262 = lerpResult829_g158262;
				half3 Input_PositionWO419_g158267 = Base_Position1394_g158262;
				half Flow_Tillling1397_g158262 = _MotionTillingValue;
				half Input_MotionTilling321_g158267 = ( Flow_Tillling1397_g158262 + 0.2 );
				half2 Noise_Coord515_g158267 = ( -(Input_PositionWO419_g158267).xz * Input_MotionTilling321_g158267 * 0.005 );
				half4 Noise_Params535_g158267 = SAMPLE_TEXTURE2D_LOD( _MotionNoiseTex, sampler_Linear_Repeat, Noise_Coord515_g158267, 0.0 );
				float2 temp_output_648_0_g158267 = (Noise_Params535_g158267).rg;
				half Flow_Value1602_g158262 = _MotionIntensityValue;
				half Input_MotionValue629_g158267 = Flow_Value1602_g158262;
				float2 lerpResult645_g158267 = lerp( float2( 0.5,0.5 ) , temp_output_648_0_g158267 , Input_MotionValue629_g158267);
				float3 appendResult566_g158267 = (float3(lerpResult645_g158267 , (Noise_Params535_g158267).b));
				float temp_output_136_0_g158268 = _global_wind_layer_value;
				float temp_output_19_0_g158270 = TVE_WindLayers[(int)temp_output_136_0_g158268];
				half3 Input_Position180_g158271 = Input_PositionWO419_g158267;
				float2 temp_output_75_0_g158271 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g158271).xz ) );
				float temp_output_82_0_g158271 = temp_output_136_0_g158268;
				float2 temp_output_119_0_g158271 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g158271).xz ) );
				float temp_output_7_0_g158276 = 1.0;
				float temp_output_10_0_g158276 = ( TVE_RenderNearFadeValue - temp_output_7_0_g158276 );
				float4 lerpResult131_g158271 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_WindBaseTex, sampler_Linear_Clamp, temp_output_75_0_g158271,temp_output_82_0_g158271, 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_WindNearTex, sampler_Linear_Repeat, temp_output_119_0_g158271,temp_output_82_0_g158271, 0.0 ) , saturate( ( ( saturate( ( distance( Input_Position180_g158271 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g158276 ) / temp_output_10_0_g158276 ) ));
				float4 temp_output_17_0_g158270 = lerpResult131_g158271;
				float4 temp_output_3_0_g158270 = TVE_WindParams;
				float4 ifLocalVar18_g158270 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g158270 >= 0.5 )
				ifLocalVar18_g158270 = temp_output_17_0_g158270;
				else
				ifLocalVar18_g158270 = temp_output_3_0_g158270;
				float4 lerpResult22_g158270 = lerp( temp_output_3_0_g158270 , temp_output_17_0_g158270 , temp_output_19_0_g158270);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g158270 = lerpResult22_g158270;
				#else
				float4 staticSwitch24_g158270 = ifLocalVar18_g158270;
				#endif
				float4 temp_output_610_0_g158267 = staticSwitch24_g158270;
				float3 appendResult643_g158267 = (float3((temp_output_610_0_g158267).rg , (temp_output_610_0_g158267).b));
				float3 lerpResult623_g158267 = lerp( appendResult566_g158267 , appendResult643_g158267 , (temp_output_610_0_g158267).a);
				#ifdef TVE_MOTION_WIND_ELEMENT
				float3 staticSwitch612_g158267 = lerpResult623_g158267;
				#else
				float3 staticSwitch612_g158267 = appendResult566_g158267;
				#endif
				float3 temp_output_1620_567_g158262 = staticSwitch612_g158267;
				half Base_Noise1590_g158262 = (temp_output_1620_567_g158262).z;
				float2 break83_g158266 = ((temp_output_1620_567_g158262).xy*2.0 + -1.0);
				float3 appendResult79_g158266 = (float3(break83_g158266.x , 0.0 , break83_g158266.y));
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				half2 Base_Direction893_g158262 = (( mul( GetWorldToObjectMatrix(), float4( appendResult79_g158266 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half Base_Intensity1615_g158262 = length( Base_Direction893_g158262 );
				half Flow_Delay1626_g158262 = _MotionDelayValue;
				float lerpResult1623_g158262 = lerp( 1.0 , ( Base_Intensity1615_g158262 * Base_Intensity1615_g158262 ) , Flow_Delay1626_g158262);
				#ifdef TVE_MOTION_BASE_BENDING
				float2 staticSwitch1573_g158262 = ( _MotionBaseIntensityValue * Base_Mask217_g158262 * Base_Noise1590_g158262 * Base_Direction893_g158262 * lerpResult1623_g158262 );
				#else
				float2 staticSwitch1573_g158262 = temp_cast_1;
				#endif
				half2 Base_Motion1440_g158262 = staticSwitch1573_g158262;
				half2 Final_RoationData1570_g158262 = Base_Motion1440_g158262;
				float4 In_RotationData16_g158264 = float4( Final_RoationData1570_g158262, 0.0 , 0.0 );
				Data16_g158264.Dummy = In_Dummy16_g158264;
				Data16_g158264.PositionOS = In_PositionOS16_g158264;
				Data16_g158264.PositionWS = In_PositionWS16_g158264;
				Data16_g158264.PositionWO = In_PositionWO16_g158264;
				Data16_g158264.PositionRawOS = In_PositionRawOS16_g158264;
				Data16_g158264.PositionAddOS = In_PositionAddOS16_g158264;
				Data16_g158264.PivotOS = In_PivotOS16_g158264;
				Data16_g158264.PivotWS = In_PivotWS16_g158264;
				Data16_g158264.PivotWO = In_PivotWO16_g158264;
				Data16_g158264.NormalOS = In_NormalOS16_g158264;
				Data16_g158264.NormalWS = In_NormalWS16_g158264;
				Data16_g158264.NormalRawOS = In_NormalRawOS16_g158264;
				Data16_g158264.NormalRawWS = In_NormalRawWS16_g158264;
				Data16_g158264.TangentOS = In_TangentOS16_g158264;
				Data16_g158264.ViewDirWS = In_ViewDirWS16_g158264;
				Data16_g158264.VertexData = In_VertexData16_g158264;
				Data16_g158264.MotionData = In_MotionData16_g158264;
				Data16_g158264.BoundsData = In_BoundsData16_g158264;
				Data16_g158264.RotationData = In_RotationData16_g158264;
				TVEModelData Data15_g158298 = Data16_g158264;
				float Out_Dummy15_g158298 = 0;
				float3 Out_PositionOS15_g158298 = float3( 0,0,0 );
				float3 Out_PositionWS15_g158298 = float3( 0,0,0 );
				float3 Out_PositionWO15_g158298 = float3( 0,0,0 );
				float3 Out_PositionRawOS15_g158298 = float3( 0,0,0 );
				float3 Out_PositionAddOS15_g158298 = float3( 0,0,0 );
				float3 Out_PivotOS15_g158298 = float3( 0,0,0 );
				float3 Out_PivotWS15_g158298 = float3( 0,0,0 );
				float3 Out_PivotWO15_g158298 = float3( 0,0,0 );
				float3 Out_NormalOS15_g158298 = float3( 0,0,0 );
				float3 Out_NormalWS15_g158298 = float3( 0,0,0 );
				float3 Out_NormalRawOS15_g158298 = float3( 0,0,0 );
				float3 Out_NormalRawWS15_g158298 = float3( 0,0,0 );
				float4 Out_TangentOS15_g158298 = float4( 0,0,0,0 );
				float3 Out_ViewDirWS15_g158298 = float3( 0,0,0 );
				float4 Out_VertexData15_g158298 = float4( 0,0,0,0 );
				float4 Out_MotionData15_g158298 = float4( 0,0,0,0 );
				float4 Out_BoundsData15_g158298 = float4( 0,0,0,0 );
				float4 Out_RotationData15_g158298 = float4( 0,0,0,0 );
				Out_Dummy15_g158298 = Data15_g158298.Dummy;
				Out_PositionOS15_g158298 = Data15_g158298.PositionOS;
				Out_PositionWS15_g158298 = Data15_g158298.PositionWS;
				Out_PositionWO15_g158298 = Data15_g158298.PositionWO;
				Out_PositionRawOS15_g158298 = Data15_g158298.PositionRawOS;
				Out_PositionAddOS15_g158298 = Data15_g158298.PositionAddOS;
				Out_PivotOS15_g158298 = Data15_g158298.PivotOS;
				Out_PivotWS15_g158298 = Data15_g158298.PivotWS;
				Out_PivotWO15_g158298 = Data15_g158298.PivotWO;
				Out_NormalOS15_g158298 = Data15_g158298.NormalOS;
				Out_NormalWS15_g158298 = Data15_g158298.NormalWS;
				Out_NormalRawOS15_g158298 = Data15_g158298.NormalRawOS;
				Out_NormalRawWS15_g158298 = Data15_g158298.NormalRawWS;
				Out_TangentOS15_g158298 = Data15_g158298.TangentOS;
				Out_ViewDirWS15_g158298 = Data15_g158298.ViewDirWS;
				Out_VertexData15_g158298 = Data15_g158298.VertexData;
				Out_MotionData15_g158298 = Data15_g158298.MotionData;
				Out_BoundsData15_g158298 = Data15_g158298.BoundsData;
				Out_RotationData15_g158298 = Data15_g158298.RotationData;
				half3 Model_PositionOS147_g158297 = Out_PositionOS15_g158298;
				half3 Input_False58_g158303 = Model_PositionOS147_g158297;
				half3 VertexPos40_g158300 = Model_PositionOS147_g158297;
				half3 VertexPos40_g158301 = VertexPos40_g158300;
				float3 appendResult74_g158301 = (float3(VertexPos40_g158301.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g158301 = appendResult74_g158301;
				float3 break84_g158301 = VertexPos40_g158301;
				float3 appendResult81_g158301 = (float3(0.0 , break84_g158301.y , break84_g158301.z));
				half3 VertexPosOtherAxis82_g158301 = appendResult81_g158301;
				float4 temp_output_1567_33_g158297 = Out_RotationData15_g158298;
				half4 Model_VertexBend1569_g158297 = temp_output_1567_33_g158297;
				half2 Angle44_g158300 = (Model_VertexBend1569_g158297).xy;
				half Angle44_g158301 = (Angle44_g158300).y;
				half3 VertexPos40_g158302 = ( VertexPosRotationAxis50_g158301 + ( VertexPosOtherAxis82_g158301 * cos( Angle44_g158301 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g158301 ) * sin( Angle44_g158301 ) ) );
				float3 appendResult74_g158302 = (float3(0.0 , 0.0 , VertexPos40_g158302.z));
				half3 VertexPosRotationAxis50_g158302 = appendResult74_g158302;
				float3 break84_g158302 = VertexPos40_g158302;
				float3 appendResult81_g158302 = (float3(break84_g158302.x , break84_g158302.y , 0.0));
				half3 VertexPosOtherAxis82_g158302 = appendResult81_g158302;
				half Angle44_g158302 = -(Angle44_g158300).x;
				half3 Input_True57_g158303 = ( VertexPosRotationAxis50_g158302 + ( VertexPosOtherAxis82_g158302 * cos( Angle44_g158302 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g158302 ) * sin( Angle44_g158302 ) ) );
				#ifdef TVE_MOTION_BASE_BENDING
				float3 staticSwitch65_g158303 = Input_True57_g158303;
				#else
				float3 staticSwitch65_g158303 = Input_False58_g158303;
				#endif
				#ifdef TVE_MOTION_PUSH_BENDING
				float3 staticSwitch67_g158303 = Input_True57_g158303;
				#else
				float3 staticSwitch67_g158303 = staticSwitch65_g158303;
				#endif
				#ifdef TVE_BLANKET_BENDING
				float3 staticSwitch69_g158303 = Input_True57_g158303;
				#else
				float3 staticSwitch69_g158303 = staticSwitch67_g158303;
				#endif
				float3 temp_output_1578_0_g158297 = staticSwitch69_g158303;
				float3 temp_output_1567_31_g158297 = Out_PositionAddOS15_g158298;
				half3 Model_PositionADD1568_g158297 = temp_output_1567_31_g158297;
				half3 Final_PositionOS178_g158297 = ( temp_output_1578_0_g158297 + Model_PositionADD1568_g158297 );
				float3 In_PositionOS16_g158299 = Final_PositionOS178_g158297;
				float3 In_PositionWS16_g158299 = Out_PositionWS15_g158298;
				float3 In_PositionWO16_g158299 = Out_PositionWO15_g158298;
				float3 In_PositionRawOS16_g158299 = Out_PositionRawOS15_g158298;
				float3 In_PositionAddOS16_g158299 = temp_output_1567_31_g158297;
				float3 In_PivotOS16_g158299 = Out_PivotOS15_g158298;
				float3 In_PivotWS16_g158299 = Out_PivotWS15_g158298;
				float3 In_PivotWO16_g158299 = Out_PivotWO15_g158298;
				float3 In_NormalOS16_g158299 = Out_NormalOS15_g158298;
				float3 In_NormalWS16_g158299 = Out_NormalWS15_g158298;
				float3 In_NormalRawOS16_g158299 = Out_NormalRawOS15_g158298;
				float3 In_NormalRawWS16_g158299 = Out_NormalRawWS15_g158298;
				float4 In_TangentOS16_g158299 = Out_TangentOS15_g158298;
				float3 In_ViewDirWS16_g158299 = Out_ViewDirWS15_g158298;
				float4 In_VertexData16_g158299 = Out_VertexData15_g158298;
				float4 In_MotionData16_g158299 = Out_MotionData15_g158298;
				float4 In_BoundsData16_g158299 = Out_BoundsData15_g158298;
				float4 In_RotationData16_g158299 = temp_output_1567_33_g158297;
				Data16_g158299.Dummy = In_Dummy16_g158299;
				Data16_g158299.PositionOS = In_PositionOS16_g158299;
				Data16_g158299.PositionWS = In_PositionWS16_g158299;
				Data16_g158299.PositionWO = In_PositionWO16_g158299;
				Data16_g158299.PositionRawOS = In_PositionRawOS16_g158299;
				Data16_g158299.PositionAddOS = In_PositionAddOS16_g158299;
				Data16_g158299.PivotOS = In_PivotOS16_g158299;
				Data16_g158299.PivotWS = In_PivotWS16_g158299;
				Data16_g158299.PivotWO = In_PivotWO16_g158299;
				Data16_g158299.NormalOS = In_NormalOS16_g158299;
				Data16_g158299.NormalWS = In_NormalWS16_g158299;
				Data16_g158299.NormalRawOS = In_NormalRawOS16_g158299;
				Data16_g158299.NormalRawWS = In_NormalRawWS16_g158299;
				Data16_g158299.TangentOS = In_TangentOS16_g158299;
				Data16_g158299.ViewDirWS = In_ViewDirWS16_g158299;
				Data16_g158299.VertexData = In_VertexData16_g158299;
				Data16_g158299.MotionData = In_MotionData16_g158299;
				Data16_g158299.BoundsData = In_BoundsData16_g158299;
				Data16_g158299.RotationData = In_RotationData16_g158299;
				TVEModelData Data15_g158319 = Data16_g158299;
				float Out_Dummy15_g158319 = 0;
				float3 Out_PositionOS15_g158319 = float3( 0,0,0 );
				float3 Out_PositionWS15_g158319 = float3( 0,0,0 );
				float3 Out_PositionWO15_g158319 = float3( 0,0,0 );
				float3 Out_PositionRawOS15_g158319 = float3( 0,0,0 );
				float3 Out_PositionAddOS15_g158319 = float3( 0,0,0 );
				float3 Out_PivotOS15_g158319 = float3( 0,0,0 );
				float3 Out_PivotWS15_g158319 = float3( 0,0,0 );
				float3 Out_PivotWO15_g158319 = float3( 0,0,0 );
				float3 Out_NormalOS15_g158319 = float3( 0,0,0 );
				float3 Out_NormalWS15_g158319 = float3( 0,0,0 );
				float3 Out_NormalRawOS15_g158319 = float3( 0,0,0 );
				float3 Out_NormalRawWS15_g158319 = float3( 0,0,0 );
				float4 Out_TangentOS15_g158319 = float4( 0,0,0,0 );
				float3 Out_ViewDirWS15_g158319 = float3( 0,0,0 );
				float4 Out_VertexData15_g158319 = float4( 0,0,0,0 );
				float4 Out_MotionData15_g158319 = float4( 0,0,0,0 );
				float4 Out_BoundsData15_g158319 = float4( 0,0,0,0 );
				float4 Out_RotationData15_g158319 = float4( 0,0,0,0 );
				Out_Dummy15_g158319 = Data15_g158319.Dummy;
				Out_PositionOS15_g158319 = Data15_g158319.PositionOS;
				Out_PositionWS15_g158319 = Data15_g158319.PositionWS;
				Out_PositionWO15_g158319 = Data15_g158319.PositionWO;
				Out_PositionRawOS15_g158319 = Data15_g158319.PositionRawOS;
				Out_PositionAddOS15_g158319 = Data15_g158319.PositionAddOS;
				Out_PivotOS15_g158319 = Data15_g158319.PivotOS;
				Out_PivotWS15_g158319 = Data15_g158319.PivotWS;
				Out_PivotWO15_g158319 = Data15_g158319.PivotWO;
				Out_NormalOS15_g158319 = Data15_g158319.NormalOS;
				Out_NormalWS15_g158319 = Data15_g158319.NormalWS;
				Out_NormalRawOS15_g158319 = Data15_g158319.NormalRawOS;
				Out_NormalRawWS15_g158319 = Data15_g158319.NormalRawWS;
				Out_TangentOS15_g158319 = Data15_g158319.TangentOS;
				Out_ViewDirWS15_g158319 = Data15_g158319.ViewDirWS;
				Out_VertexData15_g158319 = Data15_g158319.VertexData;
				Out_MotionData15_g158319 = Data15_g158319.MotionData;
				Out_BoundsData15_g158319 = Data15_g158319.BoundsData;
				Out_RotationData15_g158319 = Data15_g158319.RotationData;
				float3 temp_output_31_0_g158312 = Out_PositionOS15_g158319;
				float3 temp_output_6_0_g158326 = ( ( temp_output_31_0_g158312 - Out_PositionRawOS15_g158319 ) + _DisableSRPBatcher );
				half4 Dummy_Data505 = ( ( ( _VariationLiteInfo + _VariationColoring ) + ( _VariationCategory + _VariationEnd ) + ( _VariationIntensityValue + _VariationColorTwo + _VariationColorOne ) + ( _VariationMultiValue + _VariationNoiseRemap + _VariationNoisePivotsValue1 + _VariationNoiseTillingValue ) ) + ( ( _TintingLiteInfo + _TintingColoring ) + ( _TintingCategory + _TintingEnd + _TintingSpace + 0.0 + _TintingElementMode ) + ( _TintingIntensityValue + _TintingColor + _TintingGrayValue ) + ( _TintingMultiValue + _TintingLumaValue + _TintingLumaRemap ) + 0.0 + 0.0 ) + ( ( _DrynessLiteInfo + _DrynessColoring ) + ( _DrynessCategory + _DrynessEnd + _DrynessSpace + _DrynessElementMode + 0.0 ) + ( _DrynessIntensityValue + _DrynessColor + _DrynessGrayValue + _DrynessShiftValue + _DrynessSmoothnessValue + _DrynessSubsurfaceValue ) + ( _DrynessMultiValue + _DrynessLumaValue + _DrynessLumaRemap ) + 0.0 + 0.0 ) + ( ( _WetnessLiteInfo + _WetnessColoring ) + ( _WetnessCategory + _WetnessEnd + _WetnessElementMode + 0.0 ) + ( _WetnessIntensityValue + _WetnessContrastValue + _WetnessSmoothnessValue ) + float4( 0,0,0,0 ) + float4( 0,0,0,0 ) ) + ( ( _CutoutLiteInfo + _CutoutColoring ) + ( _CutoutCategory + _CutoutEnd + _CutoutSpace + _CutoutElementMode + 0.0 ) + ( _CutoutIntensityValue + _CutoutShadowMode ) + ( _CutoutMultiValue + _CutoutAlphaValue + _CutoutNoiseValue + _CutoutNoiseTillingValue ) + 0.0 ) + ( ( _DitherLiteInfo + _DitherColoring ) + ( _DitherCategory + _DitherEnd ) + ( _DitherConstantValue + 0.0 + 0.0 + ( _DitherDistanceValue + _DitherDistanceMaxValue + _DitherDistanceMinValue ) + _DitherShadowMode ) + ( _DitherMultiValue + _DitherNoiseTillingValue ) ) + ( ( _SizeFadeLiteInfo + _SizeFadeColoring ) + ( _SizeFadeCategory + _SizeFadeEnd + _SizeFadeElementMode ) + ( _SizeFadeIntensityValue + _SizeFadeScaleMode + _SizeFadeScaleValue + _SizeFadeDistMinValue + _SizeFadeDistMaxValue ) ) );
				#ifdef TVE_REGISTER
				float4 staticSwitch14_g158326 = ( float4( temp_output_6_0_g158326 , 0.0 ) + ( Dummy_Data505 * float4( 0,0,0,0 ) ) );
				#else
				float4 staticSwitch14_g158326 = float4( temp_output_6_0_g158326 , 0.0 );
				#endif
				
				inputMesh.positionOS.xyz += staticSwitch14_g158326.rgb;

				float3 positionRWS = TransformObjectToWorld(inputMesh.positionOS.xyz );
				float3 normalWS = TransformObjectToWorldNormal(inputMesh.normalOS);
				float4 tangentWS = float4(TransformObjectToWorldDir(inputMesh.tangentOS.xyz), inputMesh.tangentOS.w);

				outputPackedVaryingsMeshToPS.positionCS = TransformWorldToHClip(positionRWS);
				outputPackedVaryingsMeshToPS.interp00.xyz = positionRWS;
				outputPackedVaryingsMeshToPS.interp01.xyz = normalWS;
				outputPackedVaryingsMeshToPS.interp02.xyzw = tangentWS;
				outputPackedVaryingsMeshToPS.interp03.xyzw = inputMesh.texcoord;
				outputPackedVaryingsMeshToPS.interp04.xyzw = inputMesh.uv1;
				outputPackedVaryingsMeshToPS.interp05.xyzw = inputMesh.uv2;
				return outputPackedVaryingsMeshToPS;
			}

			void Frag(PackedVaryingsMeshToPS packedInput,
				#ifdef OUTPUT_SPLIT_LIGHTING
					out float4 outColor : SV_Target0,
					out float4 outDiffuseLighting : SV_Target1,
					OUTPUT_SSSBUFFER(outSSSBuffer)
				#else
					out float4 outColor : SV_Target0
				#endif
					, out float outputDepth : SV_Depth
				
			)
			{
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(packedInput);
				UNITY_SETUP_INSTANCE_ID( packedInput );

				#ifdef LOD_FADE_CROSSFADE
				float3 VC = GetWorldSpaceNormalizeViewDir(packedInput.interp00.xyz);
				LODDitheringTransition(ComputeFadeMaskSeed(VC, packedInput.positionCS.xy), unity_LODFade.x);
				#endif

				FragInputs input;

				ZERO_INITIALIZE(FragInputs, input);
				GlobalSurfaceDescription surfaceDescription = (GlobalSurfaceDescription)0;
				SurfaceOutput o = (SurfaceOutput)0;

				o.Normal = packedInput.interp01.xyz; //float3( 0, 0, 1 );
				float4 positionCS = packedInput.positionCS;  //0;
				float3 positionWS = packedInput.interp00.xyz; //0;

				float localBreakData4_g158315 = ( 0.0 );
				float localCompData3_g158307 = ( 0.0 );
				TVEVisualData Data3_g158307 = (TVEVisualData)0;
				half Dummy145_g158305 = ( _SubsurfaceCategory + _SubsurfaceEnd + ( _SubsurfaceDirectValue + _SubsurfaceNormalValue + _SubsurfaceAmbientValue + _SubsurfaceShadowValue ) + _SubsurfaceElementMode );
				float In_Dummy3_g158307 = Dummy145_g158305;
				float localBreakData4_g158306 = ( 0.0 );
				float localCompData3_g158259 = ( 0.0 );
				TVEVisualData Data3_g158259 = (TVEVisualData)0;
				half Dummy145_g158247 = ( _EmissiveCategory + _EmissiveEnd + ( _EmissivePowerMode + _EmissivePowerValue ) + _EmissiveElementMode + 0.0 );
				float In_Dummy3_g158259 = Dummy145_g158247;
				float localBreakData4_g158258 = ( 0.0 );
				float localCompData3_g158220 = ( 0.0 );
				TVEVisualData Data3_g158220 = (TVEVisualData)0;
				float2 uv_OverlayGlitterTex = packedInput.interp03.xy * _OverlayGlitterTex_ST.xy + _OverlayGlitterTex_ST.zw;
				half4 Dummy594_g158217 = ( ( _OverlayCategory + _OverlayEnd + _OverlaySpace + _OverlayElementMode + _OverlayBakeInfo ) + ( _OverlayLiteInfo + _OverlayColoringOn + _OverlayColoringOff ) + ( SAMPLE_TEXTURE2D( _OverlayGlitterTex, sampler_OverlayGlitterTex, uv_OverlayGlitterTex ) + _OverlayGlitterTillingValue + _OverlayGlitterIntensityValue + _OverlayGlitterColor + _OverlayGlitterDistValue ) );
				float In_Dummy3_g158220 = Dummy594_g158217.r;
				float localBreakData4_g158218 = ( 0.0 );
				float localCompData3_g157221 = ( 0.0 );
				TVEVisualData Data3_g157221 = (TVEVisualData)0;
				float4 output0 = 0;
				float4 output1 = 0;
				OctaImpostorFragment( o, positionCS, positionWS, packedInput.UVsFrame122_g156549, packedInput.UVsFrame222_g156549, packedInput.UVsFrame322_g156549, packedInput.octaframe22_g156549, packedInput.viewPos22_g156549, output0, output1 );
				float In_Dummy3_g157221 = output1.r;
				float4 break227_g157220 = output0;
				half Local_MultiMask249_g157220 = break227_g157220.b;
				float lerpResult289_g157220 = lerp( 1.0 , Local_MultiMask249_g157220 , _ImpostorColorMode);
				float3 lerpResult292_g157220 = lerp( (_ImpostorColorTwo).rgb , (_ImpostorColor).rgb , lerpResult289_g157220);
				half3 Local_Albedo239_g157220 = ( o.Albedo * lerpResult292_g157220 );
				float3 In_Albedo3_g157221 = Local_Albedo239_g157220;
				float2 temp_cast_4 = (0.5).xx;
				float2 In_NormalTS3_g157221 = temp_cast_4;
				float3 In_NormalWS3_g157221 = o.Normal;
				half Local_Metallic247_g157220 = break227_g157220.r;
				half Final_Metallic238_g157220 = ( Local_Metallic247_g157220 * _ImpostorMetallicValue );
				half Local_Smoothness250_g157220 = break227_g157220.a;
				half Final_Smoothness233_g157220 = ( Local_Smoothness250_g157220 * _ImpostorSmoothnessValue );
				float4 appendResult257_g157220 = (float4(Final_Metallic238_g157220 , 1.0 , 1.0 , Final_Smoothness233_g157220));
				float4 In_Shader3_g157221 = appendResult257_g157220;
				half Local_EmissiveMask248_g157220 = break227_g157220.g;
				float4 appendResult286_g157220 = (float4(Local_EmissiveMask248_g157220 , Local_EmissiveMask248_g157220 , Local_EmissiveMask248_g157220 , 1.0));
				float4 In_Emissive3_g157221 = appendResult286_g157220;
				float3 temp_output_3_0_g157222 = Local_Albedo239_g157220;
				float dotResult20_g157222 = dot( temp_output_3_0_g157222 , float3(0.2126,0.7152,0.0722) );
				half Local_Grayscale268_g157220 = dotResult20_g157222;
				float In_Grayscale3_g157221 = Local_Grayscale268_g157220;
				float clampResult267_g157220 = clamp( saturate( ( Local_Grayscale268_g157220 * 5.0 ) ) , 0.2 , 1.0 );
				half Local_Luminosity269_g157220 = clampResult267_g157220;
				float In_Luminosity3_g157221 = Local_Luminosity269_g157220;
				float In_MultiMask3_g157221 = Local_MultiMask249_g157220;
				float In_AlphaClip3_g157221 = 0.0;
				float In_AlphaFade3_g157221 = 1.0;
				float3 temp_cast_5 = (1.0).xxx;
				float3 In_Translucency3_g157221 = temp_cast_5;
				float In_Transmission3_g157221 = 1.0;
				float In_Thickness3_g157221 = 0.0;
				float In_Diffusion3_g157221 = 0.0;
				Data3_g157221.Dummy = In_Dummy3_g157221;
				Data3_g157221.Albedo = In_Albedo3_g157221;
				Data3_g157221.NormalTS = In_NormalTS3_g157221;
				Data3_g157221.NormalWS = In_NormalWS3_g157221;
				Data3_g157221.Shader = In_Shader3_g157221;
				Data3_g157221.Emissive= In_Emissive3_g157221;
				Data3_g157221.MultiMask = In_MultiMask3_g157221;
				Data3_g157221.Grayscale = In_Grayscale3_g157221;
				Data3_g157221.Luminosity = In_Luminosity3_g157221;
				Data3_g157221.AlphaClip = In_AlphaClip3_g157221;
				Data3_g157221.AlphaFade = In_AlphaFade3_g157221;
				Data3_g157221.Translucency = In_Translucency3_g157221;
				Data3_g157221.Transmission = In_Transmission3_g157221;
				Data3_g157221.Thickness = In_Thickness3_g157221;
				Data3_g157221.Diffusion = In_Diffusion3_g157221;
				TVEVisualData Data4_g158218 = Data3_g157221;
				float Out_Dummy4_g158218 = 0;
				float3 Out_Albedo4_g158218 = float3( 0,0,0 );
				float2 Out_NormalTS4_g158218 = float2( 0,0 );
				float3 Out_NormalWS4_g158218 = float3( 0,0,0 );
				float4 Out_Shader4_g158218 = float4( 0,0,0,0 );
				float4 Out_Emissive4_g158218 = float4( 0,0,0,0 );
				float Out_MultiMask4_g158218 = 0;
				float Out_Grayscale4_g158218 = 0;
				float Out_Luminosity4_g158218 = 0;
				float Out_AlphaClip4_g158218 = 0;
				float Out_AlphaFade4_g158218 = 0;
				float3 Out_Translucency4_g158218 = float3( 0,0,0 );
				float Out_Transmission4_g158218 = 0;
				float Out_Thickness4_g158218 = 0;
				float Out_Diffusion4_g158218 = 0;
				Out_Dummy4_g158218 = Data4_g158218.Dummy;
				Out_Albedo4_g158218 = Data4_g158218.Albedo;
				Out_NormalTS4_g158218 = Data4_g158218.NormalTS;
				Out_NormalWS4_g158218 = Data4_g158218.NormalWS;
				Out_Shader4_g158218 = Data4_g158218.Shader;
				Out_Emissive4_g158218= Data4_g158218.Emissive;
				Out_MultiMask4_g158218 = Data4_g158218.MultiMask;
				Out_Grayscale4_g158218 = Data4_g158218.Grayscale;
				Out_Luminosity4_g158218= Data4_g158218.Luminosity;
				Out_AlphaClip4_g158218 = Data4_g158218.AlphaClip;
				Out_AlphaFade4_g158218 = Data4_g158218.AlphaFade;
				Out_Translucency4_g158218 = Data4_g158218.Translucency;
				Out_Transmission4_g158218 = Data4_g158218.Transmission;
				Out_Thickness4_g158218 = Data4_g158218.Thickness;
				Out_Diffusion4_g158218 = Data4_g158218.Diffusion;
				half3 Visual_Albedo127_g158217 = Out_Albedo4_g158218;
				float3 temp_output_622_0_g158217 = (_OverlayColor).rgb;
				half Overlay_TexMask906_g158217 = 1.0;
				float3 temp_output_739_21_g158217 = Out_NormalWS4_g158218;
				half3 Visual_NormalWS749_g158217 = temp_output_739_21_g158217;
				float clampResult17_g158237 = clamp( saturate( (Visual_NormalWS749_g158217).y ) , 0.0001 , 0.9999 );
				float temp_output_7_0_g158236 = _OverlayProjRemap.x;
				float temp_output_10_0_g158236 = ( _OverlayProjRemap.y - temp_output_7_0_g158236 );
				float lerpResult842_g158217 = lerp( 1.0 , saturate( ( ( clampResult17_g158237 - temp_output_7_0_g158236 ) / ( temp_output_10_0_g158236 + 0.0001 ) ) ) , _OverlayProjValue);
				half Overlay_MaskProj457_g158217 = lerpResult842_g158217;
				float temp_output_739_15_g158217 = Out_Luminosity4_g158218;
				half Visual_Luminosity654_g158217 = temp_output_739_15_g158217;
				float clampResult17_g158239 = clamp( Visual_Luminosity654_g158217 , 0.0001 , 0.9999 );
				float temp_output_7_0_g158238 = _OverlayLumaRemap.x;
				float temp_output_10_0_g158238 = ( _OverlayLumaRemap.y - temp_output_7_0_g158238 );
				float lerpResult587_g158217 = lerp( 1.0 , saturate( ( ( clampResult17_g158239 - temp_output_7_0_g158238 ) / ( temp_output_10_0_g158238 + 0.0001 ) ) ) , _OverlayLumaValue);
				half Overlay_MaskLuma438_g158217 = lerpResult587_g158217;
				half Overlay_VertMask801_g158217 = 1.0;
				half Overlay_MaskNoise427_g158217 = 1.0;
				float localBuildGlobalData204_g157155 = ( 0.0 );
				TVEGlobalData Data204_g157155 = (TVEGlobalData)0;
				half Dummy211_g157155 = ( _GlobalLiteInfo + ( _GlobalCategory + _GlobalEnd ) );
				float In_Dummy204_g157155 = Dummy211_g157155;
				float4 temp_output_362_164_g157155 = TVE_CoatParams;
				half4 Coat_Params302_g157155 = temp_output_362_164_g157155;
				float4 In_CoatParams204_g157155 = Coat_Params302_g157155;
				float4 temp_output_361_164_g157155 = TVE_PaintParams;
				half4 Paint_Params71_g157155 = temp_output_361_164_g157155;
				float4 In_PaintParams204_g157155 = Paint_Params71_g157155;
				float4 temp_output_365_163_g157155 = TVE_GlowParams;
				half4 Glow_Params248_g157155 = temp_output_365_163_g157155;
				float4 In_GlowParams204_g157155 = Glow_Params248_g157155;
				float4 temp_output_363_141_g157155 = TVE_AtmoParams;
				half4 Atmo_Params80_g157155 = temp_output_363_141_g157155;
				float4 In_AtmoParams204_g157155 = Atmo_Params80_g157155;
				float4 temp_output_364_139_g157155 = TVE_FormParams;
				half4 Form_Params112_g157155 = temp_output_364_139_g157155;
				float4 In_FormParams204_g157155 = Form_Params112_g157155;
				float4 temp_output_366_145_g157155 = TVE_WindParams;
				half4 Wind_Params88_g157155 = temp_output_366_145_g157155;
				float4 In_WindParams204_g157155 = Wind_Params88_g157155;
				float4 temp_output_367_145_g157155 = TVE_PushParams;
				half4 Push_Params335_g157155 = temp_output_367_145_g157155;
				float4 In_PushParams204_g157155 = Push_Params335_g157155;
				Data204_g157155.Dummy = In_Dummy204_g157155;
				Data204_g157155.CoatParams = In_CoatParams204_g157155;
				Data204_g157155.PaintParams = In_PaintParams204_g157155;
				Data204_g157155.GlowParams = In_GlowParams204_g157155;
				Data204_g157155.AtmoParams = In_AtmoParams204_g157155;
				Data204_g157155.FormParams= In_FormParams204_g157155;
				Data204_g157155.WindParams = In_WindParams204_g157155;
				Data204_g157155.PushParams = In_PushParams204_g157155;
				TVEGlobalData Data15_g158219 = Data204_g157155;
				float Out_Dummy15_g158219 = 0;
				float4 Out_CoatParams15_g158219 = float4( 0,0,0,0 );
				float4 Out_PaintParams15_g158219 = float4( 0,0,0,0 );
				float4 Out_GlowParams15_g158219 = float4( 0,0,0,0 );
				float4 Out_AtmoParams15_g158219 = float4( 0,0,0,0 );
				float4 Out_FadeParams15_g158219 = float4( 0,0,0,0 );
				float4 Out_FormParams15_g158219 = float4( 0,0,0,0 );
				float4 Out_LandParams15_g158219 = float4( 0,0,0,0 );
				float4 Out_WindParams15_g158219 = float4( 0,0,0,0 );
				float4 Out_PushParams15_g158219 = float4( 0,0,0,0 );
				Out_Dummy15_g158219 = Data15_g158219.Dummy;
				Out_CoatParams15_g158219 = Data15_g158219.CoatParams;
				Out_PaintParams15_g158219 = Data15_g158219.PaintParams;
				Out_GlowParams15_g158219 = Data15_g158219.GlowParams;
				Out_AtmoParams15_g158219= Data15_g158219.AtmoParams;
				Out_FadeParams15_g158219= Data15_g158219.FadeParams;
				Out_FormParams15_g158219 = Data15_g158219.FormParams;
				Out_LandParams15_g158219 = Data15_g158219.LandParams;
				Out_WindParams15_g158219 = Data15_g158219.WindParams;
				Out_PushParams15_g158219 = Data15_g158219.PushParams;
				half4 Global_AtmoParams516_g158217 = Out_AtmoParams15_g158219;
				#ifdef TVE_OVERLAY_ELEMENT
				float staticSwitch705_g158217 = (Global_AtmoParams516_g158217).z;
				#else
				float staticSwitch705_g158217 = 1.0;
				#endif
				half Overlay_MaskGlobal429_g158217 = staticSwitch705_g158217;
				half Custom_Mask646_g158217 = 1.0;
				float temp_output_7_0_g158244 = _OverlayBlendRemap1.x;
				float temp_output_10_0_g158244 = ( _OverlayBlendRemap1.y - temp_output_7_0_g158244 );
				half Overlay_Mask494_g158217 = saturate( ( ( ( _OverlayIntensityValue * Overlay_TexMask906_g158217 * Overlay_MaskProj457_g158217 * Overlay_MaskLuma438_g158217 * Overlay_VertMask801_g158217 * Overlay_MaskNoise427_g158217 * Overlay_MaskGlobal429_g158217 * Custom_Mask646_g158217 ) - temp_output_7_0_g158244 ) / ( temp_output_10_0_g158244 + 0.0001 ) ) );
				float3 lerpResult467_g158217 = lerp( Visual_Albedo127_g158217 , temp_output_622_0_g158217 , Overlay_Mask494_g158217);
				#ifdef TVE_OVERLAY
				float3 staticSwitch577_g158217 = lerpResult467_g158217;
				#else
				float3 staticSwitch577_g158217 = Visual_Albedo127_g158217;
				#endif
				half3 Final_Albedo493_g158217 = staticSwitch577_g158217;
				float3 In_Albedo3_g158220 = Final_Albedo493_g158217;
				half2 Visual_NormalTS535_g158217 = Out_NormalTS4_g158218;
				float2 lerpResult551_g158217 = lerp( Visual_NormalTS535_g158217 , ( Visual_NormalTS535_g158217 * _OverlayNormalValue ) , Overlay_Mask494_g158217);
				#ifdef TVE_OVERLAY
				float2 staticSwitch583_g158217 = lerpResult551_g158217;
				#else
				float2 staticSwitch583_g158217 = Visual_NormalTS535_g158217;
				#endif
				half2 Final_NormalTS499_g158217 = staticSwitch583_g158217;
				float2 In_NormalTS3_g158220 = Final_NormalTS499_g158217;
				float3 In_NormalWS3_g158220 = temp_output_739_21_g158217;
				half4 Visual_Masks536_g158217 = Out_Shader4_g158218;
				float4 appendResult585_g158217 = (float4(0.0 , 1.0 , 0.0 , _OverlaySmoothnessValue));
				float4 lerpResult584_g158217 = lerp( Visual_Masks536_g158217 , appendResult585_g158217 , Overlay_Mask494_g158217);
				#ifdef TVE_OVERLAY
				float4 staticSwitch586_g158217 = lerpResult584_g158217;
				#else
				float4 staticSwitch586_g158217 = Visual_Masks536_g158217;
				#endif
				half4 Final_Masks482_g158217 = staticSwitch586_g158217;
				float4 In_Shader3_g158220 = Final_Masks482_g158217;
				float4 In_Emissive3_g158220 = Out_Emissive4_g158218;
				float temp_output_739_12_g158217 = Out_Grayscale4_g158218;
				float In_Grayscale3_g158220 = temp_output_739_12_g158217;
				float In_Luminosity3_g158220 = temp_output_739_15_g158217;
				float In_MultiMask3_g158220 = Out_MultiMask4_g158218;
				float In_AlphaClip3_g158220 = Out_AlphaClip4_g158218;
				float In_AlphaFade3_g158220 = Out_AlphaFade4_g158218;
				float3 In_Translucency3_g158220 = Out_Translucency4_g158218;
				half Visual_Transmission699_g158217 = Out_Transmission4_g158218;
				float lerpResult746_g158217 = lerp( Visual_Transmission699_g158217 , ( Visual_Transmission699_g158217 * _OverlaySubsurfaceValue ) , ( Overlay_VertMask801_g158217 * Overlay_MaskNoise427_g158217 * Overlay_MaskGlobal429_g158217 ));
				#ifdef TVE_OVERLAY
				float staticSwitch703_g158217 = lerpResult746_g158217;
				#else
				float staticSwitch703_g158217 = Visual_Transmission699_g158217;
				#endif
				half Final_Transmission702_g158217 = staticSwitch703_g158217;
				float In_Transmission3_g158220 = Final_Transmission702_g158217;
				float In_Thickness3_g158220 = Out_Thickness4_g158218;
				float In_Diffusion3_g158220 = Out_Diffusion4_g158218;
				Data3_g158220.Dummy = In_Dummy3_g158220;
				Data3_g158220.Albedo = In_Albedo3_g158220;
				Data3_g158220.NormalTS = In_NormalTS3_g158220;
				Data3_g158220.NormalWS = In_NormalWS3_g158220;
				Data3_g158220.Shader = In_Shader3_g158220;
				Data3_g158220.Emissive= In_Emissive3_g158220;
				Data3_g158220.MultiMask = In_MultiMask3_g158220;
				Data3_g158220.Grayscale = In_Grayscale3_g158220;
				Data3_g158220.Luminosity = In_Luminosity3_g158220;
				Data3_g158220.AlphaClip = In_AlphaClip3_g158220;
				Data3_g158220.AlphaFade = In_AlphaFade3_g158220;
				Data3_g158220.Translucency = In_Translucency3_g158220;
				Data3_g158220.Transmission = In_Transmission3_g158220;
				Data3_g158220.Thickness = In_Thickness3_g158220;
				Data3_g158220.Diffusion = In_Diffusion3_g158220;
				TVEVisualData Data4_g158258 = Data3_g158220;
				float Out_Dummy4_g158258 = 0;
				float3 Out_Albedo4_g158258 = float3( 0,0,0 );
				float2 Out_NormalTS4_g158258 = float2( 0,0 );
				float3 Out_NormalWS4_g158258 = float3( 0,0,0 );
				float4 Out_Shader4_g158258 = float4( 0,0,0,0 );
				float4 Out_Emissive4_g158258 = float4( 0,0,0,0 );
				float Out_MultiMask4_g158258 = 0;
				float Out_Grayscale4_g158258 = 0;
				float Out_Luminosity4_g158258 = 0;
				float Out_AlphaClip4_g158258 = 0;
				float Out_AlphaFade4_g158258 = 0;
				float3 Out_Translucency4_g158258 = float3( 0,0,0 );
				float Out_Transmission4_g158258 = 0;
				float Out_Thickness4_g158258 = 0;
				float Out_Diffusion4_g158258 = 0;
				Out_Dummy4_g158258 = Data4_g158258.Dummy;
				Out_Albedo4_g158258 = Data4_g158258.Albedo;
				Out_NormalTS4_g158258 = Data4_g158258.NormalTS;
				Out_NormalWS4_g158258 = Data4_g158258.NormalWS;
				Out_Shader4_g158258 = Data4_g158258.Shader;
				Out_Emissive4_g158258= Data4_g158258.Emissive;
				Out_MultiMask4_g158258 = Data4_g158258.MultiMask;
				Out_Grayscale4_g158258 = Data4_g158258.Grayscale;
				Out_Luminosity4_g158258= Data4_g158258.Luminosity;
				Out_AlphaClip4_g158258 = Data4_g158258.AlphaClip;
				Out_AlphaFade4_g158258 = Data4_g158258.AlphaFade;
				Out_Translucency4_g158258 = Data4_g158258.Translucency;
				Out_Transmission4_g158258 = Data4_g158258.Transmission;
				Out_Thickness4_g158258 = Data4_g158258.Thickness;
				Out_Diffusion4_g158258 = Data4_g158258.Diffusion;
				float3 temp_output_297_0_g158247 = Out_Albedo4_g158258;
				float3 In_Albedo3_g158259 = temp_output_297_0_g158247;
				float2 In_NormalTS3_g158259 = Out_NormalTS4_g158258;
				float3 In_NormalWS3_g158259 = Out_NormalWS4_g158258;
				float4 In_Shader3_g158259 = Out_Shader4_g158258;
				float4 temp_cast_6 = (0.0).xxxx;
				half4 Visual_Emissive255_g158247 = Out_Emissive4_g158258;
				half Emissive_MeshMask221_g158247 = 1.0;
				half Emissive_Mask103_g158247 = 1.0;
				float temp_output_279_0_g158247 = ( Emissive_MeshMask221_g158247 * Emissive_Mask103_g158247 );
				float3 appendResult293_g158247 = (float3(temp_output_279_0_g158247 , temp_output_279_0_g158247 , temp_output_279_0_g158247));
				half3 Local_EmissiveColor278_g158247 = appendResult293_g158247;
				float3 temp_cast_7 = (1.0).xxx;
				TVEGlobalData Data15_g158249 = Data204_g157155;
				float Out_Dummy15_g158249 = 0;
				float4 Out_CoatParams15_g158249 = float4( 0,0,0,0 );
				float4 Out_PaintParams15_g158249 = float4( 0,0,0,0 );
				float4 Out_GlowParams15_g158249 = float4( 0,0,0,0 );
				float4 Out_AtmoParams15_g158249 = float4( 0,0,0,0 );
				float4 Out_FadeParams15_g158249 = float4( 0,0,0,0 );
				float4 Out_FormParams15_g158249 = float4( 0,0,0,0 );
				float4 Out_LandParams15_g158249 = float4( 0,0,0,0 );
				float4 Out_WindParams15_g158249 = float4( 0,0,0,0 );
				float4 Out_PushParams15_g158249 = float4( 0,0,0,0 );
				Out_Dummy15_g158249 = Data15_g158249.Dummy;
				Out_CoatParams15_g158249 = Data15_g158249.CoatParams;
				Out_PaintParams15_g158249 = Data15_g158249.PaintParams;
				Out_GlowParams15_g158249 = Data15_g158249.GlowParams;
				Out_AtmoParams15_g158249= Data15_g158249.AtmoParams;
				Out_FadeParams15_g158249= Data15_g158249.FadeParams;
				Out_FormParams15_g158249 = Data15_g158249.FormParams;
				Out_LandParams15_g158249 = Data15_g158249.LandParams;
				Out_WindParams15_g158249 = Data15_g158249.WindParams;
				Out_PushParams15_g158249 = Data15_g158249.PushParams;
				half4 Global_GlowParams179_g158247 = Out_GlowParams15_g158249;
				float3 lerpResult299_g158247 = lerp( float3( 1,1,1 ) , (Global_GlowParams179_g158247).xyz , TVE_IsEnabled);
				#ifdef TVE_EMISSIVE_ELEMENT
				float3 staticSwitch228_g158247 = lerpResult299_g158247;
				#else
				float3 staticSwitch228_g158247 = temp_cast_7;
				#endif
				half3 Emissive_GlobalMask248_g158247 = staticSwitch228_g158247;
				half3 Local_EmissiveValue88_g158247 = ( _EmissiveIntensityValue * (_EmissiveColor).rgb * Emissive_GlobalMask248_g158247 );
				half3 Emissive_Blend260_g158247 = ( ( (Visual_Emissive255_g158247).xyz * Local_EmissiveColor278_g158247 ) * Local_EmissiveValue88_g158247 );
				float3 temp_output_3_0_g158257 = Emissive_Blend260_g158247;
				float temp_output_15_0_g158257 = _emissive_power_value;
				float3 hdEmission22_g158257 = ASEGetEmissionHDRColor(temp_output_3_0_g158257,temp_output_15_0_g158257,_EmissiveExposureValue,GetInverseCurrentExposureMultiplier());
				float4 appendResult295_g158247 = (float4(hdEmission22_g158257 , Emissive_Mask103_g158247));
				#ifdef TVE_EMISSIVE
				float4 staticSwitch129_g158247 = appendResult295_g158247;
				#else
				float4 staticSwitch129_g158247 = temp_cast_6;
				#endif
				half4 Final_Emissive184_g158247 = staticSwitch129_g158247;
				float4 In_Emissive3_g158259 = Final_Emissive184_g158247;
				float In_Grayscale3_g158259 = Out_Grayscale4_g158258;
				float In_Luminosity3_g158259 = Out_Luminosity4_g158258;
				float temp_output_297_11_g158247 = Out_MultiMask4_g158258;
				float In_MultiMask3_g158259 = temp_output_297_11_g158247;
				float In_AlphaClip3_g158259 = Out_AlphaClip4_g158258;
				float In_AlphaFade3_g158259 = Out_AlphaFade4_g158258;
				float3 In_Translucency3_g158259 = Out_Translucency4_g158258;
				float In_Transmission3_g158259 = Out_Transmission4_g158258;
				float In_Thickness3_g158259 = Out_Thickness4_g158258;
				float In_Diffusion3_g158259 = Out_Diffusion4_g158258;
				Data3_g158259.Dummy = In_Dummy3_g158259;
				Data3_g158259.Albedo = In_Albedo3_g158259;
				Data3_g158259.NormalTS = In_NormalTS3_g158259;
				Data3_g158259.NormalWS = In_NormalWS3_g158259;
				Data3_g158259.Shader = In_Shader3_g158259;
				Data3_g158259.Emissive= In_Emissive3_g158259;
				Data3_g158259.MultiMask = In_MultiMask3_g158259;
				Data3_g158259.Grayscale = In_Grayscale3_g158259;
				Data3_g158259.Luminosity = In_Luminosity3_g158259;
				Data3_g158259.AlphaClip = In_AlphaClip3_g158259;
				Data3_g158259.AlphaFade = In_AlphaFade3_g158259;
				Data3_g158259.Translucency = In_Translucency3_g158259;
				Data3_g158259.Transmission = In_Transmission3_g158259;
				Data3_g158259.Thickness = In_Thickness3_g158259;
				Data3_g158259.Diffusion = In_Diffusion3_g158259;
				TVEVisualData Data4_g158306 = Data3_g158259;
				float Out_Dummy4_g158306 = 0;
				float3 Out_Albedo4_g158306 = float3( 0,0,0 );
				float2 Out_NormalTS4_g158306 = float2( 0,0 );
				float3 Out_NormalWS4_g158306 = float3( 0,0,0 );
				float4 Out_Shader4_g158306 = float4( 0,0,0,0 );
				float4 Out_Emissive4_g158306 = float4( 0,0,0,0 );
				float Out_MultiMask4_g158306 = 0;
				float Out_Grayscale4_g158306 = 0;
				float Out_Luminosity4_g158306 = 0;
				float Out_AlphaClip4_g158306 = 0;
				float Out_AlphaFade4_g158306 = 0;
				float3 Out_Translucency4_g158306 = float3( 0,0,0 );
				float Out_Transmission4_g158306 = 0;
				float Out_Thickness4_g158306 = 0;
				float Out_Diffusion4_g158306 = 0;
				Out_Dummy4_g158306 = Data4_g158306.Dummy;
				Out_Albedo4_g158306 = Data4_g158306.Albedo;
				Out_NormalTS4_g158306 = Data4_g158306.NormalTS;
				Out_NormalWS4_g158306 = Data4_g158306.NormalWS;
				Out_Shader4_g158306 = Data4_g158306.Shader;
				Out_Emissive4_g158306= Data4_g158306.Emissive;
				Out_MultiMask4_g158306 = Data4_g158306.MultiMask;
				Out_Grayscale4_g158306 = Data4_g158306.Grayscale;
				Out_Luminosity4_g158306= Data4_g158306.Luminosity;
				Out_AlphaClip4_g158306 = Data4_g158306.AlphaClip;
				Out_AlphaFade4_g158306 = Data4_g158306.AlphaFade;
				Out_Translucency4_g158306 = Data4_g158306.Translucency;
				Out_Transmission4_g158306 = Data4_g158306.Transmission;
				Out_Thickness4_g158306 = Data4_g158306.Thickness;
				Out_Diffusion4_g158306 = Data4_g158306.Diffusion;
				half3 Visual_Albedo199_g158305 = Out_Albedo4_g158306;
				half3 Final_Albedo312_g158305 = Visual_Albedo199_g158305;
				float3 In_Albedo3_g158307 = Final_Albedo312_g158305;
				float2 In_NormalTS3_g158307 = Out_NormalTS4_g158306;
				float3 In_NormalWS3_g158307 = Out_NormalWS4_g158306;
				float4 In_Shader3_g158307 = Out_Shader4_g158306;
				float4 In_Emissive3_g158307 = Out_Emissive4_g158306;
				float In_Grayscale3_g158307 = Out_Grayscale4_g158306;
				float In_Luminosity3_g158307 = Out_Luminosity4_g158306;
				float temp_output_301_11_g158305 = Out_MultiMask4_g158306;
				float In_MultiMask3_g158307 = temp_output_301_11_g158305;
				float In_AlphaClip3_g158307 = Out_AlphaClip4_g158306;
				float In_AlphaFade3_g158307 = Out_AlphaFade4_g158306;
				float3 temp_cast_8 = (0.0).xxx;
				half3 Subsurface_Color264_g158305 = ( (_SubsurfaceColor).rgb * Visual_Albedo199_g158305 );
				half Visual_Transmission138_g158305 = Out_Transmission4_g158306;
				half Subsurface_Value268_g158305 = _SubsurfaceIntensityValue;
				TVEGlobalData Data15_g158309 = Data204_g157155;
				float Out_Dummy15_g158309 = 0;
				float4 Out_CoatParams15_g158309 = float4( 0,0,0,0 );
				float4 Out_PaintParams15_g158309 = float4( 0,0,0,0 );
				float4 Out_GlowParams15_g158309 = float4( 0,0,0,0 );
				float4 Out_AtmoParams15_g158309 = float4( 0,0,0,0 );
				float4 Out_FadeParams15_g158309 = float4( 0,0,0,0 );
				float4 Out_FormParams15_g158309 = float4( 0,0,0,0 );
				float4 Out_LandParams15_g158309 = float4( 0,0,0,0 );
				float4 Out_WindParams15_g158309 = float4( 0,0,0,0 );
				float4 Out_PushParams15_g158309 = float4( 0,0,0,0 );
				Out_Dummy15_g158309 = Data15_g158309.Dummy;
				Out_CoatParams15_g158309 = Data15_g158309.CoatParams;
				Out_PaintParams15_g158309 = Data15_g158309.PaintParams;
				Out_GlowParams15_g158309 = Data15_g158309.GlowParams;
				Out_AtmoParams15_g158309= Data15_g158309.AtmoParams;
				Out_FadeParams15_g158309= Data15_g158309.FadeParams;
				Out_FormParams15_g158309 = Data15_g158309.FormParams;
				Out_LandParams15_g158309 = Data15_g158309.LandParams;
				Out_WindParams15_g158309 = Data15_g158309.WindParams;
				Out_PushParams15_g158309 = Data15_g158309.PushParams;
				half4 Global_GlowParams373_g158305 = Out_GlowParams15_g158309;
				float lerpResult403_g158305 = lerp( 1.0 , saturate( (Global_GlowParams373_g158305).w ) , TVE_IsEnabled);
				#ifdef TVE_SUBSURFACE_ELEMENT
				float staticSwitch367_g158305 = lerpResult403_g158305;
				#else
				float staticSwitch367_g158305 = 1.0;
				#endif
				half Subsurface_GlobalMask369_g158305 = staticSwitch367_g158305;
				half Visual_MultiMask292_g158305 = temp_output_301_11_g158305;
				float lerpResult293_g158305 = lerp( 1.0 , Visual_MultiMask292_g158305 , _SubsurfaceMultiValue);
				half Subsurface_MultiMask296_g158305 = lerpResult293_g158305;
				half Custom_Mask363_g158305 = 1.0;
				#ifdef TVE_SUBSURFACE
				float staticSwitch345_g158305 = ( Visual_Transmission138_g158305 * Subsurface_Value268_g158305 * Subsurface_GlobalMask369_g158305 * Subsurface_MultiMask296_g158305 * Custom_Mask363_g158305 );
				#else
				float staticSwitch345_g158305 = 0.0;
				#endif
				half Final_Transmission269_g158305 = staticSwitch345_g158305;
				#ifdef TVE_SUBSURFACE
				float3 staticSwitch348_g158305 = ( Subsurface_Color264_g158305 * Final_Transmission269_g158305 * 10.0 );
				#else
				float3 staticSwitch348_g158305 = temp_cast_8;
				#endif
				half3 Final_Translucency254_g158305 = staticSwitch348_g158305;
				float3 In_Translucency3_g158307 = Final_Translucency254_g158305;
				float In_Transmission3_g158307 = Final_Transmission269_g158305;
				#ifdef TVE_SUBSURFACE
				float staticSwitch351_g158305 = _SubsurfaceThicknessValue;
				#else
				float staticSwitch351_g158305 = 1.0;
				#endif
				half Final_Thickness275_g158305 = staticSwitch351_g158305;
				float In_Thickness3_g158307 = Final_Thickness275_g158305;
				float Final_Diffusion340_g158305 = _SubsurfaceDiffusion;
				float In_Diffusion3_g158307 = Final_Diffusion340_g158305;
				Data3_g158307.Dummy = In_Dummy3_g158307;
				Data3_g158307.Albedo = In_Albedo3_g158307;
				Data3_g158307.NormalTS = In_NormalTS3_g158307;
				Data3_g158307.NormalWS = In_NormalWS3_g158307;
				Data3_g158307.Shader = In_Shader3_g158307;
				Data3_g158307.Emissive= In_Emissive3_g158307;
				Data3_g158307.MultiMask = In_MultiMask3_g158307;
				Data3_g158307.Grayscale = In_Grayscale3_g158307;
				Data3_g158307.Luminosity = In_Luminosity3_g158307;
				Data3_g158307.AlphaClip = In_AlphaClip3_g158307;
				Data3_g158307.AlphaFade = In_AlphaFade3_g158307;
				Data3_g158307.Translucency = In_Translucency3_g158307;
				Data3_g158307.Transmission = In_Transmission3_g158307;
				Data3_g158307.Thickness = In_Thickness3_g158307;
				Data3_g158307.Diffusion = In_Diffusion3_g158307;
				TVEVisualData Data4_g158315 = Data3_g158307;
				float Out_Dummy4_g158315 = 0;
				float3 Out_Albedo4_g158315 = float3( 0,0,0 );
				float2 Out_NormalTS4_g158315 = float2( 0,0 );
				float3 Out_NormalWS4_g158315 = float3( 0,0,0 );
				float4 Out_Shader4_g158315 = float4( 0,0,0,0 );
				float4 Out_Emissive4_g158315 = float4( 0,0,0,0 );
				float Out_MultiMask4_g158315 = 0;
				float Out_Grayscale4_g158315 = 0;
				float Out_Luminosity4_g158315 = 0;
				float Out_AlphaClip4_g158315 = 0;
				float Out_AlphaFade4_g158315 = 0;
				float3 Out_Translucency4_g158315 = float3( 0,0,0 );
				float Out_Transmission4_g158315 = 0;
				float Out_Thickness4_g158315 = 0;
				float Out_Diffusion4_g158315 = 0;
				Out_Dummy4_g158315 = Data4_g158315.Dummy;
				Out_Albedo4_g158315 = Data4_g158315.Albedo;
				Out_NormalTS4_g158315 = Data4_g158315.NormalTS;
				Out_NormalWS4_g158315 = Data4_g158315.NormalWS;
				Out_Shader4_g158315 = Data4_g158315.Shader;
				Out_Emissive4_g158315= Data4_g158315.Emissive;
				Out_MultiMask4_g158315 = Data4_g158315.MultiMask;
				Out_Grayscale4_g158315 = Data4_g158315.Grayscale;
				Out_Luminosity4_g158315= Data4_g158315.Luminosity;
				Out_AlphaClip4_g158315 = Data4_g158315.AlphaClip;
				Out_AlphaFade4_g158315 = Data4_g158315.AlphaFade;
				Out_Translucency4_g158315 = Data4_g158315.Translucency;
				Out_Transmission4_g158315 = Data4_g158315.Transmission;
				Out_Thickness4_g158315 = Data4_g158315.Thickness;
				Out_Diffusion4_g158315 = Data4_g158315.Diffusion;
				half3 Input_Albedo24_g158313 = Out_Albedo4_g158315;
				#ifdef UNITY_COLORSPACE_GAMMA
				float4 staticSwitch22_g158313 = half4(0.2209163,0.2209163,0.2209163,0.7790837);
				#else
				float4 staticSwitch22_g158313 = half4(0.04,0.04,0.04,0.96);
				#endif
				half4 ColorSpaceDielectricSpec23_g158313 = staticSwitch22_g158313;
				float4 break24_g158312 = Out_Shader4_g158315;
				half Metallic117_g158312 = break24_g158312.x;
				half Input_Metallic25_g158313 = Metallic117_g158312;
				half OneMinusReflectivity31_g158313 = ( (ColorSpaceDielectricSpec23_g158313).w - ( (ColorSpaceDielectricSpec23_g158313).w * Input_Metallic25_g158313 ) );
				float3 lerpResult87_g158312 = lerp( half3(1,0,0) , ( Input_Albedo24_g158313 * OneMinusReflectivity31_g158313 ) , _IsInitialized);
				
				surfaceDescription.Albedo = lerpResult87_g158312;
				o.Normal = Out_NormalWS4_g158315;
				surfaceDescription.BentNormal = float3( 0, 0, 1 );
				surfaceDescription.CoatMask = 0;
				surfaceDescription.Metallic = 0;

				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceDescription.Specular = 0;
				#endif

				surfaceDescription.Emission = (Out_Emissive4_g158315).xyz;
				surfaceDescription.Smoothness = break24_g158312.w;
				surfaceDescription.Occlusion = 1;
				surfaceDescription.Alpha = 1;

				#ifdef _ALPHATEST_ON
				surfaceDescription.AlphaClipThreshold = 0;
				#endif

				#ifdef _ENABLE_GEOMETRIC_SPECULAR_AA
				surfaceDescription.SpecularAAScreenSpaceVariance = 0;
				surfaceDescription.SpecularAAThreshold = 0;
				#endif

				#ifdef _SPECULAR_OCCLUSION_CUSTOM
				surfaceDescription.SpecularOcclusion = 0;
				#endif

				#if defined(_HAS_REFRACTION) || defined(_MATERIAL_FEATURE_TRANSMISSION)
				surfaceDescription.Thickness = Out_Thickness4_g158315;
				#endif

				#ifdef _HAS_REFRACTION
				surfaceDescription.RefractionIndex = 1;
				surfaceDescription.RefractionColor = float3(1,1,1);
				surfaceDescription.RefractionDistance = 0;
				#endif

				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceDescription.SubsurfaceMask = 1;
				#endif

				#ifdef _MATERIAL_FEATURE_TRANSMISSION
				surfaceDescription.TransmissionMask = Out_Transmission4_g158315;
				#endif

				#if defined( _MATERIAL_FEATURE_SUBSURFACE_SCATTERING ) || defined( _MATERIAL_FEATURE_TRANSMISSION )
				surfaceDescription.DiffusionProfile = Out_Diffusion4_g158315;
				#endif

				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceDescription.Anisotropy = 1;
				surfaceDescription.Tangent = float3(1,0,0);
				#endif

				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceDescription.IridescenceMask = 0;
				surfaceDescription.IridescenceThickness = 0;
				#endif

				float4 bakedGI = float4( 0, 0, 0, 0 );

				packedInput.positionCS.zw = positionCS.zw;
				float3 positionRWS = positionWS;
				float3 normalWS = o.Normal;
				float4 tangentWS = packedInput.interp02.xyzw;

				input.positionSS = packedInput.positionCS;
				input.positionRWS = positionRWS;
				//#if defined( ASE_SRP_VERSION ) && ASE_SRP_VERSION < 60900
				//input.worldToTangent = BuildWorldToTangent( tangentWS, normalWS );
				//#else
				input.tangentToWorld = BuildTangentToWorld( tangentWS, normalWS );
				//#endif
				input.texCoord0 = packedInput.interp03.xyzw;
				input.texCoord1 = packedInput.interp04.xyzw;
				input.texCoord2 = packedInput.interp05.xyzw;

				uint2 tileIndex = uint2( input.positionSS.xy ) / GetTileSize();
				//#if defined( ASE_SRP_VERSION ) && ASE_SRP_VERSION < 60900
				//#if defined(UNITY_SINGLE_PASS_STEREO)
				//	tileIndex.x -= unity_StereoEyeIndex * _NumTileClusteredX;
				//#endif
				//PositionInputs posInput = GetPositionInput_Stereo( input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS.xyz, tileIndex, unity_StereoEyeIndex );
				//#else
				PositionInputs posInput = GetPositionInput( input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS.xyz, tileIndex );
				//#endif
				float3 normalizedWorldViewDir = GetWorldSpaceNormalizeViewDir( input.positionRWS );

				SurfaceData surfaceData;
				BuiltinData builtinData;

				GetSurfaceAndBuiltinData( surfaceDescription, input, normalizedWorldViewDir, posInput, surfaceData, builtinData);
				BSDFData bsdfData = ConvertSurfaceDataToBSDFData(input.positionSS.xy, surfaceData);
				PreLightData preLightData = GetPreLightData(normalizedWorldViewDir, posInput, bsdfData);

				#ifdef CUSTOM_BAKED_GI
					half4 decodeInstructions = half4( LIGHTMAP_HDR_MULTIPLIER, LIGHTMAP_HDR_EXPONENT, 0.0h, 0.0h );
					builtinData.bakeDiffuseLighting = UnpackLightmapRGBM( bakedGI, decodeInstructions ) * EMISSIVE_RGBM_SCALE * bsdfData.diffuseColor;
				#endif

				outColor = float4(0.0, 0.0, 0.0, 0.0);
				#ifdef _SURFACE_TYPE_TRANSPARENT
					uint featureFlags = LIGHT_FEATURE_MASK_FLAGS_TRANSPARENT;
				#else
					uint featureFlags = LIGHT_FEATURE_MASK_FLAGS_OPAQUE;
				#endif
				//float3 diffuseLighting;
				//float3 specularLighting;

				//LightLoop(normalizedWorldViewDir, posInput, preLightData, bsdfData, builtinData, featureFlags, diffuseLighting, specularLighting);
				LightLoopOutput lightLoopOutput;
				LightLoop(normalizedWorldViewDir, posInput, preLightData, bsdfData, builtinData, featureFlags, lightLoopOutput);

				// Alias
				float3 diffuseLighting = lightLoopOutput.diffuseLighting;
				float3 specularLighting = lightLoopOutput.specularLighting;

				diffuseLighting *= GetCurrentExposureMultiplier();
				specularLighting *= GetCurrentExposureMultiplier();

				#ifdef OUTPUT_SPLIT_LIGHTING
					if (_EnableSubsurfaceScattering != 0 && ShouldOutputSplitLighting(bsdfData))
					{
						outColor = float4(specularLighting, 1.0);
						outDiffuseLighting = float4(TagLightingForSSS(diffuseLighting), 1.0);
					}
					else
					{
						outColor = float4(diffuseLighting + specularLighting, 1.0);
						outDiffuseLighting = 0;
					}
					ENCODE_INTO_SSSBUFFER(surfaceData, posInput.positionSS, outSSSBuffer);
				#else
					outColor = ApplyBlendMode(diffuseLighting, specularLighting, builtinData.opacity);
					outColor = EvaluateAtmosphericScattering(posInput, normalizedWorldViewDir, outColor);
				#endif

				outputDepth = posInput.deviceDepth;
			}
			ENDHLSL
		}
		
	}
	Fallback Off
	
	CustomEditor "TVEShaderGUILite"
}
/*ASEBEGIN
Version=19603
Node;AmplifyShaderEditor.FunctionNode;513;-7040,-128;Inherit;False;Impostor Pass Octa;82;;156549;47d9a0b51a8fa984f975828bdfee2fa3;0;0;5;FLOAT4;0;FLOAT4;23;FLOAT3;25;FLOAT3;26;FLOAT3;27
Node;AmplifyShaderEditor.FunctionNode;525;-6656,128;Inherit;False;Block Impostor Model;35;;157146;93e44146af3144a4b84056ae65ecf0fc;0;2;288;COLOR;0,0,0,0;False;163;FLOAT3;0,0,0;False;2;OBJECT;128;OBJECT;339
Node;AmplifyShaderEditor.RegisterLocalVarNode;526;-6336,192;Half;False;Model Frag;-1;True;1;0;OBJECT;;False;1;OBJECT;0
Node;AmplifyShaderEditor.GetLocalVarNode;527;-5888,-128;Inherit;False;526;Model Frag;1;0;OBJECT;;False;1;OBJECT;0
Node;AmplifyShaderEditor.FunctionNode;528;-5632,-128;Inherit;False;Block Lite Global;40;;157155;3cde0aa66f3d8ec4a9b80a215a26f02b;16,315,1,311,1,317,1,321,1,319,1,323,1,337,1,283,1,285,1,282,1,308,1,276,1,349,1,287,1,289,1,348,1;1;206;OBJECT;0,0,0,0;False;1;OBJECT;151
Node;AmplifyShaderEditor.FunctionNode;529;-6656,-128;Inherit;False;Block Impostor Visual;102;;157220;f5a6295b5f4a3004ebbb03db403bc544;0;5;229;COLOR;0,0,0,0;False;285;COLOR;0,0,0,0;False;224;FLOAT3;0,0,0;False;217;FLOAT3;0,0,0;False;261;FLOAT;0;False;1;OBJECT;272
Node;AmplifyShaderEditor.RegisterLocalVarNode;530;-6336,-128;Half;False;Visual  Raw;-1;True;1;0;OBJECT;;False;1;OBJECT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;531;-5312,-128;Half;False;Global Data;-1;True;1;0;OBJECT;;False;1;OBJECT;0
Node;AmplifyShaderEditor.GetLocalVarNode;532;-3456,-128;Inherit;False;530;Visual  Raw;1;0;OBJECT;;False;1;OBJECT;0
Node;AmplifyShaderEditor.GetLocalVarNode;533;-3456,0;Inherit;False;531;Global Data;1;0;OBJECT;;False;1;OBJECT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;534;-6336,128;Half;False;Model Vert;-1;True;1;0;OBJECT;;False;1;OBJECT;0
Node;AmplifyShaderEditor.GetLocalVarNode;535;-3072,0;Inherit;False;531;Global Data;1;0;OBJECT;;False;1;OBJECT;0
Node;AmplifyShaderEditor.FunctionNode;536;-3072,-128;Inherit;False;Block Lite Overlay;177;;158217;df6d6bbf01172a34387d93d862d3d156;9,821,0,819,0,813,0,908,0,826,1,823,1,828,0,844,0,447,0;4;572;OBJECT;0,0,0,0;False;596;OBJECT;0,0,0,0;False;600;OBJECT;0,0,0,0;False;445;FLOAT;1;False;1;OBJECT;566
Node;AmplifyShaderEditor.GetLocalVarNode;537;-4864,-128;Inherit;False;534;Model Vert;1;0;OBJECT;;False;1;OBJECT;0
Node;AmplifyShaderEditor.GetLocalVarNode;538;-2688,64;Inherit;False;531;Global Data;1;0;OBJECT;;False;1;OBJECT;0
Node;AmplifyShaderEditor.FunctionNode;539;-2688,-128;Inherit;False;Block Emissive;277;;158247;64497f287b9096b43b688b52b4a0bf20;5,282,0,273,0,275,0,264,0,267,0;3;146;OBJECT;0,0,0,0;False;148;OBJECT;0,0,0,0;False;178;OBJECT;0,0,0,0;False;1;OBJECT;183
Node;AmplifyShaderEditor.FunctionNode;541;-4608,-128;Inherit;False;Block Lite Impostor Motion;331;;158262;38077585734a3224db90527d4119d9c6;0;2;146;OBJECT;0,0,0,0;False;212;OBJECT;0,0,0,0;False;1;OBJECT;128
Node;AmplifyShaderEditor.FunctionNode;500;-1536,-128;Inherit;False;Block Lite Variation;110;;158282;3df1ad26aa7a397488e4d172ec7355ef;0;0;1;COLOR;116
Node;AmplifyShaderEditor.FunctionNode;499;-1536,256;Inherit;False;Block Lite Size Fade;320;;158283;828b7cb552f180f4193fb67dbaaae0ce;0;0;1;COLOR;128
Node;AmplifyShaderEditor.FunctionNode;501;-1536,-64;Inherit;False;Block Lite Tinting;122;;158284;c2bee839afbcbb7499ebde2af2a2b317;3,352,0,377,0,375,0;0;1;COLOR;204
Node;AmplifyShaderEditor.FunctionNode;502;-1536,0;Inherit;False;Block Lite Dryness;148;;158285;d0ad841a44e589843b633cc1b97af190;3,398,0,440,0,438,0;0;1;COLOR;346
Node;AmplifyShaderEditor.FunctionNode;503;-1536,128;Inherit;False;Block Lite Cutout;244;;158286;0780bee94024ab547ae8bb1fac250cb1;2,775,0,824,0;0;1;COLOR;566
Node;AmplifyShaderEditor.FunctionNode;509;-1536,192;Inherit;False;Block Lite Dithering;261;;158287;6e52cef07120daa408f9658182b29574;3,847,0,848,0,855,1;0;1;COLOR;566
Node;AmplifyShaderEditor.FunctionNode;508;-1536,64;Inherit;False;Block Lite Wetness;224;;158288;30361f2d9d7742e4db0b62746ed1affc;3,850,0,877,0,873,0;0;1;COLOR;566
Node;AmplifyShaderEditor.FunctionNode;543;-4224,-128;Inherit;False;Block Transform;-1;;158297;5ac6202bdddd8b34a85c261af6b8de8b;0;1;146;OBJECT;0,0,0,0;False;1;OBJECT;128
Node;AmplifyShaderEditor.FunctionNode;542;-2304,-128;Inherit;False;Block Subsurface;301;;158305;d738d295ada6b1f409db6776b5efe789;3,315,0,359,1,362,0;4;146;OBJECT;0,0,0,0;False;385;OBJECT;0,0,0,0;False;371;OBJECT;0,0,0,0;False;361;FLOAT;1;False;1;OBJECT;183
Node;AmplifyShaderEditor.SimpleAddOpNode;504;-1152,-128;Inherit;False;7;7;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;544;-1984,-128;Half;False;Visual Data;-1;True;1;0;OBJECT;;False;1;OBJECT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;545;-3904,-128;Half;False;Model Data;-1;True;1;0;OBJECT;;False;1;OBJECT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;505;-960,-128;Half;False;Dummy Data;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;485;-256,-128;Inherit;False;544;Visual Data;1;0;OBJECT;;False;1;OBJECT;0
Node;AmplifyShaderEditor.GetLocalVarNode;484;-256,-64;Inherit;False;545;Model Data;1;0;OBJECT;;False;1;OBJECT;0
Node;AmplifyShaderEditor.FunctionNode;486;0,-128;Inherit;False;Block Impostor Render;0;;158312;1dac90ed7ee26b743a17d6c74e115d86;0;2;17;OBJECT;;False;19;OBJECT;;False;19;FLOAT3;21;FLOAT3;83;FLOAT3;34;FLOAT3;77;FLOAT;27;FLOAT;114;FLOAT;113;FLOAT;72;FLOAT;28;FLOAT;71;FLOAT3;65;FLOAT;66;FLOAT;67;FLOAT;68;FLOAT;73;FLOAT3;37;FLOAT3;30;FLOAT3;32;FLOAT4;33
Node;AmplifyShaderEditor.GetLocalVarNode;507;0,448;Inherit;False;505;Dummy Data;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;493;-256,-640;Half;False;Property;_ImpostorCategory;[ Impostor Category ];81;0;Create;True;0;0;0;True;1;StyledCategory(Impostor Settings, true, 0, 10);False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;490;1024,-640;Inherit;False;Base Compile;-1;;158325;e67c8238031dbf04ab79a5d4d63d1b4f;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;506;384,256;Inherit;False;Register;-1;;158326;673534ff3248b7442a6471d786096f1f;0;2;6;FLOAT3;0,0,0;False;7;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;487;352,-640;Half;False;Property;_IsImpostorShader;_IsImpostorShader;358;1;[HideInInspector];Create;True;0;2;Opaque;0;Transparent;1;0;True;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;488;576,-640;Half;False;Property;_IsSubsurfaceShader;_IsSubsurfaceShader;359;1;[HideInInspector];Create;True;0;2;Opaque;0;Transparent;1;0;True;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;494;800,-640;Half;False;Property;_IsLiteShader;_IsLiteShader;360;1;[HideInInspector];Create;True;0;2;Opaque;0;Transparent;1;0;True;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;492;0,-640;Half;False;Property;_ImpostorEnd;[ Impostor End ];109;0;Create;True;0;0;0;True;1;StyledSpace(10);False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;489;-256,-512;Half;False;Property;_render_coverage;_render_coverage;361;1;[Enum];Create;True;0;1;Off;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;540;-2688,0;Inherit;False;526;Model Frag;1;0;OBJECT;;False;1;OBJECT;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;515;768,-128;Float;False;True;-1;2;TVEShaderGUILite;0;23;BOXOPHOBIC/The Visual Engine/Impostors/Octa Subsurface Lit (Lite);4e5791d7c677cf540a160f0a09e2385a;True;GBuffer;0;0;GBuffer;27;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;9;d3d11;metal;vulkan;xboxone;xboxseries;playstation;ps4;ps5;switch;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;True;_LightLayersMaskBuffer4;False;False;False;False;False;False;False;True;True;10;False;;255;False;;14;False;;7;False;;3;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;True;1;LightMode=GBuffer;False;False;0;;0;0;Standard;16;Material Type,InvertActionOnDeselection;5;638519777757582661;Energy Conserving Specular,InvertActionOnDeselection;0;0;  Transmission,InvertActionOnDeselection;0;0;Surface Type;0;0;Alpha Cutoff;0;0;Receive Decals;1;0;Receives SSR;1;0;Specular AA;0;0;Specular Occlusion Mode;0;0;Distortion;0;0;Distortion Mode;0;0;Distortion Depth Test;0;0;Blend Preserves Specular;1;0;Fog;1;0;Draw Before Refraction;0;0;Refraction Model;0;0;0;7;True;True;True;True;True;True;True;False;;True;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;516;768,-128;Float;False;False;-1;2;ASEMaterialInspector;0;1;New Amplify Shader;4e5791d7c677cf540a160f0a09e2385a;True;SceneSelectionPass;0;1;SceneSelectionPass;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;8;d3d11;metal;vulkan;xboxone;xboxseries;playstation;ps4;switch;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=SceneSelectionPass;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;517;768,-128;Float;False;False;-1;2;ASEMaterialInspector;0;1;New Amplify Shader;4e5791d7c677cf540a160f0a09e2385a;True;META;0;2;META;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;8;d3d11;metal;vulkan;xboxone;xboxseries;playstation;ps4;switch;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Meta;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;518;768,-128;Float;False;False;-1;2;ASEMaterialInspector;0;1;New Amplify Shader;4e5791d7c677cf540a160f0a09e2385a;True;ShadowCaster;0;3;ShadowCaster;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;8;d3d11;metal;vulkan;xboxone;xboxseries;playstation;ps4;switch;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=ShadowCaster;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;519;768,-128;Float;False;False;-1;2;ASEMaterialInspector;0;1;New Amplify Shader;4e5791d7c677cf540a160f0a09e2385a;True;DepthOnly;0;4;DepthOnly;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;8;d3d11;metal;vulkan;xboxone;xboxseries;playstation;ps4;switch;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=DepthOnly;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;520;768,-128;Float;False;False;-1;2;ASEMaterialInspector;0;1;New Amplify Shader;4e5791d7c677cf540a160f0a09e2385a;True;Motion Vectors;0;5;Motion Vectors;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;8;d3d11;metal;vulkan;xboxone;xboxseries;playstation;ps4;switch;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;40;False;;255;False;;40;False;;7;False;;3;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;True;1;LightMode=MotionVectors;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;521;768,-128;Float;False;False;-1;2;ASEMaterialInspector;0;1;New Amplify Shader;4e5791d7c677cf540a160f0a09e2385a;True;Forward;0;6;Forward;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;True;8;d3d11;metal;vulkan;xboxone;xboxseries;playstation;ps4;switch;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;True;_ColorMaskTransparentVelOne;False;True;True;True;True;True;0;True;_ColorMaskTransparentVelTwo;False;False;False;True;True;10;False;;255;False;;14;False;;7;False;;3;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;True;1;LightMode=Forward;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
WireConnection;525;163;513;27
WireConnection;526;0;525;339
WireConnection;528;206;527;0
WireConnection;529;229;513;0
WireConnection;529;285;513;23
WireConnection;529;224;513;25
WireConnection;529;217;513;26
WireConnection;530;0;529;272
WireConnection;531;0;528;151
WireConnection;534;0;525;128
WireConnection;536;572;532;0
WireConnection;536;600;533;0
WireConnection;539;146;536;566
WireConnection;539;178;535;0
WireConnection;541;146;537;0
WireConnection;543;146;541;128
WireConnection;542;146;539;183
WireConnection;542;371;538;0
WireConnection;504;0;500;116
WireConnection;504;1;501;204
WireConnection;504;2;502;346
WireConnection;504;3;508;566
WireConnection;504;4;503;566
WireConnection;504;5;509;566
WireConnection;504;6;499;128
WireConnection;544;0;542;183
WireConnection;545;0;543;128
WireConnection;505;0;504;0
WireConnection;486;17;485;0
WireConnection;486;19;484;0
WireConnection;506;6;486;37
WireConnection;506;7;507;0
WireConnection;515;0;486;21
WireConnection;515;1;486;83
WireConnection;515;6;486;34
WireConnection;515;7;486;27
WireConnection;515;16;486;67
WireConnection;515;61;486;66
WireConnection;515;62;486;68
WireConnection;515;11;506;0
ASEEND*/
//CHKSM=249FF8A49E94F40CED39B5527C4E232831524450