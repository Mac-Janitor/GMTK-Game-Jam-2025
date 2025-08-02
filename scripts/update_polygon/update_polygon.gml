// Script: update_polygon.gml

function update_polygon(inst)
{
    inst.segment_points = [];

    var total_segments = inst.precision;
    var angle_range = inst.end_angle - inst.start_angle;
    var angle_step = angle_range / total_segments;

    var cos_theta = dcos(rotation);
    var sin_theta = dsin(rotation);

    for (var i = 0; i <= total_segments; i++)
    {
        var current_angle = inst.start_angle + i * angle_step;

        // Outer point
        var outer_x = lengthdir_x(inst.outer_radius, current_angle);
        var outer_y = lengthdir_y(inst.outer_radius, current_angle);

        // Inner point
        var inner_x = lengthdir_x(inst.inner_radius, current_angle);
        var inner_y = lengthdir_y(inst.inner_radius, current_angle);
		
        // Apply rotation
        var rotated_outer_x = outer_x * cos_theta - outer_y * sin_theta;
        var rotated_outer_y = outer_x * sin_theta + outer_y * cos_theta;

        var rotated_inner_x = inner_x * cos_theta - inner_y * sin_theta;
        var rotated_inner_y = inner_x * sin_theta + inner_y * cos_theta;
		
		// Store paddle
		var middle_segment = total_segments / 2;
		if (i == middle_segment)
		{
			inst.inner_middle_x = inst.x + rotated_inner_x;
			inst.inner_middle_y = inst.y + rotated_inner_y;
			inst.outer_middle_x = inst.x + rotated_outer_x;
			inst.outer_middle_y = inst.y + rotated_outer_y;
		}		

        // Store the points relative to the instance’s position
        array_push(inst.segment_points, [inst.x + rotated_outer_x, inst.y + rotated_outer_y]);
        array_push(inst.segment_points, [inst.x + rotated_inner_x, inst.y + rotated_inner_y]);
    }
}

