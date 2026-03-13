repeat(abs(hspd)){									//abs -> garante que o núm. seja positivo
	
	//LÓGICA DO SLOPE
	if(place_meeting(x+sign(hspd),y,obj_wall)){
		if(!place_meeting(x+sign(hspd),y-1,obj_wall)){
			y--;
		} 
	}else{
		if(!place_meeting(x+sign(hspd),y+1,obj_wall)){
			if(place_meeting(x+sign(hspd),y+2,obj_wall)){
				y++;		
			}
		}
	}
	
	if(place_meeting(x+sign(hspd),y,obj_wall)){       //sign -> Retorna os valores em (-1, 0 , 1) 
		hspd = 0;
		break;
	} else {
		x+=sign(hspd)
	}
}

repeat(abs(vspd)){									
	if(place_meeting(x,y+sign(vspd),obj_wall)){       
		hspd = 0;
		break;
	} else {
		y+=sign(vspd)
	}
}