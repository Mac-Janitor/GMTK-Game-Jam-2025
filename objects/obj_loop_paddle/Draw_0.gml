if (active)
{
    draw_set_color(c_white);
    draw_primitive_begin(pr_trianglestrip);

    for (var i = 0; i < array_length(segment_points); i++)
    {
        var p = segment_points[i];
        draw_vertex(p[0], p[1]);
    }

    draw_primitive_end();
}
