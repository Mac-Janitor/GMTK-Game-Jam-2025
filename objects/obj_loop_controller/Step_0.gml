needs_update = false;
var inverse = -1;

if (keyboard_check(vk_left))
{
    needs_update = true;
}
if (keyboard_check(vk_right) && !needs_update)
{
    needs_update = true;
	inverse = 1;
}


if (needs_update)
{
	with (obj_loop_paddle)
	{
		//show_debug_message("Paddle ID: " + string(id));
		self.rotation += inverse * 2;
		update_polygon(self);
	}
}