//new attempt

if file_exists(ini_file)
ini_open(ini_file)
action_move_up_weight = ini_read_real("main","action_move_up_weight",1)
action_move_down_weight = ini_read_real("main","action_move_down_weight",1)
action_move_right_weight = ini_read_real("main","action_move_right_weight",1)
action_move_left_weight = ini_read_real("main","action_move_left_weight",1)
ini_close()

total_weights = action_move_up_weight + action_move_down_weight + action_move_right_weight + action_move_left_weight

action_move_up_percent = action_move_up_weight / total_weights * 100
action_move_right_percent = action_move_up_weight / total_weights * 100
action_move_left_percent = action_move_up_weight / total_weights * 100
action_move_down_percent = action_move_up_weight / total_weights * 100

action_move_up_min = 0
action_move_up_max = action_move_up_percent
action_move_down_min = action_move_up_percent + 1
action_move_down_max = action_move_down_min + action_move_down_percent
action_move_right_min = action_move_down_max + 1
action_move_right_max = action_move_right_min + action_move_right_percent
action_move_left_min = action_move_right_max + 1
action_move_left_max = action_move_left_min + action_move_up_weight

rand = irandom_range(0,100)

if rand > action_move_up_min && rand < action_move_up_max
    {
         y -= 32;
         completion_string = completion_string + "w"
    }
if rand > action_move_down_min && rand < action_move_down_max
    {
         y += 32;
         completion_string = completion_string + "s"
    }
if rand > action_move_right_min && rand < action_move_right_max
    {
         x += 32;
         completion_string = completion_string + "d"
    }
if rand > action_move_left_min && rand < action_move_left_max
    {
         x -= 32;
         completion_string = completion_string + "a"
    }