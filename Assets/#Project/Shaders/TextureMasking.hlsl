#ifndef TEXTURE_MASKING_INCLUDED
#define TEXTURE_MASKING_INCLUDED

void Lerp_float(float4 a, float4 b, float4 mask, out float4 result){
    result = a * mask + b * (1 - mask);
}

void Lerp_half(half4 a, half4 b, half4 mask, out half4 result){
    result = a * mask + b * (1 - mask);
}

#endif