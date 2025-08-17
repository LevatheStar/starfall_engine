x += (Player.x+Player.xvel*8-x)/5;
y += (Player.y-48+Player.yvel*2-y)/5;

x = clamp(x,0,room_width)
y = clamp(y,0,room_height)



var lbuff = buffer_create(32, buffer_grow, 1)
buffer_seek(lbuff, buffer_seek_start, 0)
buffer_write(lbuff, buffer_u8, network.latency)
buffer_write(lbuff, buffer_u32, current_time)

network_send_packet(client, lbuff, buffer_tell(lbuff))

Player.latency = latency
timeout++


show_debug_message(timeout)
if timeout>room_speed*30{
network_destroy(client);
room_goto(rMenu)
}
