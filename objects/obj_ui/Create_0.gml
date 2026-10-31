// Inicialização de variáveis de controle global
global.game_over = false;

// O 'if' garante que, se a variável já existir, o jogo NÃO vai zerá-la ao mudar de sala
if (!variable_global_exists("coins")) {
    global.coins = 0;
    global.coins_coletadas = [];
    global.vida = 5;
}