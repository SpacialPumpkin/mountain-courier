x = x - move_speed;

if(x < -1000) //garbage collection
{
	instance_destroy();
}