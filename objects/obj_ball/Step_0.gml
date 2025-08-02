prev_x = x;
prev_y = y;

if (prev_direction != direction)
{
	show_debug_message("Direction changed from: " + string(prev_direction) + " to " + string(direction));
	prev_direction = direction;
}

x += lengthdir_x(speed, direction);
y += lengthdir_y(speed, direction);


with (obj_loop_paddle)
{
    collision_detected(other, id); // 'other' is the ball calling this
}