current_x = x;
current_y = y;

new_x = lerp(current_x, target_x, lerp_amount);
new_y = lerp(current_y, target_y, lerp_amount);

//if breaches starting position
if( current_x >= end_x - safety_offset )
{
	target_x = start_x;
	target_y = start_y;
}
//otherwise if it breaches the ending position
else if ( current_x <= start_x + safety_offset )
{
	target_x = end_x;
	target_y = end_y;
}

x = new_x;
y = new_y;