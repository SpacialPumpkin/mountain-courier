if(is_ready){
	other.horizontal_launch_speed += horizontal_launch_speed;
	other.vertical_launch_speed += vertical_launch_speed;
	image_blend = make_colour_hsv(50, 50, 50);
}
is_ready = false;