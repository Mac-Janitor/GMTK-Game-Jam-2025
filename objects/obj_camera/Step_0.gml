// Rings and zoom levels
var ring_radii = [225, 425];
var zoom_levels = [1, 1.25, 1.5];

// Center and ball pos
var center_x = room_width * 0.5;
var center_y = room_height * 0.5;
var ball_x = obj_ball.x;
var ball_y = obj_ball.y;

// Distance
var dist = point_distance(center_x, center_y, ball_x, ball_y);

// Determine target zoom based on rings
var target_zoom = zoom_levels[0];
if (dist > ring_radii[1]) {
    target_zoom = zoom_levels[2];
} else if (dist > ring_radii[0]) {
    target_zoom = zoom_levels[1];
}

// Smooth zoom transition
global.camera_zoom = lerp(global.camera_zoom, target_zoom, 0.1);

// Apply zoom and center camera
var camera = view_camera[0];
var new_w = display_get_width() * global.camera_zoom;
var new_h = display_get_height() * global.camera_zoom;

camera_set_view_size(camera, new_w, new_h);
camera_set_view_pos(camera, center_x - new_w * 0.5, center_y - new_h * 0.5);
