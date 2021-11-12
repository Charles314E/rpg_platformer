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
uniform float time;
#define A 0.02  //(A)mplitude
#define W 32.0  //(W)avelength
#define F 0.1  //(F)requency
void main() {
    float D = A * sin(W * v_vTexcoord.y + F * time);  //(D)isplacement
    vec2 T = v_vTexcoord + vec2(D, 0.0); //new (T)exture coordinates
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, T );
}

