// Inherit the parent event
event_inherited();

move_spd = 1;
move_dir = 1;

state_walker = function(){
	sprite_index = spr_goblin_run;
	
	
	var _ground = place_meeting(x,y+1,obj_wall);
	var _attack = place_meeting(x,y+1,obj_player)
	
	if(_ground){
		hspd = move_dir * move_spd;
		 if(hspd != 0){
				x_scale = sign(hspd);
			} 
	}
	
	
	if (place_meeting(x+hspd,y,obj_wall)){
		move_dir *= -1;
	}
	
	if(!position_meeting(x+(15*move_dir),y+1,obj_wall)){
		move_dir *= -1;
	}
	
	if (_attack){
		state = state_atack;
	}
}

state_atack = function(){
	hspd = 0;
	sprite_index= spr_goblin_attk;
}

state = state_walker

