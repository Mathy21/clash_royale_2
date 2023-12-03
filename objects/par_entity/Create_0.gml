// Main
life = 0;
// Target
target = -1;
target_dis = 0;
focus = -1;
type_target = 0;	// 0 - all, 1 - build, 2 - none
type = 0	// 0 - Troop, 1 - Build, 2 - Main
room_instance = [];
range = 150;
jump_bridge = false;
pass_bridge = false;
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
	FOLLOW_TARGET,
	FOLLOW_MAIN,
	ATK
}
state = ENTITY_STATE.IDLE;
state_array[ENTITY_STATE.IDLE] = entity_idle_state;
state_array[ENTITY_STATE.FIND_TARGET] = entity_find_target_state;
state_array[ENTITY_STATE.FOLLOW_TARGET] = entity_follow_target_state;
state_array[ENTITY_STATE.FOLLOW_MAIN] = entity_follow_main_state;

///@method euclidian_distance(player_x,instance_x,player_y,instance_y)
euclidian_distance = function(_p_posx,_inst_posx,_p_posy,_inst_posy){
	var _calc = sqrt(sqr(_p_posx - _inst_posx) + sqr(_p_posy - _inst_posy));
	return _calc;
}

///@method array_clear(array)
array_clear = function(_array){
	for(var i=0;i<array_length(_array);i++){
		array_delete(_array,i,1);	
	}
}
///@method find_room_instances(instance)
find_room_instances = function(_instance){
	var _amount = instance_number(_instance);
	var _player_x = x;
	var _player_y = y;
	for(var i=0;i<_amount;i++){
		var _id = instance_find(_instance,i);
		if(_id.type != 3){
		var _posx,_posy;
		_posx = _id.x;
		_posy = _id.y;
		var _dist = euclidian_distance(_player_x,_posx,_player_y,_posy);
		entity = new set_instance(_id,_dist);
			room_instance[i] = entity;
		}
			else if(_id.type == 3 && !pass_bridge){
				var _posx,_posy;
				_posx = _id.x;
				_posy = _id.y;
				var _dist = euclidian_distance(_player_x,_posx,_player_y,_posy);
				entity = new set_instance(_id,_dist);
					room_instance[i] = entity;
			}
	}
		var _f = function(_ent1,_ent2){
			return _ent1.distance - _ent2.distance;	
		}
		array_sort(room_instance,_f);
}

///@method nearest_entity(instance)
nearest_entity = function(){
		find_room_instances(par_entity);
		for(var i=0; i<array_length(room_instance);i++){
			var _inst = room_instance[i].instance;
			var _dist = room_instance[i].distance;
			if(instance_exists(_inst) &&  _inst != id && _dist <= range){
					target = _inst
					target_dis = _dist;
					break;
			}
				else if( instance_exists(_inst) && _inst.type == 2 && _inst != id){
					target = _inst;
					target_dis = _dist;
					break;
				}
				if(!instance_exists(_inst)){
					array_delete(room_instance,i,1);	
				}
		}
}

damage_system = function(_damage){
	if(_damage > 0 && life > 0){
		life -= _damage;	
	}
	if(life <= 0){
		instance_destroy();	
	}
}