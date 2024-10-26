if(is_on_ground){
	if( abs(move_x) > 3 )
	{
		sprite_index = spr_player_new_run;
	}
	else
	{
		sprite_index = spr_player_new_idle;
	}
}
else
{
	sprite_index = spr_player_new_flap;
}