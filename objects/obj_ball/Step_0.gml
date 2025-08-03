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

var block_hole = obj_black_hole;

if (instance_exists(block_hole))
{
	var dx = x - block_hole.x;
	var dy = y - block_hole.y;
	var dist = sqrt(dx * dx + dy * dy);
    
	var target_radius = sprite_width * 0.5 * abs(block_hole.image_xscale); // Approximate radius

	if (dist < radius + target_radius)
	{
	    with(obj_game_controller)
		{
			game_state = "game_over";
		}
	}
}

var loop_controller = obj_loop_controller;

if (instance_exists(loop_controller))
{
	var center_x = room_width * 0.5;
	var center_y = room_height * 0.5;
	var x_left_bound = center_x - loop_controller.largest_radius;
	var x_right_bound = center_x + loop_controller.largest_radius;
	var y_top_bound = center_y - loop_controller.largest_radius;
	var y_bottom_bound = center_y + loop_controller.largest_radius;
}


if (x < x_left_bound ||
	x > x_right_bound ||
	y < y_top_bound ||
	y > y_bottom_bound)
{
		with(obj_game_controller)
		{
			if (score > 0)
			{
				game_state = "game_over";
			}
		}
}
