if(instance_exists(global.view_target)){
	//posso seguir o target
	x_to = global.view_target.x - VIEW_WIDTH / 2;
	y_to = global.view_target.y - VIEW_HEIGHT / 2;
	
	x_to = clamp(x_to,0,room_width - VIEW_WIDTH);
	y_to = clamp(y_to,0,room_height - VIEW_HEIGHT);
	
	var _c_x = camera_get_view_x(view_camera[VIEW])
	var _c_y = camera_get_view_y(view_camera[VIEW])
	
	var _n_x = lerp(_c_x,x_to,VIEW_SPD)
	var _n_y = lerp(_c_y,y_to,VIEW_SPD)

	camera_set_view_pos(view_camera[VIEW],_n_x,_n_y)
}