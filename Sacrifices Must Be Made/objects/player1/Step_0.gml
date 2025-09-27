// --- Movement setup ---
var accel = 0.4;  
var decel = 0.25; 
var max_speed = 2; 
var grav = 0.2;
var jump_speed = -3;

// --- Death trigger check ---
if (place_meeting(x, y, deathtrigger)) {
    respawning = true;
    hit_timer = 0;
    xsp = 0;
    ysp = 0;

    // Store death data so corpse spawns in correct place
    death_x = x;
    death_y = y;
    death_sprite = sprite_index;
    death_image = image_index;
}


// --- Gravity & movement ---
ysp += grav;

// Horizontal input
if (keyboard_check(ord("A"))) {
    xsp -= accel;
}
else if (keyboard_check(ord("D"))) {
    xsp += accel;
}
else {
    if (xsp > 0) xsp = max(0, xsp - decel);
    if (xsp < 0) xsp = min(0, xsp + decel);
}

xsp = clamp(xsp, -max_speed, max_speed);

// Jumping
if (place_meeting(x, y+1, [invis, platform, playerbody])) {
    ysp = 0;
    if (keyboard_check_pressed(ord("W"))) {
        ysp = jump_speed;
    }
}

// Collision movement
move_and_collide(xsp, ysp, [invis, platform, playerbody]);

