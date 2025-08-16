//Connection type
//TCP is slower, but more reliable.
//UDP is faster, but less reliable.
//currently only TCP is functional. If anyone is willing to help, I could implement UDP
global.Socket_Type = network_socket_tcp
//Chat
//true = Chat is enabled.
//false = Chat is disabled.
global.Chat_Enabled = true
//Connection method
//same string makes it so that it's written like ip:port, for example 127.0.0.1:7777
//separate makes it so that it asks for the IP and Port separately
global.Ip_Port_ask = "separate"