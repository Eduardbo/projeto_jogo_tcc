function player_dash(){
	
	// Criar o efeito de tremor ao iniciar o dash
    shake = instance_create_layer(x, y, "Player", obj_shake);
    shake.shake = shake_dash; // Ajuste a intensidade conforme necessário
	
	hspd = lengthdir_x(spp_dash,dir_dash);
	vspd = lengthdir_y(spp_dash,dir_dash);

	//trail effect 
	with (instance_create_depth(x,y,depth+1,obj_trail))
		{	
			sprite_index = other.sprite_index;
			image_blend = c_gray;
			image_alpha = 0.5;
		}


energy_dash-=spp_dash;

	//ending dash
	
	if( energy_dash <= 0 )
		{	
		    hspd = 0;
		    vspd = 0;
			state = player_state_free;
		} 
	
	
}