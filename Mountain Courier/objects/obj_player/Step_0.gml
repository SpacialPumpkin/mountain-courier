move_x = keyboard_check(vk_right) - keyboard_check(vk_left);
move_x *= move_speed;

if (place_meeting(x, y + 2, obj_wall_family))
{
	move_y = 0;

//for downward slope detection and adjustment based on downward slope found
//diagonals
if (!place_meeting(x + move_x, y + 2, obj_wall_family) && place_meeting(x + move_x, y + 10, obj_wall_family))
{
		move_y = abs(move_x);
		move_x = 0;
}

if (keyboard_check(vk_space)) move_y = -jump_speed; //jump

}

//if we are in the air and we are not moving downward faster than 10
//accelerate us downward.
else if (move_y < 10) move_y += 1; 

move_and_collide(move_x, move_y, obj_wall_family, move_speed, -1); //has max speeds for last 2 params

if (move_x != 0) image_xscale = sign(move_x);