// use completion_string
new_action_move_up_weight=string_count('w',completion_string)
new_action_move_left_weight=string_count('a',completion_string)
new_action_move_down_weight=string_count('s',completion_string)
new_action_move_right_weight=string_count('d',completion_string)
if file_exists(ini_file)
ini_open(ini_file)
ini_write_real('main','action_move_up_weight',new_action_move_up_weight)
ini_write_real('main','action_move_left_weight',new_action_move_left_weight)
ini_write_real('main','action_move_right_weight',new_action_move_right_weight)
ini_write_real('main','action_move_down_weight',new_action_move_down_weight)
ini_close()

ini_open('results.txt')
entries=ini_read_real('main','entries',0)
ini_write_string('main','attempt'+string(entries),completion_string)
ini_write_real('main','entries',entries+1)