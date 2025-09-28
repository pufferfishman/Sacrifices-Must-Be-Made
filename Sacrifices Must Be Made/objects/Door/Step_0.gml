var all_done = true; // assume true until proven false

with (pressurePlate) {
    if (image_index == 0) {
        all_done = false;
    }
}

// If all plates are pressed & key is gone -> open door
if (!instance_exists(Key) && all_done) {
    if (!sound_played) {
        image_index = 1;
        audio_play_sound(door, 1, false);
        sound_played = true;
    }
} 
else {
    // Not all plates pressed -> reset door
    image_index = 0;
    sound_played = false;
}
