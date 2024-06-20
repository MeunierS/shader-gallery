#ifndef MONOCHROME_INCLUDED
# define MONOCHROME_INCLUDED

void Grayscale_float(float3 color, out float result){
    result = color.r * .2126 + color.g * .7152 + color.b * .0722;
}
void Grayscale_half(half3 color, out half result){
    result = color.r * .2126 + color.g * .7152 + color.b * .0722;
}
#endif