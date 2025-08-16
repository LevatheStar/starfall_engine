var data_type = async_load[? "type"];
//var ip = string(async_load[? "ip"]);
//var port = async_load[? "port"]


switch (data_type) {
	case network_type_connect:
		var player_socket = async_load[? "socket"];
		ds_list_add(total_players, player_socket);
		var cbuff = buffer_create(32, buffer_grow, 1)
		buffer_seek(cbuff, buffer_seek_start, 0)
		buffer_write(cbuff, buffer_u8, network.establish)
		buffer_write(cbuff, buffer_u8, player_socket)
		network_send_packet(player_socket, cbuff, buffer_tell(cbuff))
		
	break;
	
	case network_type_disconnect:
		var disconnect_socket = async_load[? "socket"];
		//var packet = async_load[? "buffer"];
		var discon_id = ds_map_find_value(player_ids, disconnect_socket)
		
		var dbuff = buffer_create(32, buffer_grow, 1)
		buffer_seek(dbuff, buffer_seek_start, 0)
		buffer_write(dbuff, buffer_u8, network.disconnect)
		buffer_write(dbuff, buffer_u8, discon_id)
		
		for (var i = 0; i < ds_list_size(total_players); i++) {
		network_send_packet(ds_list_find_value(total_players, i), dbuff, buffer_tell(dbuff));}
		
		ds_list_delete(total_players, ds_list_find_index(total_players, disconnect_socket));
		ds_map_delete(player_ids, disconnect_socket)
	break;
	
	case network_type_data:
		Process_Buffer();
	break;
}
