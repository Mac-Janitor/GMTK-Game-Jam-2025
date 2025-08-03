draw_set_font(fnt_default);  // Replace with your font if you have one
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
var _cx = display_get_gui_width() * 0.5;
var _cy = display_get_gui_height() * 0.5;

switch (game_state) {
    case "start":
        draw_text(_cx, _cy - 50, "Press ENTER to Start");
        draw_text(_cx, _cy, "Press ESC to Quit");
        break;

    case "paused":
        draw_text(_cx, _cy - 50, "Game Paused");
        draw_text(_cx, _cy, "Press ENTER to Restart");
        draw_text(_cx, _cy + 50, "Press ESC to Resume");
        draw_text(_cx, _cy + 100, "Press Q to Quit");
        break;

    case "playing":
        // You can draw gameplay HUD or nothing here
        break;
		
	case "game_over":
		draw_text(_cx, _cy - 50, "Game Over! Final score: " + string(score));
        draw_text(_cx, _cy, "Press ENTER to Restart");
        draw_text(_cx, _cy + 100, "Press Q to Quit");
}
