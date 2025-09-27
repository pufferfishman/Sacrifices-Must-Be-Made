// Store death position BEFORE moving player
var deathx = x;
var deathy = y;

// Create corpse BEFORE teleporting
var body = instance_create_layer(deathx, deathy, "Instances", playerbody);

// Copy player appearance to corpse
body.sprite_index = sprite_index;
body.image_index = image_index;
body.image_speed = 0; // freeze animation

// Finally teleport player
x = startx;
y = starty;
