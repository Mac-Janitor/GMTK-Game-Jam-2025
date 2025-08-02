/// @function reflect_ball_direction(ball, paddle)
/// @param {Asset.GMObject} ball - An instance with fields: x, y, speed
/// @param {Asset.GMObject} paddle - An instance with fields: x, y, inner_middle_x, inner_middle_y, start_angle, end_angle, inner_radius, outer_radius, image_angle, active, rotation

function reflect_ball_direction(ball, paddle)
{
    // Push back to previous position
    ball.x = ball.prev_x;
    ball.y = ball.prev_y;

    // Determine which side was hit
    var dist_to_inner = point_distance(ball.x, ball.y, paddle.inner_middle_x, paddle.inner_middle_y);
    var dist_to_outer = point_distance(ball.x, ball.y, paddle.outer_middle_x, paddle.outer_middle_y);

    var hit_x, hit_y;
    if (dist_to_inner < dist_to_outer)
    {
        hit_x = paddle.inner_middle_x;
        hit_y = paddle.inner_middle_y;
		with(obj_loop_controller)
		{
			paddle.move_radius = paddle_radius_increase;
		}		
    }
    else
    {
        hit_x = paddle.outer_middle_x;
        hit_y = paddle.outer_middle_y;
    }

    var normal_angle = point_direction(hit_x, hit_y, ball.x, ball.y);
    var incident_angle = ball.direction;
    var reflected_angle = (2 * normal_angle - incident_angle + 360) mod 360;

    ball.direction = reflected_angle;

	// Nudge the ball in the new direction to prevent recollision
    var separation_distance = 2;
    ball.x += lengthdir_x(separation_distance, ball.direction);
    ball.y += lengthdir_y(separation_distance, ball.direction);

    show_debug_message("Ball reflected. New direction: " + string(ball.direction));
}
