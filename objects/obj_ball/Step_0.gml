x += lengthdir_x(speed, direction);
y += lengthdir_y(speed, direction);


with (obj_loop_paddle)
{
    collision_detected(other, id); // 'other' is the ball calling this
}