//Connection type
//TCP is slower, but more reliable.
//UDP is faster, but less reliable. Broken!
global.Socket_Type = network_socket_tcp
//Chat
//true = Chat is enabled.
//false = Chat is disabled.
global.Chat_Enabled = true
//Connection method
//same string makes it so that it's written like ip:port, for example 127.0.0.1:7777
//separate makes it so that it asks for the IP and Port separately
global.Ip_Port_ask = "separate"
//Menu types
//buttons means that there will be 2 buttons for hosting and joining.
//letters means that the player will need to press buttons on their keyboard for hosting and joining. Broken!
global.Menu_Type = "buttons"