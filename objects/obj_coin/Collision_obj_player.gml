// Evento Collision -> obj_player (no obj_coin)

// 1. Registra esta moeda na lista para não reaparecer após room_restart()
array_push(global.coins_coletadas, coin_id);

// 2. Soma +1 no contador global de moedas
global.coins += 1;

// 3. Toca o efeito sonoro
// audio_play_sound(snd_coin, 1, false);

// 4. Destrói a moeda coletada
instance_destroy();