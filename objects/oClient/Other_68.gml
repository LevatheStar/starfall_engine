/// @description Recieve Incoming Data


var packet = async_load[? "buffer"];
buffer_seek(packet, buffer_seek_start, 0);

var PACKET_ID = buffer_read(packet, buffer_u8);

switch (PACKET_ID) {
	#region Joining
	case network.establish:
		var player_id = buffer_read(packet, buffer_u8);
		sock = player_id;
		connected = true;
		ds_map_add(instances,player_id,noone);
		break;
	#endregion
	
	#region Players
	case network.player:	
		var player_id = buffer_read(packet, buffer_u8);
		var find_player = ds_map_find_value(instances, player_id);		
		
		
		if (is_undefined(find_player)) {
			var p = instance_create_layer(0, 0, "Instances", oPlayer);
			ds_map_add(instances, player_id, p);
			p.my_id = player_id;
		} else {	
			if (sock != player_id) && (instance_exists(find_player)) {
				//Player stuff
				var player_x =                buffer_read(packet, buffer_s16);
				var player_y =                buffer_read(packet, buffer_s16);
				var player_latency =          buffer_read(packet, buffer_u8)
				var player_name =             buffer_read(packet, buffer_string)
				
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
