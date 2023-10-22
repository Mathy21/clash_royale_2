// Main
value = 0;
// target
range = 0;
can_fire = false;
// Image
idle_spr = noone;
attacking_spr = noone;
// Combat
shoot_cooldown_v = 0;
shoot_cooldown = shoot_cooldown_v;

// State Machine
enum TOWER_STATE{
	IDLE,
	ATTACKING
}
state = TOWER_STATE.IDLE;
state_array[TOWER_STATE.IDLE] = tower_idle_state;
state_array[TOWER_STATE.ATTACKING] = tower_attacking_state;