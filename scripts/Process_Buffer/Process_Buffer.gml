// Handle packets coming from clients

function Process_Buffer() {

	var packet = async_load[? "buffer"];		
	var socket = async_load[? "id"]
	buffer_seek(packet, buffer_seek_start, 0);  
	
	var PACKET_ID = buffer_read(packet, buffer_u8); 
	
	switch (PACKET_ID) {
		
		#region Player
		case network.player:			
			var player_id =			buffer_read(packet, buffer_u16);	
			var player_x =			buffer_read(packet, buffer_s16);
			var player_y =			buffer_read(packet, buffer_s16);
			var player_latency =    buffer_read(packet, buffer_u8);
			var player_name =       buffer_read(packet, buffer_string)
			

			var buff = buffer_create(32, buffer_grow, 1);
			buffer_seek(buff, buffer_seek_start, 0);
			buffer_write(buff, buffer_u8, network.player);
			buffer_write(buff, buffer_u16, player_id);
			buffer_write(buff, buffer_s16, player_x);
			buffer_write(buff, buffer_s16, player_y);
			buffer_write(buff, buffer_u8, player_latency)
			buffer_write(buff, buffer_string, player_name)
			ds_map_add(player_ids, socket, player_id)
			

			for (var i = 0; i < ds_list_size(total_players); i++) {
			network_send_packet(ds_list_find_value(total_players, i), buff, buffer_tell(buff));}
			
			//Delete the buffer after sending the data
			buffer_delete(buff);
		break;
		#endregion
		
        #region Latency
		case network.latency:
		var _time = buffer_read(packet, buffer_u32)
		
		var lbuff = buffer_create(32, buffer_grow, 1)
		buffer_seek(lbuff, buffer_seek_start, 0)
	    buffer_write(lbuff, buffer_u8, network.latency)
		buffer_write(lbuff, buffer_u32, _time)
		
		network_send_packet(socket, lbuff, buffer_tell(lbuff))
		buffer_delete(lbuff)
		break
		#endregion
		
		#region Chat
		case network.chat:
		var text_message = buffer_read(packet, buffer_string)
		
		var tbuff = buffer_create(32, buffer_grow, 1)
		buffer_seek(tbuff, buffer_seek_start, 0)
		buffer_write(tbuff, buffer_u8, network.chat)
		buffer_write(tbuff, buffer_string, text_message)
		
		for (var i = 0; i < ds_list_size(total_players); i++) {
		network_send_packet(ds_list_find_value(total_players, i), tbuff, buffer_tell(tbuff));}
		
		buffer_delete(tbuff)
		break
		#endregion
	}

}
