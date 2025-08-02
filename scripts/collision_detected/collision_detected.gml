/// @function collision_detected(ball, paddle)
/// @param {obj_ball} ball - An instance with fields: x, y, speed
/// @param {obj_loop_paddle} paddle - An instance with fields: x, y, start_angle, end_angle, inner_radius, outer_radius, image_angle, active

function collision_detected(ball, paddle)
{
    if (!paddle.active) return false;

    // Check if ball is within paddle's radius range
    var distance_to_ball = point_distance(ball.x, ball.y, paddle.x, paddle.y);
    if (distance_to_ball < paddle.inner_radius || distance_to_ball > paddle.outer_radius)
        return false;

    show_debug_message("Collision detected!");


    return true;
}