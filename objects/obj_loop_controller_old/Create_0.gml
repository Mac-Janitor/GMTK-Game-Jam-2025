var w = display_get_gui_width();
var h = display_get_gui_height();
max_radius = sqrt(sqr(w) + sqr(h));

growth_speed = 4;
spawn_interval = max_radius / 3 / growth_speed; // Delay between rings
ring_timer = 0;

//var inst = instance_create_layer(display_get_width()/2, display_get_height()/2, "Instances", obj_loop);

for (var i = 0; i < 3; i++)
{
	var inst = instance_create_layer(display_get_gui_width()/2, display_get_gui_height()/2, "Instances", obj_loop);
    inst.radius = -i * spawn_interval * growth_speed; // Offset each ring in time
}
