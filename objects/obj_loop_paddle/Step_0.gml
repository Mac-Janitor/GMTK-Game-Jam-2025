if (move_radius > 0)
{
	if (inner_radius < 25)
		var test = 1;
	inner_radius++;
	outer_radius++;
	move_radius--;
	update_polygon(self);
}