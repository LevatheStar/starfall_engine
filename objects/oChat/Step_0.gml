if keyboard_check_released(type_button){
focus = !focus
text = ""
keyboard_string = ""
}

if focus{
oClient.Player.canmove = false
text = keyboard_string

if keyboard_check_released(confirm_button) && string_length(text) < max_text_length && string_length(text) > 0{
//make the buffer! it's so strong
var text_buff = buffer_create(32, buffer_grow, 1)
buffer_seek(text_buff, buffer_seek_start, 0)
buffer_write(text_buff, buffer_u8, network.chat)
buffer_write(text_buff, buffer_string, string(oClient.name) + ": " + string(text))
//send it!
network_send_packet(oClient.client, text_buff, buffer_tell(text_buff))
buffer_delete(text_buff)
//reset. what an undertale reference!
text = ""
keyboard_string = ""
focus = !focus
}} else {oClient.Player.canmove = true}
while ds_list_size(global.CHAT) > stored_messages{
ds_list_delete(global.CHAT, 0)
}