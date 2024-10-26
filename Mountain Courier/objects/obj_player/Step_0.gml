// left/right movement
var move_x = keyboard_check(vk_right) - keyboard_check(vk_left);
move_x *= move_speed;
var move_y = 0;

var is_space_pressed = keyboard_check(vk_space);
var was_space_released = keyboard_check_released(vk_space);

show_debug_message(string(is_space_pressed));

if(was_space_released){
	has_released_spacebar_this_jump = true;
}

var isOnGround = place_meeting(x, y + 2, obj_wall_family);
if (isOnGround)
{
	downward_acceleration=0;
    downward_velocity = 0;
	num_remaining_flaps = flaps_per_jump;
	has_released_spacebar_this_jump = false;

    if (is_space_pressed)
	{
		downward_velocity = -jump_speed; //jump
		move_y = downward_velocity;
	} 
}
else if(num_remaining_flaps > 0 
        && has_released_spacebar_this_jump 
		&& is_space_pressed){
	downward_acceleration=0;
	has_released_spacebar_this_jump = false;
	num_remaining_flaps--;
	downward_velocity = -flap_jump_speed;
}
//if we are in the air and we are not moving downward faster than 10
//accelerate us downward.
if (!isOnGround) {
	
	var target_downward_acceleration;
	if(downward_velocity > 0){
		target_downward_acceleration = base_gravity_while_falling;
	}
	else{
		target_downward_acceleration = base_gravity_while_rising;
	}
	downward_acceleration 
	   = lerp(downward_acceleration,
	          target_downward_acceleration,
			  jerk)
	
	downward_velocity = min(downward_velocity + downward_acceleration, max_fall_speed);
	
	move_y = downward_velocity;
	
	if(is_space_pressed && downward_velocity > 0)
	{
	  downward_acceleration=0;
	  move_y /= floatiness_while_finished_flapping;
	  downward_velocity=move_y;
	}
} 


// show_debug_message("x: " + string(move_x))
// show_debug_message("y: " + string(downward_velocity))
move_and_collide(move_x, move_y, obj_wall_family);

if (move_x != 0) image_xscale = sign(move_x);