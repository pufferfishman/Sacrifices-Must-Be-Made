image_speed = 0; 

if (place_meeting(x, y, [player1, playerbody])) {
    image_index = 1
	if (!sound_playing) {
        audio_play_sound(pressureP, 1, false); // play once
        sound_playing = true
    }
} else {
    image_index = 0
	sound_playing = false
}
