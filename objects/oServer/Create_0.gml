/// @description Initialize Server

//Server Variables
port = get_string("Enter your port.", "7777");
max_players = 12;

server = network_create_server(global.Socket_Type, port, max_players);
total_players = ds_list_create();
player_ids = ds_map_create()

//Uh oh! can't make server!
if (server < 0) {
	show_message("Error creating server.");
	room_goto(rMenu)
}
