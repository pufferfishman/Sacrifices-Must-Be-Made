var accel = 0.4;  
var decel = 0.25; 
var max_speed = 2; 
var grav = 0.2;
var jump_speed = -3;


ysp += grav;

if (keyboard_check(ord("A")))
{
    xsp -= accel;
}
else if (keyboard_check(ord("D")))
{
    xsp += accel;
}
else
{
    if (xsp > 0) xsp = max(0, xsp - decel);
    if (xsp < 0) xsp = min(0, xsp + decel);
}

xsp = clamp(xsp, -max_speed, max_speed);

if (place_meeting(x, y+1, [invis, platform]))
{
	ysp = 0
	if keyboard_check_pressed(ord("W"))
	{
		ysp = jump_speed
	}
}

move_and_collide(xsp, ysp, [invis, platform]);
