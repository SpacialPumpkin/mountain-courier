var player_distance_to_self =
	point_distance(obj_player.x, obj_player.y, x, y);

var distance_from_origin =
	point_distance(x, y, origin_x, origin_y);

var target_x;
var target_y;
if(abs(player_distance_to_self) < aggro_radius){
	//  move toward the player
	target_x = obj_player.x;
	target_y = obj_player.y;
	
	// Also, fire laser beams
}
else{ // otherwise, move toward my home point.
	target_x = origin_x;
	target_y = origin_y;
}

var current_image_index = image_index;
// very hacky, but this causes the monster to lunge at the player in time with its animation
if(!has_launched_self && floor(current_image_index) == 0){
	has_launched_self = true;


	var distance_to_target = point_distance(x, y, target_x, target_y);
	
	if(distance_to_target != 0){
		var normalized_x = (target_x - x) / distance_to_target;
		var normalized_y = (target_y - y) / distance_to_target;
	}
	else{
		var normalized_x = 0;
		var normalized_y = 0;
	}
	
	show_debug_message(string(normalized_x) + ", " + string(normalized_y));

	horizontal_velocity += normalized_x * move_speed;
	vertical_velocity += normalized_y * move_speed;
	
	show_debug_message(string(horizontal_velocity) + ", " + string(vertical_velocity));
}

if(floor(current_image_index) == 1){
	has_launched_self = false;
}


x += horizontal_velocity;
y += vertical_velocity;

horizontal_velocity = sign(horizontal_velocity) * (max(0, abs(horizontal_velocity) - velocity_fade_rate));
vertical_velocity = sign(vertical_velocity) * (max(0, abs(vertical_velocity) - velocity_fade_rate));


if(horizontal_velocity != 0){
	image_xscale = -sign(horizontal_velocity) * abs(image_xscale);
}