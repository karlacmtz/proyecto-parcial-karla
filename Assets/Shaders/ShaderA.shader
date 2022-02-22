Shader "Custom/ShaderA"
{
    Properties
    {
        _Albedo("Albedo Color", Color) = (1, 1, 1, 1)
    }

    SubShader
    {
        Tags
        {
            "Queue" = "Geometry"
            "RenderType" = "Opaque"
        }

        CGPROGRAM
            float4  _Albedo;

            #pragma surface surf Lambert

            struct Input
            {
                float2 _uvMainTex;
            };

            void surf(Input IN, inout SurfaceOutput o)
            {
                o.Albedo = _Albedo;
            }

        ENDCG
    }
}
