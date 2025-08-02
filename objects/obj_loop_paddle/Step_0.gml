if (move_radius > 0)
{
	inner_radius++;
	outer_radius++;
	move_radius--;
	update_polygon(self);
}