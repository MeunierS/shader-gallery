Shader "BruForm/StencilMask"
{
    Properties
    {
        [IntRange] _StencilValue("Stencil Value", Range(0,255)) = 0
    }

    SubShader
    {
        Tags
        {
            "RenderType" = "Opaque"
            "Queue" = "Geometry"
            "RenderPipeline" = "UniversalPipeline"
        }

        Pass
        {
            Blend Zero One
            ZWrite Off

            Stencil
            {
                Ref [_StencilValue]
                Comp Always
                Pass Replace
                Fail Keep
            }
        }
    }
}