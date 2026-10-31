image_speed = .2;

// 1. Garante que a lista exista na memória ANTES de tentar ler (evita o erro de ordem)
if (!variable_global_exists("coins_coletadas")) {
    global.coins_coletadas = [];
}

// 2. Gera a identificação única para esta moeda
coin_id = room_get_name(room) + "_" + string(x) + "_" + string(y);

// 3. Se ela já foi coletada, destrói imediatamente
if (array_contains(global.coins_coletadas, coin_id)) {
	image_index = spr_effect_coin;
    instance_destroy();
}