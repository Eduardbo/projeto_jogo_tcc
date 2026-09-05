player_state_dead = function() {
    // Zera a velocidade para o player não ficar deslizando
    hspd = 0; 
    
   if(place_meeting(x,y+1, obj_wall)){
	  vspd += 0.3;   
   }
    
    // Muda para a sprite de morte 
    sprite_index = spr_cat_die; 
    
    // Verifica se a animação de morte chegou no último frame
    if (image_index >= image_number - 1) {
        
        image_speed = 0; 
        
        room_restart(); // Reinicia a fase
        // ou room_goto(rm_gameover); // Vai para uma tela de Game Over
    }
}