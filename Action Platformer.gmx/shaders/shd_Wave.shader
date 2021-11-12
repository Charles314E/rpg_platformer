//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)
uniform float u_fWaveWidth;
uniform float u_fWaveHeight;

varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying float v_fSineWave;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
    v_fSineWave = float( sin( in_Position.x / u_fWaveWidth * 3.1416) * u_fWaveHeight);
}
//######################_==_YOYO_SHADER_MARKER_==_######################@~//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying float v_fSineWave;

void main()
{
    //vec2 uv = gl_FragCoord.xy / resolution.xy;
    vec4 floorColour = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
    if (floor(v_vTexcoord.y) == floor(v_fSineWave))
        gl_FragColor = vec4( v_fSineWave, v_fSineWave, v_fSineWave, 1.0);
}
