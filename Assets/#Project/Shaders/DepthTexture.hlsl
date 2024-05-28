#ifndef DEPTH_TEXTURE_INLUDED
#define DEPTH_TEXTURE_INLUDED

void GetDepth_float(out UnityTexture2D depth){
    depth = _CameraDepthTexture;
}

#endif