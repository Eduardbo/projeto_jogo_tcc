function player_state_attack() {
    hspd = 0; 
    sprite_index = spr_cat_attack; 
    
    // 1. Checa a colisão e o dano no frame exato do golpe
    if (floor(image_index) == 2) {
        var _x1 = x;
        var _x2 = x + (30 * x_scale); 
        var _y1 = y - 15;
        var _y2 = y + 15;
        
        var _inimigo_atingido = collision_rectangle(_x1, _y1, _x2, _y2, obj_enemy_parent, false, true);
        
        if (_inimigo_atingido != noone) {
            with (_inimigo_atingido) {
                hp -= 1;
                vspd = -3; 
                damage_dir = point_direction(other.x, other.y, x, y); 
                damage_time = 0; 
                state = state_damage;
            }
        }
    } 
    
    // 2. Verifica se a animação acabou 
    if (image_index >= image_number - 1) {
        state = player_state_free;
    }
}