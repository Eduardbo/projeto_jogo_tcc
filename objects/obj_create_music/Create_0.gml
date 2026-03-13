//verificar se a música já tocando para evitar sobreposicação
if (!audio_is_playing(snd_room1)){
	audio_play_sound(snd_room1,10,true);	
}