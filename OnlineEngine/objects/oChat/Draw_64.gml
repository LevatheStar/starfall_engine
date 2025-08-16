//position and looks
draw_set_color(c_black)
draw_set_halign(fa_left)
draw_set_valign(fa_middle)

//draw input and text
if focus=true {
draw_rectangle(16, room_height/2 - 8, 232, room_height/2+8, true)
draw_text(20, room_height/2, string(text) + cursor)
}

//draw chat things
var yy = 32

for (var i = 0; i < ds_list_size(global.CHAT); i++){
draw_text_ext(16, yy, ds_list_find_value(global.CHAT, i), -1, max_text_width)
yy += 16
}