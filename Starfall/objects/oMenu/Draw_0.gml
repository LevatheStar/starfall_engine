draw_set_color(c_white);
draw_set_halign(fa_center);
for(var i=0;i<2;i++) {
	if (i==sel0) draw_sprite(sMMenuButtonsOn,i,10,50+i*48);
	else         draw_sprite(sMMenuButtonsOff,i,10,50+i*48);
}