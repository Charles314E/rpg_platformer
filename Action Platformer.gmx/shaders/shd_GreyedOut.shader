//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    //Take the original colour of the pixel selected.
    vec4 oColour = texture2D( gm_BaseTexture, v_vTexcoord );
    float Luma = ((0.2126 * oColour.r) + (0.7152 * oColour.g) + (0.0722 * oColour.r));
    
    float Red = Luma;
    float Green = Luma;
    float Blue = Luma;
    float Alpha = oColour.a;
    
    vec4 nColour = vec4(Red, Green, Blue, Alpha);
    gl_FragColor = nColour;
}
