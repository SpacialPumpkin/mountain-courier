for(i = 0; i < cloudsQuantity; i++)
	{
		if(i == 0)
		{
			instance_create_depth(x, y, 600, obj_cloud);
		}
		if(i == 1)
		{
			instance_create_depth(x, y - 700, 600, obj_cloud);
		}
		if(i == 2)
		{
			instance_create_depth(x, y + 700, 600, obj_cloud);
		}
	}
alarm[0] = 200;