vspd = move_dir * move_spd;


if(place_meeting(x,y+sign(vspd),obj_wall)){
	move_dir*=-1;
}

var _c = place_meeting(x,y+1,obj_player) or place_meeting(x,y-1,obj_player)

if(_c){
	with(obj_player){                            //Com a palabra reservada with, consigo criar código dentro de alguna coisa, nesse caso no nplayer
		y+=other.vspd;
	}	
}

y+=vspd;
