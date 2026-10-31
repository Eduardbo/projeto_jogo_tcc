function player_state_free() {
    
    #region Controles
    var _key_right = keyboard_check(ord("D"));
    var _key_left = keyboard_check(ord("A"));
    var _key_jump = keyboard_check_pressed(vk_space) || keyboard_check_pressed(ord("W"));
    var _key_jump_hold = keyboard_check(vk_space);
    
    var _key_up = keyboard_check(ord("W"));
    var _key_down = keyboard_check(ord("S"));
    var _key_dash = keyboard_check_pressed(vk_shift);
    var _key_attack = keyboard_check_pressed(ord("F"));
    #endregion
    
    #region Movimentação
    var _move = _key_right - _key_left != 0;

    if (_move) {
        sprite_index = spr_cat_run;
        move_dir = point_direction(0, 0, _key_right - _key_left, 0);
        move_spd = approach(move_spd, move_spd_max, acc);
    } else {
        sprite_index = spr_cat_idle;
        move_spd = approach(move_spd, 0, dcc);
    }
        
    can_move = approach(can_move, 0, 0.4);
    
    if (can_move <= 0) {
        hspd = lengthdir_x(move_spd, move_dir);
    }
    #endregion

    #region Inverter o sprite para correr para o outro lado
    if (hspd != 0) {
        x_scale = sign(hspd);    
    }
    #endregion
    
    #region Pulo e Walljump
    var _ground = place_meeting(x, y + 1, obj_wall);
    var _wall = place_meeting(x + 1, y, obj_wall) || place_meeting(x - 1, y, obj_wall);
    
    if (_ground) {
        jumpe = false;
        coyote_time = coyote_time_max;
        dash = true;
        jump_count = jump_max;
    } else {
        coyote_time--;
        if (vspd < 0) {
            sprite_index = spr_cat_jump; 
        } else {
            sprite_index = spr_cat_fall;
        }
    }

    // Limitando a altura do pulo
    if (!_key_jump_hold && vspd < 0 && jumpe) {
        vspd = max(vspd, -jump_height / 2.3);
    }

    // Coyote Time
    if ((_key_jump && coyote_time > 0) || (_key_jump && jump_count > 0)) {
        jump_count--;
        coyote_time = 0;
        vspd = 0;
        vspd -= jump_height;
        jumpe = true;
    }

    // Walljump
    if (_wall && !_ground) {
        if (vspd > 1) {
            jump_count = jump_max;
            sprite_index = spr_cat_wallJump;
            vspd = 1;            
        }
        if (_key_jump) {
            coyote_time = 0;
            vspd = 0;
            vspd -= jump_height;
            can_move = 5;
            hspd -= 3 * x_scale;
        }
    }
    #endregion

    #region Queda do mapa
    if (y > room_height + 50) {
        global.vida -= 1;
		global.coins = global.coins_checkpoint; // Restaura as moedas para o valor de antes de cair
        room_restart();
    }    
    #endregion

    #region Colidindo com o inimigo (Cabeça)
    if (!_ground && vspd > 0) {
        var _collision_e = instance_place(x, y + 1, obj_enemy_);
        if (_collision_e) {
            vspd = 0;
            jumpe = false;
            vspd -= jump_height;
            instance_destroy(_collision_e);
        }    
    }
    #endregion

   #region Levando Dano
    var _inst_dano = noone; // Variável para guardar quem causou o dano

    // 1. Checa colisão com o inimigo na horizontal
    var _enemy = instance_place(x + hspd, y, obj_enemy_parent);
    if (_enemy) _inst_dano = _enemy;

    // 2. Checa colisão com a estaca (horizontal e vertical para quando cair em cima)
    var _estaca = instance_place(x + hspd, y + vspd, obj_estaca);
    if (_estaca) _inst_dano = _estaca;

    // 3. Se bateu em algo perigoso E não está piscando/invulnerável
    if (_inst_dano != noone && alarm[0] <= 0) { 
        global.vida -= 1; // Perde 1 coração
        hspd = 0;
        vspd = 0;
        vspd -= 4; // Pulinho de recuo (knockback vertical)
        
        // Empurra o jogador na direção contrária a quem causou o dano
        damage_dir = point_direction(_inst_dano.x, _inst_dano.y, x, y);
        
        alarm[0] = 120; // Tempo de invulnerabilidade
        
        state = player_state_damage; // Transição para o estado de dano
    }
    #endregion

    #region Dash e Efeitos Visuais
    if (alarm[0] > 0) { 
        if (image_alpha >= 1) {
            alfa_hit = -0.05;
        } else if (image_alpha <= 0) {
            alfa_hit = 0.05;
        }
        image_alpha += alfa_hit;
    } else {
        image_alpha = 1;
    }
     
    if (dash && _key_dash) {
        dash = false;
        sprite_index = spr_cat_dash;
        dir_dash = point_direction(0, 0, _key_right - _key_left, _key_down - _key_up);
        spp_dash = dist_dash / time_dash;
        energy_dash = dist_dash;
        
        audio_play_sound(snd_dash, 1, false);
        
        state = player_dash; // <- Transição para o estado de dash
    }
    #endregion
    
    #region Contador de vida e Morte
    if (global.vida <= 0) {
        state = player_state_dead;
    }
    #endregion
    
    #region Ataque
    if (_key_attack) {
        state = player_state_attack;
        image_index = 0;
    }
    #endregion

} // <--- FIM DA FUNÇÃO player_state_free

// FUNÇÃO DE ESTADO: DANO
function player_state_damage() {
    sprite_index = spr_cat_damage;
    hspd = lengthdir_x(4, damage_dir);
    damage_time = approach(damage_time, damage_distance, 1);
        
    if (damage_time >= damage_distance) {
        hspd = 0;
        damage_time = 0;
            
        // Criar o efeito de tremor
        var shake = instance_create_layer(x, y, "Player", obj_shake);
        shake.shake = shake_damage;
            
        state = player_state_free; // <- Volta para o estado livre
    }
}

