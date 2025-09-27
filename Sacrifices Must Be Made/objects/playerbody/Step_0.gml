if (falling) {
    ysp += grav; // accelerate downwards
    
    // Check if moving down would hit a platform
    if (place_meeting(x, y + ysp, [invis, platform, playerbody])) {
        // Snap to top of platform
        while (!place_meeting(x, y + sign(ysp), [invis, platform, playerbody])) {
            y += sign(ysp);
        }
        ysp = 0;
        falling = false; // stop falling
    } else {
        // Free fall
        y += ysp;
    }
}
