//paddle_inner_radius = 5;
outer_radius = paddle_starting_radius + paddle_thickness;
center_x = display_get_gui_width() / 2;
center_y = display_get_gui_height() / 2;

largest_radius = paddle_starting_radius + paddle_radius_increase;

var angle_step = 360 / paddle_count;

for (var i = 0; i < paddle_count; i++)
{
    var start_angle = i * angle_step;
    var end_angle = start_angle + angle_step;

    var inst = instance_create_layer(center_x, center_y, "Instances", obj_loop_paddle);
    inst.start_angle = start_angle;
    inst.end_angle = end_angle;
	
    //inst.inner_radius = paddle_inner_radius;
    //inst.outer_radius = outer_radius;
	
	if (i < inner_paddle_start_count)
	{
		inst.inner_radius = paddle_starting_radius;
	}
	else
	{
		inst.inner_radius = paddle_starting_radius + paddle_radius_increase;
	}
	
	inst.outer_radius = inst.inner_radius + paddle_thickness;

	//if (i % 2 ==  0)
	//{
	//	inst.inner_radius = paddle_inner_radius/2;
	//	inst.outer_radius = inst.inner_radius + paddle_thickness;
	//	//inst.active = false;
	//}
	
    update_polygon(inst);
}
