ysp += 0.1
xsp = 0

if keyboard_check(vk_left)
{
	xsp = -2
}

if keyboard_check(vk_right)
{
	xsp = 2
}

if place_meeting(x, y+1, platform)
{
	ysp = 0
	if keyboard_check(vk_up)
	{
		ysp = -3
	}
}

move_and_collide(xsp, ysp, platform)

//Spike Collision Check

