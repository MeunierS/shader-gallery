#ifndef NORMAL_FOR_WALL_INCLUDED
# define NORMAL_FOR_WALL_INCLUDED

void Vertical_float(float4 uv, float offset, out float2 uvOut1, out float2 uvOut2){
    //* alternate old way:  uvOut1 = float2( uv.x , uv.y - offset); 
    //*                     uvOut2 = float2( uv.x , uv.y + offset);
    float2 direction = float2(0,1);
    uvOut1 = uv - direction * offset;
    uvOut2 = uv + direction * offset;
}
void Vertical_half(half4 uv, half offset, out half2 uvOut1, out half2 uvOut2){
    float2 direction = float2(0,1);
    uvOut1 = uv - direction * offset;
    uvOut2 = uv + direction * offset;
}
void Horizontal_float(float4 uv, float offset, out float2 uvOut1, out float2 uvOut2){
    float2 direction = float2(1,0);
    uvOut1 = uv - direction * offset;
    uvOut2 = uv + direction * offset;
}
void Horizontal_half(half4 uv, half offset, out half2 uvOut1, out half2 uvOut2){
    float2 direction = float2(1,0);
    uvOut1 = uv - direction * offset;
    uvOut2 = uv + direction * offset;
}

//* => refactoring

void Shift_float(float offset, float2 uv, float2 direction, out float2 shifted_pos, out float2 shifted_neg){
    direction = normalize(direction);
    shifted_pos = uv + direction * offset;
    shifted_neg = uv - direction * offset;
}
void Shift_half(half offset, half2 uv, half2 direction, out half2 shifted_pos, out half2 shifted_neg){
    direction = normalize(direction);
    shifted_pos = uv + direction * offset;
    shifted_neg = uv - direction * offset;
}
#endif