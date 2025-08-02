/// @function collision_detected(ball, paddle)
/// @param {Asset.GMObject} ball - An instance with fields: x, y, speed
/// @param {Asset.GMObject} paddle - An instance with fields: x, y, inner_middle_x, inner_middle_y, start_angle, end_angle, inner_radius, outer_radius, image_angle, active, rotation

function collision_detected(ball, paddle)
{
	if (!paddle.active) return false;
	
    var distance_to_ball = point_distance(ball.x, ball.y, paddle.x, paddle.y);
    if (distance_to_ball < paddle.inner_radius || distance_to_ball > paddle.outer_radius)
        return false;	
	
	var angle_to_ball = point_direction(paddle.x, paddle.y, ball.x, ball.y);

	// Apply paddle's rotation to its angle range
	// normalize to [0,360)
	var angle_start = (paddle.start_angle - paddle.rotation + 360) mod 360;
	var angle_end   = (paddle.end_angle - paddle.rotation + 360) mod 360;
	angle_to_ball   = (angle_to_ball + 360) mod 360; // normalize to [0,360)

	var within_arc = false;
	if (angle_start < angle_end)
	{
		within_arc = (angle_to_ball >= angle_start && angle_to_ball <= angle_end);
	}
	else
	{
		// Handle wrap-around (e.g. 350° to 30°)
		within_arc = (angle_to_ball >= angle_start || angle_to_ball <= angle_end);
	}

	if (within_arc)
	{
		show_debug_message("Full collision detected!");
		paddle.active = false;
		reflect_ball_direction(ball, paddle);
		return true;
	}
	
    return false;
}
