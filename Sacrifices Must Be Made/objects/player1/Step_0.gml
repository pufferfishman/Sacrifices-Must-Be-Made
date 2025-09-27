// --- VARIABLES (put these in Create Event ideally) ---
var accel = 0.4;     // how quickly we speed up
var decel = 0.25;    // how quickly we slow down
var max_speed = 2;   // maximum horizontal speed
var grav = 0.2;
var jump_speed = -3;

// --- STEP EVENT ---
// Gravity
ysp += grav;

// Horizontal movement with acceleration/deceleration
if (keyboard_check(ord("A")))
{
    xsp -= accel; // accelerate left
}
else if (keyboard_check(ord("D")))
{
    xsp += accel; // accelerate right
}
else
{
    // Decelerate toward 0 when no input
    if (xsp > 0) xsp = max(0, xsp - decel);
    if (xsp < 0) xsp = min(0, xsp + decel);
}

// Clamp horizontal speed
xsp = clamp(xsp, -max_speed, max_speed);

// Ground check + jump
if (place_meeting(x, y+1, platform))
{
    ysp = 0;
    if (keyboard_check_pressed(vk_space)) || (keyboard_check_pressed(ord("W")))
    {
        ysp = jump_speed;
    }
}

// Apply movement
move_and_collide(xsp, ysp, platform);

// Spike collision check...
