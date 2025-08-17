if global.Menu_Type = "buttons" {
if curmenu==0 {
	// kb
	if keyboard_check_pressed(vk_up) sel0=(sel0+4)%2;
	if keyboard_check_pressed(vk_down) sel0=(sel0+1)%2;
	// mouse
	mousehover=false;
	for(var i=0;i<2;i++) {
		if mouse_x>=10 && mouse_x<=74 && mouse_y>=50+i*48 && mouse_y<=82+i*48 {
			sel0=i;mousehover=true;
		}
	}
	// buttons functionality
	if keyboard_check_pressed(ord("Z"))||mouse_check_button_pressed(mb_left)&&mousehover { switch(sel0) {
		case 0:
			room_goto(rClient);
		break;
		case 1:
			room_goto(rServer);
		break;
	}}
}} else if global.Menu_Type = "letters" {
var join_key = ord(join_letter)
var host_key = ord(host_letter)
if keyboard_check_pressed(join_key){
room_goto(rClient);}
if keyboard_check_pressed(host_key){
room_goto(rServer);}}