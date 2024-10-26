// handles the death of the enemy
if( y >= room_height ){
	instance_destroy();
}

move_x *= move_speed;

if (place_meeting(x, y + 2, obj_wall_family))
{
    move_y = 0;
    if (keyboard_check(vk_space)) move_y = -jump_speed; //jump
}

//if wall in front
else if (place_meeting(x + 2, y + 2, obj_wall_family))
{
	move_x *= -1;
    move_y = 0;
    if (keyboard_check(vk_space)) move_y = -jump_speed; //jump
}

//if wall in back
else if (place_meeting(x - 2, y + 2, obj_wall_family))
{
	move_x *= -1;
    move_y = 0;
    if (keyboard_check(vk_space)) move_y = -jump_speed; //jump
}
//if we are in the air and we are not moving downward faster than 10
//accelerate us downward.
else if (move_y < 10) move_y += 1; 

move_and_collide(move_x, move_y, obj_wall_family);

//flip anim
if (move_x != 0) image_xscale = sign(move_x);