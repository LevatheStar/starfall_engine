/// @description Recieve Incoming Data


var packet = async_load[? "buffer"];
buffer_seek(packet, buffer_seek_start, 0);

var PACKET_ID = buffer_read(packet, buffer_u8);

switch (PACKET_ID) {
	#region Joining
	case network.establish:
		var player_socket = buffer_read(packet, buffer_u8);
		sock = player_socket;
		connected = true;
		ds_map_add(instances,player_socket,noone);
		break;
	#endregion
	
	#region Players
	case network.player:	
	var player_struct = buffer_read(packet, buffer_string)
		var player_ID = player_struct.socket
		var find_player = ds_map_find_value(instances, player_ID);		
		
		
		if (is_undefined(find_player)) {
			var p = instance_create_layer(0, 0, "Instances", oPlayer);
			ds_map_add(instances, player_ID, p);
			p.my_id = player_ID;
		} else {	
			if (sock != player_ID) && (instance_exists(find_player)) {
				//Player stuff

				var player_x =                player_struct.x
				var player_y =                player_struct.y
				var player_latency =          player_struct.latency
				var player_name =             player_struct.name

				//Assign player stuff

				find_player.x =               player_x;
				find_player.y =               player_y;
				find_player.latency =         player_latency
				find_player.name =            player_name
}
		}
	break;
	#endregion
	
    #region Latency
	case network.latency:
	var _got_time = buffer_read(packet, buffer_u32)
	
	latency = current_time - _got_time
	
	timeout =0
	break
	#endregion
	
	#region Disconnect
	case network.disconnect:
	var disconnect_id = buffer_read(packet, buffer_u8)
	
	var disconnect_players = ds_map_find_value(instances, disconnect_id)
	ds_map_delete(instances,disconnect_id)
	
	if (disconnect_id != idd) {
	if (!is_undefined(disconnect_players)){
	with disconnect_players{instance_destroy()}
	}}
	
	break
	#endregion
	
	#region Chat
	case network.chat:
	var msg = buffer_read(packet, buffer_string)
	
	if instance_exists(oChat){
	ds_list_add(global.CHAT, msg)}
	break
	#endregion
}
