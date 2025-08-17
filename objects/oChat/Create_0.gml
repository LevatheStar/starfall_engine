//Setup
global.CHAT = ds_list_create()
stored_messages = 6


//Other variables
focus = false
cursorblink = "|"
cursor = cursorblink
cursorblink_time = room_speed / 2
text = ""
max_text_length = 50
max_text_width = 700
alarm[0] = cursorblink_time
type_button = vk_tab
confirm_button = vk_enter