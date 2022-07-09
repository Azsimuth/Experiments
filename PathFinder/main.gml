// choose from weights

all_actions = 4


if file_exists("weights.ini")
ini_open("weights.ini")
global.action_move_up_weight = ini_read_real("main","action_move_up_weight",1)
global.action_move_down_weight = ini_read_real("main","action_move_down_weight",1)
global.action_move_right_weight = ini_read_real("main","action_move_right_weight",1)
global.action_move_left_weight = ini_read_real("main","action_move_left_weight",1)
ini_close()

total_weights = global.action_move_up_weight + global.action_move_down_weight + global.action_move_right_weight + global.action_move_left_weight

/*
if global.action_move_up_weight == global.action_move_down_weight
 // {if global.action_move_right_weight == global.action_move_left_weight}
  { i=irandom_range(1,all_actions);
    switch i {
        case 1:
            {self.y = self.y + 32; break} //action_move_up
        case 2:
            {self.y = self.y - 32; break} // action_move_down
        case 3:
            {self.x = self.x + 32; break} // action_move_right
        case 4:
            {self.x = self.x - 32; break} // action_move_left
            }
  }
*/
// next_action = max(action_move_up_weight,action_move_down_weight,action_move_right_weight,action_move_left_weight) // test for heighest

list = ds_list_create() 
ds_list_add(list,global.action_move_up_weight)
ds_list_add(list,global.action_move_down_weight)
ds_list_add(list,global.action_move_right_weight)
ds_list_add(list,global.action_move_left_weight)

ds_list_sort(list,false)

first=ds_list_find_value(list,0)
second=ds_list_find_value(list,1)
third=ds_list_find_value(list,2)
fourth=ds_list_find_value(list,3)




action_move_up_percent = global.action_move_up_weight / total_weights * 100
action_move_right_percent = global.action_move_up_weight / total_weights * 100
action_move_left_percent = global.action_move_up_weight / total_weights * 100
action_move_down_percent = global.action_move_up_weight / total_weights * 100

perc=ds_list_create()
ds_list_add(perc,action_move_up_percent)
ds_list_add(perc,action_move_right_percent)
ds_list_add(perc,action_move_left_percent)
ds_list_add(perc,action_move_down_percent)
ds_list_sort(perc,false)

zs=irandom(1) 

switch zs {
    case zs > ds_list_find_value(perc,0):
        y = y + 32;
        break;

    case zs > ds_list_find_value(perc,1):
        y = y - 32;
        break;

    case zs > ds_list_find_value(perc,2):
        x = x + 32;
        break;

    case zs > ds_list_find_value(perc,3):
        x = x - 32;
        break;
}

// none of this makes sense.