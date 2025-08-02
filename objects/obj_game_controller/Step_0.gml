switch (game_state) {
    case "start":
        // Waiting for player to start game
        if (keyboard_check_pressed(vk_enter)) {
            game_state = "playing";
            // Initialize/reset your game here if needed
        }
        if (keyboard_check_pressed(vk_escape)) {
            game_end();  // Quit game from start menu
        }
		instance_deactivate_all(true);
		instance_activate_object(obj_game_controller);
        break;

    case "playing":
        // Check for pause
        if (keyboard_check_pressed(vk_escape)) {
            game_state = "paused";
            // You can also do: instance_deactivate_all() to pause objects
            // and instance_activate_object(obj_game_controller) to keep this controller active
        }
		instance_activate_all();
        break;

    case "paused":
        if (keyboard_check_pressed(vk_escape)) {
            game_state = "playing"; // Resume
        }
        if (keyboard_check_pressed(vk_enter)) {
            // Restart the game
            game_restart();  // restarts the game from the first room
        }
        if (keyboard_check_pressed(ord("Q"))) {
            game_end(); // Quit game from pause menu
        }
		instance_deactivate_all(true);
		instance_activate_object(obj_game_controller);
        break;
}
