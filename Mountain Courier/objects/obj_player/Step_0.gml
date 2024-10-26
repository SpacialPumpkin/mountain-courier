// left/right movement
var move_x = keyboard_check(vk_right) - keyboard_check(vk_left);
move_x *= move_speed;

var is_space_pressed = keyboard_check(vk_space);
var was_space_released = keyboard_check_released(vk_space);
io_clear();

show_debug_message(string(is_space_pressed));

var isOnGround = place_meeting(x, y + 2, obj_wall_family);
if (isOnGround)
{
    downward_velocity = 0;
	num_remaining_flaps = flaps_per_jump;
	has_released_spacebar_this_jump = false;
    if (is_space_pressed) downward_velocity = -jump_speed; //jump
}
else if(num_remaining_flaps > 0 && has_released_spacebar_this_jump && is_space_pressed){
	has_released_spacebar_this_jump = false;
	num_remaining_flaps--;
	downward_velocity = -flap_jump_speed;
}
//if we are in the air and we are not moving downward faster than 10
//accelerate us downward.
if (!isOnGround) {
	if(was_space_released){
		has_released_spacebar_this_jump = true;
	}
	var downward_acceleration;
	if(downward_velocity > 0){
		downward_acceleration = base_gravity_while_falling;
	}
	else{
		downward_acceleration = base_gravity_while_rising;
	}
	
	if(has_released_spacebar_this_jump && is_space_pressed && num_remaining_flaps <= 0){
	  downward_acceleration = downward_acceleration / floatiness_while_finished_flapping;
	}
	downward_velocity = min(downward_velocity + downward_acceleration, 10);
} 


// show_debug_message("x: " + string(move_x))
// show_debug_message("y: " + string(downward_velocity))
move_and_collide(move_x, downward_velocity, obj_wall_family);

if (move_x != 0) image_xscale = sign(move_x);