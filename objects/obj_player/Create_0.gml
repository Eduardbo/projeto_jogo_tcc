event_inherited();

can_move = 0;						//VARIAVEL QUE INFORMA SE POSSO ME MOVER OU NÃO 
//move_dir = 0;						// MOVER P. DIREITA
move_spd = 0;						// MOVER P. ESQUERDA
move_spd_max = 3.0					// VEL. MÁXIMA
acc = 1;							// ACELERAÇÃO
dcc = 0.3;							// Dessacel.

jumpe = false;
jump_height = 6;					// ALTURA DO PULO
jump_max = 2;
jump_count = jump_max;

coyote_time_max = 10;				//variaveis para o Game Desing do Coyote-Time
coyote_time = 0;

x_scale = 1;
y_scale = 1;

shake_dash = 2;						//Valor do skake de camera;
shake_damage = 3;

damage_dir = 0;						//Const que armazena a direcao do dano
damage_time = 0;
damage_distance = 20;

//variaveis do dash			
dash = false;					// Verifica se pode realizar o dash		
dist_dash = 90;				// Tamanho da distancia do dash
time_dash = 9; 
dir_dash = 0;
spp_dash = 0;
energy_dash = 0;

state = player_state_free;