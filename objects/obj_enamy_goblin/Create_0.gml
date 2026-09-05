// Inherit the parent event
event_inherited();

hp = 6;

// Variáveis de Dano/Knockback 
damage_dir = 0;
damage_time = 0;
damage_distance = 15; 

move_spd = 1;
chase_spd = 2; // Velocidade maior para quando estiver correndo atrás do player
move_dir = 1;

dist_visao = 40;  // Distância para ver o player e começar a correr
dist_ataque = 15; // Distância para encostar e bater no player

can_hit = true;    // Pode bater

state_walker = function(){
	sprite_index = spr_goblin_run;
	
	var _ground = place_meeting(x, y+1, obj_wall);
	
	if(_ground){
		hspd = move_dir * move_spd;
		if(hspd != 0){
			x_scale = sign(hspd);
		} 
	}
	
	// Patrulha: Inverte ao bater na parede ou chegar na beirada
	if (place_meeting(x+hspd, y, obj_wall) || !position_meeting(x+(15*move_dir), y+1, obj_wall)){
		move_dir *= -1;
	}
	
	// CHECAGEM DE VISÃO
	if (instance_exists(obj_player)) {
		var _dist = distance_to_object(obj_player);
		
		// Se o jogador entrar na área de visão, muda para o estado de perseguição
		if (_dist <= dist_visao) {
			state = state_chase;
		}
	}
}

// Corre até o player
state_chase = function(){
	sprite_index = spr_goblin_run; 
	
	if (instance_exists(obj_player)) {
		var _dist = distance_to_object(obj_player);
		
		// Descobre para qual lado o player está e vira para ele
		move_dir = sign(obj_player.x - x);
		if (move_dir == 0) move_dir = 1; // Evita bugar se estiverem na mesma coordenada exata
		
		// Corre na direção do player
		hspd = move_dir * chase_spd;
		x_scale = sign(hspd);
		
		// Se chegou perto o suficiente para bater, ataca
		if (_dist <= dist_ataque) {
			state = state_atack;
		} 
		// Se o player fugiu e saiu do raio de 40 pixels, volta a patrulhar
		else if (_dist > dist_visao) {
			state = state_walker;
		}
	} else {
		state = state_walker;
	}
}

state_atack = function(){
	hspd = 0; // Para de andar para bater
	sprite_index = spr_goblin_attk;
	
	if (instance_exists(obj_player)) {
		var _dist = distance_to_object(obj_player);
		
		// 1. CHECA O DANO NO FRAME CERTO DA ANIMAÇÃO
		if (floor(image_index) == 3 && can_hit) {
			
			// Se o player estiver no alcance e não estiver invulnerável
			if (_dist <= dist_ataque + 5 && obj_player.alarm[0] <= 0) { 
				can_hit = false; 
				
				// Acessa o player para aplicar o dano e o knockback
				with (obj_player) {
					global.vida -= 1; // Atualizado para a sua variável de vida do player
					hspd = 0;
					vspd = -4; // Joga o player pra cima
					damage_dir = point_direction(other.x, other.y, x, y); 
					alarm[0] = 120; // Tempo de invencibilidade do player
					state = player_state_damage;
				}
			}
		}
		
		// 2. FIM DA ANIMAÇÃO DE ATAQUE
		if (image_index >= image_number - 1) {
			can_hit = true; 
			
			// Verifica se deve voltar a correr atrás do player
			if (_dist > dist_ataque) {
				state = state_chase;
			}
		}
		
	} else {
		state = state_walker;
	}
}

state_damage = function() {
	image_index = spr_goblin_take_damage;
    hspd = lengthdir_x(4, damage_dir);   // Aplica a velocidade do empurrão

    
    damage_time = approach(damage_time, damage_distance, 1);   // Conta o tempo do empurrão usando a sua função approach
    
    // Quando o empurrão acabar
    if (damage_time >= damage_distance) {
        hspd = 0;
        damage_time = 0;
        
        image_blend = c_white;	 // Volta a cor normal do inimigo
        
        if (hp <= 0) {
			sprite_index = spr_goblin_die;
            instance_destroy(); // Destrói o inimigo
        } else {
            state = state_chase; 
        }
    }
}

state = state_walker;