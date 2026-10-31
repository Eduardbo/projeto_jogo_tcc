// ==========================================
// CONFIGURAÇÕES GERAIS DA HUD
// ==========================================

global.coins_checkpoint = global.coins; // Guarda as moedas salvas no início da sala

// Configurações dos Corações
var _max_vidas = 5;
var _espacamento_coracoes = 10; // Espaço horizontal entre corações
var _coracoes_pos_x = 15;
var _coracoes_pos_y = 17;

// Configurações das Moedas
var _coin_pos_x = 15;
var _coin_pos_y = 35; // Abaixo da linha dos corações
var _coin_offset_texto = 15; // Distância entre a moeda e a contagem


// ==========================================
// 1. DESENHO DOS CO	RAÇÕES
// ==========================================
for (var i = 0; i < _max_vidas; i++) {
    // Escolhe o sprite vermelho se a vida atual for maior que o índice do loop
    var _sprite_atual = (i < global.vida) ? spr_coracao_vermelho : spr_coracao_cinza;
    
    // Desenha cada coração espaçado
    draw_sprite(_sprite_atual, 0, _coracoes_pos_x + (i * _espacamento_coracoes), _coracoes_pos_y);
}


// ==========================================
// 2. DESENHO DAS MOEDAS
// ==========================================

// Configurações de alinhamento e fonte antes do texto
draw_set_font(fnt_ui);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);

// Desenha a moeda
draw_sprite(spr_coin, 0, _coin_pos_x, _coin_pos_y);

// Desenha o texto com a quantidade de moedas acumuladas
draw_text(_coin_pos_x + _coin_offset_texto, _coin_pos_y, string(global.coins));

// ==========================================
// TELA DE GAME OVER E BOTÃO RESTART
// ==========================================
if (global.game_over) {
    // Pega o tamanho exato da tela
    var _gui_w = display_get_gui_width();
    var _gui_h = display_get_gui_height();
    var _center_x = _gui_w / 2;
    var _center_y = _gui_h / 2;

    // 1. Desenha o fundo escuro transparente
    draw_set_color(c_black);
    draw_set_alpha(0.75); // 75% de opacidade
    draw_rectangle(0, 0, _gui_w, _gui_h, false);
    draw_set_alpha(1.0);  // Reseta a opacidade para o texto não ficar transparente

    // 2. Configura a fonte e alinhamento para o centro
    // draw_set_font(fnt_sua_fonte); // Descomente se tiver uma fonte específica
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);

    // 3. Desenha o texto principal
    draw_set_color(c_red);
    draw_text_transformed(_center_x, _center_y - 30, "GAME OVER", 2, 2, 0);

    // 4. Desenha o texto de instrução (Botão)
    draw_set_color(c_white);
    draw_text(_center_x, _center_y + 20, "Pressione [R] para Reiniciar");

    // 5. Lógica do botão de Restart
    if (keyboard_check_pressed(ord("R"))) {
        global.vida = 5;               // Restaura a vida
        global.game_over = false;      // Tira a tela de game over
        room_restart();                // Recarrega o mapa do zero
    }
}

// ==========================================
// 3. RESET DE ESTADOS DE DESENHO (PADRÃO GM)
// ==========================================
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(-1);