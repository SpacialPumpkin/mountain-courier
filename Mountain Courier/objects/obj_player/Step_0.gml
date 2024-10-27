// handle death
if(y >= room_height 
   || keyboard_check(ord("R"))
   || place_meeting(x, y, obj_killbox)){
	global.last_death_x = x;
	global.last_death_y = y;
	
	room_restart();

	if( ! audio_is_playing(fallin) )
	{
		audio_play_sound(fallin, 10, false);
	}
}

// left/right movement
var right_pressed = keyboard_check(vk_right) 
				|| keyboard_check(ord("D"));
var left_pressed = keyboard_check(vk_left) 
				|| keyboard_check(ord("A"));
var target_horizontal_velocity = right_pressed - left_pressed;
target_horizontal_velocity *= move_speed;


var horizontal_acceleration ;
if(abs(target_horizontal_velocity) > abs(horizontal_velocity)){
	horizontal_acceleration = horizontal_acceleration_positive;
}
else{
	horizontal_acceleration = horizontal_acceleration_negative;
}

target_horizontal_velocity += horizontal_launch_speed
horizontal_launch_speed = sign(horizontal_launch_speed) 
      * (max(0, abs(horizontal_launch_speed) - (delta_time * launch_speed_reduction_per_second)));

horizontal_velocity = lerp(horizontal_velocity,
                               target_horizontal_velocity,
							   horizontal_acceleration);
		   
move_x = horizontal_velocity;

//for sound for running start
if ( running_started == 0 && is_on_ground)
{
	if (keyboard_check_pressed(vk_right) 
		|| keyboard_check_pressed(vk_left)
		|| keyboard_check_pressed(ord("A"))
		|| keyboard_check_pressed(ord("D")))
	{
		audio_play_sound(running_start, 10, false);
		running_started = 1;
	}
}
if ( running_started == 1 )
{
	if (keyboard_check_released(vk_right) 
		|| keyboard_check_released(vk_left)
		|| keyboard_check_released(ord("A"))
		|| keyboard_check_released(ord("D")))
	{ 
		running_started = 0; //reset the running start sound toggle
	}
}

// veritcal movement
var is_space_pressed = keyboard_check(vk_space)
					 || keyboard_check(vk_up)
					 || keyboard_check(ord("W"));
var was_space_released = keyboard_check_released(vk_space)
					   || keyboard_check_released(vk_up)
					   || keyboard_check_released(ord("W"));

// show_debug_message(string(target_horizontal_velocity) + ", " + string(move_x));

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
		//if( ! audio_is_playing(WingFlap01) )
			audio_play_sound(WingFlap01, 10, false);
			//3D Sound - this needs troubleshooting here:
			//audio_play_sound_at(WingFlap01, x, y, 0, 100, 300, 1, false, 1, 1, 2);
			//audio file, x pos, y pos, z pos, falloff_ref, falloff_max, falloff_factor, loop, priority, gain, offset, pitch, listener_mask
		//}
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
	audio_play_sound(WingFlap01, 10, false);
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
	
	downward_acceleration -= vertical_launch_speed;
	vertical_launch_speed = sign(vertical_launch_speed) 
      * max(0, (abs(vertical_launch_speed) - (delta_time * launch_speed_reduction_per_second)));

	
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