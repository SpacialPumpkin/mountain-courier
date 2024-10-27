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
		if(i == 3)
		{
			instance_create_depth(x, y + 1400, 600, obj_cloud);
		}
		if(i == 4)
		{
			instance_create_depth(x, y + 2100, 600, obj_cloud);
		}
		if(i == 5)
		{
			instance_create_depth(x, y + 2800, 600, obj_cloud);
		}
		if(i == 6)
		{
			instance_create_depth(x, y + 3500, 600, obj_cloud);
		}
		if(i == 7)
		{
			instance_create_depth(x, y + 4200, 600, obj_cloud);
		}
		if(i == 8)
		{
			instance_create_depth(x, y + 4900, 600, obj_cloud);
		}
		if(i == 9)
		{
			instance_create_depth(x, y + 5800, 600, obj_cloud);
		}
	}
alarm[0] = 100;