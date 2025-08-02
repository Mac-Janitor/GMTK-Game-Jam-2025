// Apply custom shader
//shader_set(shd_ball_effect);

// Pass data to shader (if needed)
//shader_set_uniform_f(shader_get_uniform(shd_ball_effect, "u_time"), current_time / 1000);

// Draw the white circle
draw_set_color(c_white);
draw_circle_color(x, y, radius, c_white, c_white, false);

// Reset shader
//shader_reset();
