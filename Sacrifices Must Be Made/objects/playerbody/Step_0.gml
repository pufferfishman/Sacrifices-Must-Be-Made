/// Step Event for playerbody

if (Door.image_index = 0) {
	var collisions = [invis,platform,player1,playerbody,pressurePlate]
}
else {
	var collisions = [invis,platform,player1,playerbody,pressurePlate, Door]
}

// === SETTINGS ===
var grav = 0.2;
var max_fall = 6;
var push_strength = 1;
var fric = 0.2;

// === FADE TO GRAYSCALE ===
if (fade_timer < fade_duration) {
    fade_timer += 1;

    var t = fade_timer / fade_duration;
    var r = lerp(255, 128, t);
    var g = lerp(255, 128, t);
    var b = lerp(255, 128, t);

    image_blend = make_color_rgb(r, g, b);
}

// === GRAVITY & FALLING ===
if (falling) {
    ysp = min(ysp + grav, max_fall);

    var moveY = ysp;
    var signY = sign(moveY);

    while (abs(moveY) > 0) {
        var stepY = signY * min(1, abs(moveY));

        if (!place_meeting(x, y + stepY, collisions)) {
            y += stepY;
            moveY -= stepY;
        } else {
            while (!place_meeting(x, y + signY, collisions)) {
                y += signY;
            }
            ysp = 0;
            falling = false;
            break;
        }
    }
} else {
    if (!place_meeting(x, y + 1, collisions)) {
        falling = true;
    }
}

// === PUSH INPUT (FROM PLAYER) ===
if (!falling) {
    if (place_meeting(x + 1, y, player1)) xsp = -push_strength;
    if (place_meeting(x - 1, y, player1)) xsp = push_strength;
}

// === HORIZONTAL MOVEMENT WITH CHAIN PUSH ===
if (xsp != 0) {
    var moveX = xsp;
    var signX = sign(moveX);

    while (abs(moveX) > 0) {
        var stepX = signX * min(1, abs(moveX));

        // If blocked by a platform, stop
        if (place_meeting(x + stepX, y, [invis,platform])) {
            xsp = 0;
            break;
        }

        // If blocked by another playerbody, try to push it
        var oth = instance_place(x + stepX, y, playerbody);
        if (oth != noone && oth != id) {
            // Try pushing the other one
            with (oth) {
                xsp += stepX; // push in same direction
            }

            // If the other one still can't move, stop this one too
            if (place_meeting(x + stepX, y, playerbody)) {
                xsp = 0;
                break;
            }
        }

        // Apply this step of movement
        x += stepX;
        moveX -= stepX;
    }
}

// === FRICTION ===
xsp = lerp(xsp, 0, fric);
