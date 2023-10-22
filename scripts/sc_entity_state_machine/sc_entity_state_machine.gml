function entity_idle_state(){
	hspd = 0;
	vspd = 0;
	if(spawn_cooldown > 0){
		spawn_cooldown--;	
	}
		else if(spawn_cooldown <= 0){
			state = ENTITY_STATE.FIND_TARGET;
		}
}

function entity_find_target_state(){
	nearest_entity();
	if(target != -1 && target != noone && target.distance <= range){
		state = ENTITY_STATE.FOLLOW_TARGET	;	
	}
		else{
			state = ENTITY_STATE.FOLLOW_TOWER
		}
}

function entity_follow_target_state(){
	nearest_entity();
	if(target != -1 && target != noone){
		var _dir = point_direction(x,y,target.x,target.y);
		hspd = lengthdir_x(spd,_dir);
		vspd = lengthdir_y(spd,_dir);
	}
	else{
		hspd = 0;
		vspd = 0;
		state = ENTITY_STATE.FOLLOW_TOWER;
	}
}

function entity_follow_tower_state(){
		
}

