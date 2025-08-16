/// @description Initialize Client

//Client Variables
port = 7777;
ip = "127.0.0.1";
switch(global.Ip_Port_ask){
#region Same string
case "same string":
ipfull = get_string("Enter the server's IP address and port.", string(ip) + ":" + string(port))
if ipfull!="" {
	if string_count(":",ipfull)==1 {
		ipfull=string_split(ipfull,":");
		ip=ipfull[0];port=real(ipfull[1]);
	} else {
		ip=ipfull;
	}
}
break
#endregion
#region Separate
case "separate":
ip = get_string("Enter the server's IP address.", string(ip))
port = get_string("Enter the server's port", string(port))
break
#endregion
}
name = get_string("Please type in a name!", "Player")
if string_length(name) < 1 {name = "Player"}

connected=false;
sock=0;
network_set_config(network_config_connect_timeout, 3000);
client = network_create_socket(global.Socket_Type);
network_connect(client, ip, port);

//Create the player
instances = ds_map_create();
idd = 0;
Player = instance_create_layer(119, 300, "Instances", oPlayer);


ds_map_add(instances, idd, Player);
if global.Chat_Enabled = true{
instance_create_layer(0,0, "Instances", oChat)}
latency = 0
timeout = 0



//Say if can't connect
if (client < 0) {
	show_message("Error connecting to server.");
	room_goto(rMenu)
}