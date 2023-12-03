// Movement
spd_min = 0;
spd_max = 0;
hspd = 0;
vspd = 0;
// Spawn
spawn_cooldown_v = 0;
spawn_cooldown = spawn_cooldown_v;
// Attacking
attack_distance = 0;

// State Machine
enum ENTITY_STATE {
	IDLE,
	FIND_TARGET,
	FOLLOW_TARGET,
	ATTACKING
}
state = ENTITY_STATE.IDLE;
state_array[ENTITY_STATE.IDLE] = entity_idle_state;
state_array[ENTITY_STATE.FOLLOW_TARGET] = entity_moving_state;