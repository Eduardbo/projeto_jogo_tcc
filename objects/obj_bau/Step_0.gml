// 1. CHECAGEM DE INTERAÇÃO
// Verifica se o jogador existe e se está dentro do alcance
if (instance_exists(obj_player)) {
    var _dist = distance_to_object(obj_player);
    
    // Se o jogador estiver perto, não tiver aberto ainda e apertar "E"
    if (_dist <= interact_range && !is_opened) {
        
        // Exemplo de aviso visual na tela (pode ser um texto de "Pressione E")
        // No seu sistema de UI, você pode verificar se a distância é menor que o range
        
        if (keyboard_check_pressed(ord("E"))) {
            is_opened = true;
            image_speed = 1.0; // Inicia a animação de abertura do baú
        }
    }
}

// 2. PARAR NO ÚLTIMO FRAME E DAR O TESOURO
// Se a animação chegar ao último quadro, nós congelamos e liberamos a recompensa
if (is_opened && image_index >= image_number - 1) {
    image_speed = 0;              // Para a animação no frame do baú aberto
    image_index = image_number - 1; // Garante que fique no último frame
    
    // LIBERAR RECOMPENSA (Soma moedas apenas na transição exata de abertura)
    // Usamos uma variável de controle única para dar o prêmio uma única vez
    if (!variable_instance_exists(id, "reward_given")) {
        reward_given = true;
        
        // Soma 5 moedas ao contador global que criamos anteriormente
        global.coins += 5; 
        
        // (Opcional) Toca um som de baú abrindo ou moedas
        // audio_play_sound(snd_chest_open, 1, false);
        

        }
    }
