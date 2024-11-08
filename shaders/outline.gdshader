shader_type canvas_item;
uniform vec4 line_color = vec4(1.0); // White color
uniform float line_thickness : hint_range(0.0, 10.0) = 1.0;


void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	// Called for every pixel the material is visible on.
	vec2 size = TEXTURE_PIXEL_SIZE * line_thickness;
	float left = texture(TEXTURE, UV + vec2(-size.x, 0)).a;
	float right = texture(TEXTURE, UV + vec2(size.x, 0)).a;
	float up = texture(TEXTURE, UV + vec2(0, size.y)).a;
	float down = texture(TEXTURE, UV + vec2(0, -size.y)).a;
	float sum = left + right + up + down;
	// This value represents the black-and-white mask we'll use to outline the sprite.
	float outline = min(sum, 1.0);
	vec4 color = texture(TEXTURE, UV);
	COLOR = mix(color, line_color, outline - color.a);
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
