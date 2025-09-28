if (!instance_exists(Key) && !sound_played) {
    image_index = 1;
    audio_play_sound(door, 1, false);
    sound_played = true
}