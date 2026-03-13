function player_state_free(){
	
	#region Controles;
	 //TECLAS PARA OS MOVIMENTOS
	 var _key_right = keyboard_check(ord("D"));			//DIREITA
	 var _key_left = keyboard_check(ord("A"));			//ESQUERDA
	 var _key_jump = keyboard_check_pressed(vk_space);	//PULO
	 var _key_jump_hold = keyboard_check(vk_space)        //PULO SEGURANDO
	 
		 var _key_up = keyboard_check(ord("W"));
		 var _key_down = keyboard_check(ord("S"));
		 var _key_dash = keyboard_check_pressed(vk_shift);
	
	 #endregion
	
	#region Movimentação
	var _move = _key_right - _key_left !=0;



	if(_move){
		sprite_index = spr_cat_run;
		move_dir = point_direction(0,0,_key_right - _key_left,0);
		move_spd = approach(move_spd,move_spd_max,acc);				//approach -> aproxima dois valores
	} else {
		sprite_index = spr_cat_idle;
		move_spd = approach(move_spd,0,dcc);
	}
		
	can_move = approach(can_move,0,.4)
	
	if(can_move <= 0){hspd = lengthdir_x(move_spd, move_dir)};
#endregion

	#region invertar o stripe para correr para o outro lado
	if(hspd != 0){
		x_scale = sign(hspd);	
	}
	#endregion
	
	#region Pulo e Walljuimper
	//PULO e WallJumper
	var _ground = place_meeting(x,y+1,obj_wall);					//Variavel que armazena se estou colindo no chao
	var _wall = place_meeting(x+1,y,obj_wall) || place_meeting(x-1,y,obj_wall);
	

	if(_ground){
		jumpe=false;
		coyote_time = coyote_time_max;
		 dash = true;								//CONDIÇÃO PARA AREALIZAR O DASH
		 jump_count = jump_max;						//CONDIÇÃO PARA RESETAR O NÚMERO DE PULOS
	} else {
		coyote_time--;
		if(vspd < 0){
			sprite_index = spr_cat_jump; 
		} else {
			sprite_index = spr_cat_fall;
		}
}
	//limitando a altura do pulo
	if(!_key_jump_hold and vspd < 0 and jump){
			//limitando a velocidade vertical
			vspd = max(vspd,-jump_height / 2.3);
		}

	//GameDesing coyote Time
	if(_key_jump and coyote_time > 0) || (_key_jump and jump_count > 0) {
		jump_count--;
		coyote_time = 0;
		vspd=0;
		vspd-=jump_height;
		jumpe=true
	}

	if(_wall and !_ground){								//Quando estiver na parede e nao no chao
		if(vspd > 1){
			 jump_count = jump_max;						//CONDIÇÃO PARA RESETAR O NÚMERO DE PULOS
			sprite_index = spr_cat_wallJump;
			vspd = 1			
		}
		if(_key_jump){
			coyote_time = 0;
			vspd = 0;
			vspd-=jump_height;
			can_move=5;
			hspd-=3 * x_scale;
		}
	}
#endregion

	#region	colidindo com o inimigo
	
	//MACHIMELO MEDONHO
	 if(!_ground and vspd > 0){
		var _collision_e = instance_place(x,y+1,obj_enemy_mushroom); //Pular apenas no coguemlo
		if(_collision_e){
			vspd=0
			jumpe=false;
			vspd-=jump_height;
			instance_destroy(_collision_e);
		}	
	}
	
#endregion

	#region Levando Dano
		
		var _collision_e_parent = instance_place(x+hspd,y,obj_enemy_parent); //Verificando a colissao com todos os obj inimigos
		if(_collision_e_parent){
			hspd = 0;
			vspd = 0;
			vspd-=4;
			damage_dir = point_direction(_collision_e_parent.x,_collision_e_parent.y,x,y);
			state = player_state_damage;
		}	

	//Estado de Damage no meu obj jogador
	player_state_damage = function(){
		sprite_index = spr_cat_damage;
		hspd=lengthdir_x(4,damage_dir);
		damage_time = approach(damage_time,damage_distance,1);
		
		if(damage_time >= damage_distance){
			hspd = 0;
			damage_time = 0;
			
		// Criar o efeito de tremor ao iniciar o dash
			var shake = instance_create_layer(x, y, "Player", obj_shake);
			shake.shake = shake_damage; // Ajuste a intensidade conforme necessário
			
			state = player_state_free;
		}
	}
#endregion

	#region Dash e Efeitos;
		 if (alarm[0] > 0){ 
			 
			if (image_alpha >= 1 ){
				alfa_hit = -0.05;
			} else if (image_alpha <= 0) {
				alfa_hit = 0.05;
			}
		
			image_alpha += alfa_hit;
	 
		 } else {
			image_alpha = 1;
		 }
	 
	 //DASH
	 if (dash &&_key_dash){
			dash = false;
			sprite_index = spr_cat_dash;
			dir_dash = point_direction(0,0, _key_right-_key_left,_key_down-_key_up);
			spp_dash = dist_dash / time_dash;
			energy_dash = dist_dash;
			
			//Tocar som dash
			audio_play_sound(snd_dash, 1, false);
			
			state = player_dash;
	 }
		 
	#endregion
	
}