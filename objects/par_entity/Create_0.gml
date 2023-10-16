// Target
target = -1;
focus = -1;
type = 0	// 0 - Troop, 1 - Build
room_instance = [];
/// @method set_instance(id,distance)
set_instance = function(_instance,_distance) constructor{
		instance =  _instance;
		distance = _distance;
}
entity = noone;
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

///@method euclidian_distance(player_x,instance_x,player_y,instance_y)
euclidian_distance = function(_p_posx,_inst_posx,_p_posy,_inst_posy){
	var _calc = sqrt(sqr(_p_posx - _inst_posx) + sqr(_p_posy - _inst_posy));
	return _calc;
}

find_room_instances = function(){
	var _amount = instance_number(par_entity);
	var _player_x = x;
	var _player_y = y;
	for(var i=0;i<_amount;i++){
		var _id = instance_find(par_entity,i);
		var _posx,_posy;
		_posx = _id.x;
		_posy = _id.y;
		var _dist = euclidian_distance(_player_x,_posx,_player_y,_posy);
		entity = new set_instance(_id,_dist);
		room_instance[i] = entity;
	}
}

nearest_entity = function(){
		find_room_instances();

		for(var i=0; i<array_length(room_instance);i++){
			if(instance_exists(room_instance[i])){
				
				dist_array[i] = euclidian_distance(_player_x,_posx,_player_y,_posy);
			}
		}
		array_sort(dist_array,true);
		for(var j=0; j<array_length(dist_array);j++){
			if(dist_array[j] > 0){
				var _posx,_posy;
				_posx = room_instance[j].x;
				_posy = room_instance[j].y;
				if(dist_array[j] == euclidian_distance(_player_x,_posx,_player_y,_posy)){
					target = room_instance[j];
				}
			}
		}
}