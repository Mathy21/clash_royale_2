// Target
target = -1;
focus = -1;
type = 0	// 0 - Entity, 1 - Build
room_instance = [];
dist_array = [];
// Movement
spd = 1;
hspd = 0;
vspd = 0;
spawn_cooldown_v = 120;
spawn_cooldown = spawn_cooldown_v;
// State Machine
enum ENTITY_STATE{
	IDLE,
	FIND_TARGET,
	FOLLOW,
	ATK
}
state = ENTITY_STATE.IDLE;
state_array[ENTITY_STATE.IDLE] = entity_idle_state;
state_array[ENTITY_STATE.FIND_TARGET] = entity_find_target_state;
state_array[ENTITY_STATE.FOLLOW] = entity_follow_target_state;
find_room_instances = function(){
	var _amount = instance_number(par_entity);
	for(var i=0;i<_amount;i++){
		var _id = instance_find(par_entity,i);
			room_instance[i] = _id;
	}
}
///@method euclidian_distance(player_x,instance_x,player_y,instance_y)
euclidian_distance = function(_p_posx,_inst_posx,_p_posy,_inst_posy){
	var _calc = sqrt(sqr(_p_posx - _inst_posx) + sqr(_p_posy - _inst_posy));
	return _calc;
}

nearest_entity = function(){
		find_room_instances();
		var _player_x = x;
		var _player_y = y;
		for(var i=0; i<array_length(room_instance);i++){
			if(instance_exists(room_instance[i])){
				var _posx,_posy;
				_posx = room_instance[i].x;
				_posy = room_instance[i].y;
				dist_array[i] = euclidian_distance(_player_x,_posx,_player_y,_posy);
			}
		}
		array_sort(dist_array,true);
		for(var j=0; j<array_length(dist_array);j++){
				var _posx,_posy;
				_posx = room_instance[j].x;
				_posy = room_instance[j].y;
				if(dist_array[1] - euclidian_distance(_player_x,_posx,_player_y,_posy) == 0){
					target = room_instance[j];
			}
		}
}