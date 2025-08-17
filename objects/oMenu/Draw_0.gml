if global.Menu_Type = "buttons" {
draw_set_color(c_white);
draw_set_halign(fa_center);
for(var i=0;i<2;i++) {
	if (i==sel0) draw_sprite(sMMenuButtonsOn,i,10,50+i*48);
	else         draw_sprite(sMMenuButtonsOff,i,10,50+i*48);
}} else if global.Menu_Type = "letters" {
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_text(10, 50, "Press " + host_letter + " to host a game!")
draw_text(10, 70, "Press " + join_letter + " to join a game!")
}