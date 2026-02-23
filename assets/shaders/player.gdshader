shader_type canvas_item;

uniform float flash = 0.0;
uniform int onoff = 0;

vec4 lerp(vec4 a, vec4 b, float t) {
	vec4 lerp_eq = (a + (b - a) * t);
	return lerp_eq;
} 

void fragment() {
	COLOR = lerp(COLOR, vec4(1.0), flash) * texture(TEXTURE, UV).a;
}