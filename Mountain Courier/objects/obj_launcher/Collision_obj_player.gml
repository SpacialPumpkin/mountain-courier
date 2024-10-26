if(is_ready){
	other.horizontal_velocity += horizontal_launch_speed;
	other.downward_acceleration -= vertical_launch_speed;
	image_blend = make_colour_hsv(50, 50, 50);
}
is_ready = false;