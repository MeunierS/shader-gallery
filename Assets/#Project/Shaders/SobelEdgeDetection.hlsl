#ifndef SOBEL_EDGE_DETECTION_INCLUDED
#define SOBEL_EDGE_DETECTION_INCLUDED

static float sobelHorizontal[9] = {
    1, 0, -1,
    2, 0, -2,
    1, 0, -1,
};

static float sobelVertical[9] = {
     1,  2,  1,
     0,  0,  0,
    -1, -2, -1,
};

static float2 samplePoints[9] = {
    float2(-1, 1), float2(0, 1), float2(1, 1),
    float2(-1, 0), float2(0,0), float2(1, 0),
    float2(-1, -1), float2(0, -1), float2(1, -1),
};

void Sobel_float(UnityTexture2D tex, float2 uv, float thickness, out float output){
    float2 sobelR = 0;
    float2 sobelG = 0;
    float2 sobelB = 0;

    [unroll] for (int i=0; i < 9; i++){
        float3 pixel = tex2D(tex, uv + samplePoints[i] * thickness);
        sobelR += pixel.r * float2(sobelHorizontal[i], sobelVertical[i]);
        sobelG += pixel.g * float2(sobelHorizontal[i], sobelVertical[i]);
        sobelB += pixel.b * float2(sobelHorizontal[i], sobelVertical[i]);
    }

    output = max(length(sobelR), max(length(sobelG), length(sobelB)));
}

#endif