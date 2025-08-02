/// @function reflect_ball_direction(ball, paddle)
/// @param {Asset.GMObject} ball - An instance with fields: x, y, speed
/// @param {Asset.GMObject} paddle - An instance with fields: x, y, inner_middle_x, inner_middle_y, start_angle, end_angle, inner_radius, outer_radius, image_angle, active, rotation

function reflect_ball_direction(ball, paddle)
{
    // Determine distance to inner and outer middle points
    var dist_to_inner = point_distance(ball.x, ball.y, paddle.inner_middle_x, paddle.inner_middle_y);
    var dist_to_outer = point_distance(ball.x, ball.y, paddle.outer_middle_x, paddle.outer_middle_y);

    // Determine which side of the paddle was hit
    var hit_x, hit_y;
    if (dist_to_inner < dist_to_outer)
    {
        hit_x = paddle.inner_middle_x;
        hit_y = paddle.inner_middle_y;
    }
    else
    {
        hit_x = paddle.outer_middle_x;
        hit_y = paddle.outer_middle_y;
    }

    // Compute normal vector from center point to ball
    var normal_angle = point_direction(hit_x, hit_y, ball.x, ball.y);
    var incident_angle = ball.direction;

    // Reflect over the normal
    var reflected_angle = (2 * normal_angle - incident_angle + 360) mod 360;

    ball.direction = reflected_angle;

    show_debug_message("Ball reflected. New direction: " + string(ball.direction));
}
