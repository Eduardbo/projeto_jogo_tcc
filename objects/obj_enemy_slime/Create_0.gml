// Inherit the parent event
event_inherited();

move_spd = 3;
move_dir = 3;

state_walker = function(){
	sprite_index =spr_walker_slime;
	
	
	var _ground = place_meeting(x,y+1,obj_wall);
	
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
	
}

state = state_walker

