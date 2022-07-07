// choose from weights

all_actions = 4


if file_exists("weights.ini")
ini_open("weights.ini")
global.action_move_up_weight = ini_read_real("main","action_move_up_weight",1)
global.action_move_down_weight = ini_read_real("main","action_move_down_weight",1)
global.action_move_rigth_weight = ini_read_real("main","action_move_rigth_weight",1)
global.action_move_left_weight = ini_read_real("main","action_move_left_weight",1)
ini_close()

if global.action_move_up_weight == global.action_move_down_weight
 // {if global.action_move_rigth_weight == global.action_move_left_weight}
  { i=irandom_range(1,all_actions);
    switch i {
        case 1:
            {self.y = self.y + 32; break} //action_move_up
        case 2:
            {self.y = self.y - 32; break} // action_move_down
        case 3:
            {self.x = self.x + 32; break} // action_move_rigth
        case 4:
            {self.x = self.x - 32; break} // action_move_left
            }
  }

// next_action = max(action_move_up_weight,action_move_down_weight,action_move_rigth_weight,action_move_left_weight) // test for heighest

list = ds_list_create() 
ds_list_add(list,global.action_move_up_weight)
ds_list_add(list,global.action_move_down_weight)
ds_list_add(list,global.action_move_rigth_weight)
ds_list_add(list,global.action_move_left_weight)

ds_list_sort(list,true)

first=ds_list_find_value(list,0)
second=ds_list_find_value(list,1)
third=ds_list_find_value(list,2)
fourth=ds_list_find_value(list,3)

zs=irandom(4) // random value

switch zs {
    case 1:
        { if !irandom_range(0,first)==first // magic
             {zs=2; break} // execute change!
        }
        y = y + 32;
        break;

    case 2:
        { if !irandom_range(0,second)==second // magic
             {zs=3; break} // execute change!
        }
        y = y - 32;
        break;

    case 3:
        { if !irandom_range(0,third)==third // magic
             {zs=4; break} // execute change!
        }
        x = x + 32;
        break;

    case 4:
        { if !irandom_range(0,fourth)==fourth // magic
             {zs=1; break} // execute change!
        }
        x = x - 32;
        break;
}