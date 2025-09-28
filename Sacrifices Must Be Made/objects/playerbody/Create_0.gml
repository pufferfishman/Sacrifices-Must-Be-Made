// Create Event for playerbody
xsp = 0;
ysp = 0;
falling = true;

grav = 0.35;        // gravity strength
push_strength = 1;  // how hard the player pushes
fric = 0.12;    // horizontal friction (0..1)
max_fall = 8;       // terminal velocity

fade_timer = 0;          // starts at 0, increases over time
fade_duration = 10;      // how many steps to fully fade (30 = ~0.5 seconds)
start_color = c_white;   // initial color
end_color = make_color_rgb(128, 128, 128); // gray color
image_blend = start_color;