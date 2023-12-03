function entity_idle_state(){
	hspd = 0;
	vspd = 0;
	if(spawn_cooldown > 0 && obj_control.is_game){
		spawn_cooldown--;	
	}
		else if(spawn_cooldown <= 0 && obj_control.is_game){
			state = ENTITY_STATE.FIND_TARGET;
		}
}

function entity_find_target_state(){
	nearest_entity();
	if(target != -1 && target != noone){
		state = ENTITY_STATE.FOLLOW_TARGET	;	
	}
}

function entity_follow_target_state(){
	if(target != -1 && instance_exists(target)){
			var _dir = point_direction(x,y,target.x,target.y);
			hspd = lengthdir_x(spd,_dir);
			vspd = lengthdir_y(spd,_dir);
	}
		else{
			state = ENTITY_STATE.FIND_TARGET;
		}
		
		if(array_length(room_instance) <= 1 || room_instance[1] == undefined){
			obj_control.is_game = false;
			state = ENTITY_STATE.IDLE;	
		}
}
