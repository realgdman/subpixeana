shader_type canvas_item;

const float dx1 = 1.0/1280.0/3.0;//0.0003255208333333; //1.0/1024.0/3.0;
const float dx2 = 2.0/1280.0/3.0;//0.0006510416666666; //2.0/1024.0/3.0;
const float dy1 = 1.0/720.0/9.0;//0.0004629629629629; //1.0/720.0/3.0;
const float dy2 = 2.0/720.0/9.0;//0.0009259259259259; //2.0/720.0/3.0;

void fragment() {
	vec2 uv = UV;
	float x0 = uv.x*3.0;
	float y0 = uv.y*3.0;
	
	vec3 t0 = textureLod(TEXTURE, vec2(x0,y0), 0.0).rgb;
	vec3 t1 = textureLod(TEXTURE, vec2(x0,y0+dy1), 0.0).rgb;
	vec3 t2 = textureLod(TEXTURE, vec2(x0,y0+dy2), 0.0).rgb;
	vec3 t3 = textureLod(TEXTURE, vec2(x0+dx1,y0), 0.0).rgb;
	vec3 t4 = textureLod(TEXTURE, vec2(x0+dx1,y0+dy1), 0.0).rgb;
	vec3 t5 = textureLod(TEXTURE, vec2(x0+dx1,y0+dy2), 0.0).rgb;
	vec3 t6 = textureLod(TEXTURE, vec2(x0+dx2,y0), 0.0).rgb;
	vec3 t7 = textureLod(TEXTURE, vec2(x0+dx2,y0+dy1), 0.0).rgb;
	vec3 t8 = textureLod(TEXTURE, vec2(x0+dx2,y0+dy2), 0.0).rgb;
	float r = t0.r+t1.r+t2.r; r=r/3.0;
	float g = t3.r+t4.r+t5.r; g=g/3.0;
	float b = t6.r+t7.r+t8.r; b=b/3.0;
	
    COLOR = vec4(r,g,b,1.0);
}