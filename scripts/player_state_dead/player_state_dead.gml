// Script: player_state_dead
function player_state_dead() {
    // 1. Zera a velocidade para o player não ficar deslizando
    hspd = 0; 
    
    // 2. Aplica gravidade se NÃO estiver no chão
    if (!place_meeting(x, y + 1, obj_wall)) {
        vspd += 0.3;   
    } else {
        vspd = 0;
    }
    
    // 3. Muda para a sprite de morte 
    sprite_index = spr_cat_die; 
    
    // 4. Verifica se a animação de morte chegou no último frame
    if (image_index >= image_number - 1) {
        
        image_speed = 0; // Congela o gato no chão no último frame da animação
        
        // Ativa a tela de Game Over do seu obj_ui
        global.game_over = true; 
    }
}