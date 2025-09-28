// Draw red bar on screen
var bar_width = 400; // max width of bar
var bar_height = 40;
var x1 = 760; // centered values
var y1 = 250;

var pct = time_left / time_max;
var current_width = bar_width * pct;

draw_set_color(c_red);
draw_rectangle(x1, y1, x1 + current_width, y1 + bar_height, false);

//outline
draw_set_color(c_black);
draw_rectangle(x1, y1, x1 + bar_width, y1 + bar_height, true);