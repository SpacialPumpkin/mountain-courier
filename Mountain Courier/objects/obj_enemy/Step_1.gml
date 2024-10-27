if(is_on_ground){
	if( abs(move_x) > 3 )
	{
		sprite_index = spr_enemy_run;
	}
	else
	{
		sprite_index = spr_enemy_idle;
	}
}
else
{
	sprite_index = spr_enemy_jump;
}