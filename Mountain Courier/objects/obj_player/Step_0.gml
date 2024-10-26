// handle death
if(y >= room_height || keyboard_check(ord("R"))){
	room_restart();
}

// left/right movement
var target_horizontal_velocity 
  = keyboard_check(vk_right) - keyboard_check(vk_left);
target_horizontal_velocity *= move_speed;
var horizontal_acceleration ;
if(abs(target_horizontal_velocity) > horizontal_velocity){
	horizontal_acceleration = horizontal_acceleration_positive;
}
else{
	horizontal_acceleration = horizontal_acceleration_negative;
}
horizontal_velocity = lerp(horizontal_velocity,
                               target_horizontal_velocity,
							   horizontal_acceleration);
move_x = horizontal_velocity;

// veritcal movement
var is_space_pressed = keyboard_check(vk_space);
var was_space_released = keyboard_check_released(vk_space);

show_debug_message(string(target_horizontal_velocity) + ", " + string(move_x));

if(was_space_released){
	has_released_spacebar_this_jump = true;
}

is_on_ground = place_meeting(x, y + 6, obj_wall_family);
if (is_on_ground)
{
	downward_acceleration=0;
    downward_velocity = 0;
	num_remaining_flaps = flaps_per_jump;

    if (is_space_pressed && has_released_spacebar_this_jump) //regular jump
	{
		downward_velocity = -jump_speed; //jump
		move_y = downward_velocity;
		image_index = 0; //reset anim
	} 
}
//flap jump
else if(num_remaining_flaps > 0 
        && has_released_spacebar_this_jump 
		&& is_space_pressed){
	downward_acceleration=0;
	num_remaining_flaps--;
	downward_velocity = -flap_jump_speed;
	image_index = 0; //reset anim
}
//if we are in the air and we are not moving downward faster than 10
//accelerate us downward.
if (!is_on_ground) {
	
	var target_downward_acceleration;
	if(downward_velocity > 0){
		target_downward_acceleration = base_gravity_while_falling;
	}
	else{
		target_downward_acceleration = base_gravity_while_rising;
	}
	downward_acceleration 
	   = target_downward_acceleration
	
	downward_velocity = min(downward_velocity + downward_acceleration, max_fall_speed);
	
	move_y = downward_velocity;
	
	if(is_space_pressed && downward_velocity > 0)
	{
	  downward_acceleration=0;
	  move_y /= floatiness_while_finished_flapping;
	  downward_velocity=move_y;
	}
} 

if(is_space_pressed) {
	has_released_spacebar_this_jump = false;
}

// show_debug_message("x: " + string(move_x))
// show_debug_message("y: " + string(downward_velocity))
move_and_collide(0     , move_y, obj_wall_family);
move_and_collide(move_x, 0     , obj_wall_family);

if (move_x != 0) image_xscale = sign(move_x);