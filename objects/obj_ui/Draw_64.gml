// 1. Desenha os corações dinamicamente com base na vida
var _max_vidas = 5;
var _espacamento = 10; // Distância em pixels entre um coração e outro
var _pos_x = 15;       // Posição inicial X na tela
var _pos_y = 17;       // Posição Y na tela

for (var i = 0; i < _max_vidas; i++) {
    // Se o índice atual for menor que a vida global, desenha o vermelho, senão o cinza
    var _sprite_atual = (i < global.vida) ? spr_coracao_vermelho : spr_coracao_cinza;
    
    // Desenha cada coração empurrando para a direita com base no loop (i * _espacamento)
    draw_sprite(_sprite_atual, 0, _pos_x + (i * _espacamento), _pos_y);
}

// 2. Desenha o número da vida logo após a barra de corações
draw_set_halign(fa_left); // Alinhado à esquerda para ficar legal após os corações
draw_set_valign(fa_center);
draw_set_font(fnt_ui);

// Posicionamos o texto logo depois do último coração (5 corações * 20px = 100px + margem)
//draw_text(_pos_x + 110, _pos_y, string(global.vida));

// 3. Reseta as configurações de desenho do GameMaker
draw_set_halign(-1);
draw_set_valign(-1);
draw_set_font(-1);