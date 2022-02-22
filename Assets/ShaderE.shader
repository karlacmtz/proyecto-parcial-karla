Shader "Custom/ShaderE"
{
    Properties
    {
        _Albedo("Albedo Color", Color) = (1, 1, 1, 1)
        [HDR] _RimColor("Rim Color", Color) = (1, 0, 0, 1)
        _rimPower("Rim Power", Range(0.0, 8.0)) = 1.0
    }

    SubShader
    {
        Tags
        {
            "Queue" = "Geometry"
            "RenderType" = "Opaque"
        }

        CGPROGRAM
            #pragma surface surf Lambert

            half4 _Albedo;
            half4 _RimColor;
            float _rimPower;

            struct Input
            {
                float3 viewDir;
            };

            void surf(Input IN, inout SurfaceOutput o)
            {
                o.Albedo = _Albedo.rgb;
                float3 nVwd = normalize(IN.viewDir);
                float3 NdotV = dot(nVwd, o.Normal);
                half rim = 1 - saturate(NdotV);
                o.Emission = _RimColor.rgb * pow(rim, _rimPower);
            }

        ENDCG
    }
}
