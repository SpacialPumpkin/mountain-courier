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

var delta_x = target_x - x;
var move_x = sign(delta_x) * min((abs(delta_x)), move_speed);

var delta_y = target_y - y;
var move_y = sign(delta_y) * min((abs(delta_y)), move_speed);

x += move_x;
y += move_y;

if(move_x != 0){
	image_xscale = sign(move_x);
}