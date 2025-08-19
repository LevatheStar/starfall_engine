/// @description Movement and Data

//Can move only if this is the client.
if (instance_exists(oClient) && (my_id == -1)) {
#region Usefull Variables
var press_left = keyboard_check(left)
var press_right = keyboard_check(right)
var press_up = keyboard_check_pressed(up)
var on_ground = place_meeting(x, y+1, oSolid)
#endregion
    #region Gameplay
#region Variable things
yvel+=grav
#endregion
#region Inputs
move = (press_right-press_left)

if press_up and on_ground{
yvel = jmp}
#endregion
#region Collision
if (abs(xvel) < spd || move != sign(xvel)) xvel+=move*(acc+dcc);
if (abs(xvel)>dcc) xvel-=sign(xvel)*dcc;
else xvel=0;
if (abs(xvel)>spd) xvel=sign(xvel)*spd;

if place_meeting(x+xvel,y,oSolid) {
    while !place_meeting(x+sign(xvel),y,oSolid) {
        x += sign(xvel);
    }
    xvel = 0;
}
x += xvel;
if place_meeting(x,y+yvel,oSolid) {
    while !place_meeting(x,y+sign(yvel),oSolid) {
        y += sign(yvel);
    }
    yvel = 0;
}
y += yvel;
#endregion
    #endregion
	
	#region Online
	// If the connection is established, then we
	if oClient.connected = true {
	if global.Info_Sending = "Structs"
	{
	//send our data.
	var sbuff = buffer_create(32, buffer_grow, 1);
	var struct = {
	socket: oClient.sock,
	x: x,
	y: y,
	latency: latency,
	name: name}
	buffer_seek(sbuff, buffer_seek_start, 0);
	buffer_write(sbuff, buffer_u8, network.player);	
	buffer_write(sbuff, buffer_string, json_stringify(struct));
	network_send_packet(oClient.client, sbuff, buffer_tell(sbuff));	
	buffer_delete(sbuff);}
	else {
	var obuff = buffer_create(32, buffer_grow, 1);
	buffer_seek(obuff, buffer_seek_start, 0);
	buffer_write(obuff, buffer_u8, network.player);	
	buffer_write(obuff, buffer_u16, oClient.sock)
	buffer_write(obuff, buffer_s16, x)
	buffer_write(obuff, buffer_s16, y)
	buffer_write(obuff, buffer_u8, latency)
	buffer_write(obuff, buffer_string, name)
	network_send_packet(oClient.client, obuff, buffer_tell(obuff));	
	}
	}
    #endregion
}