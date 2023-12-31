// Main
value = 0;
type = 2;
index = -1;
tower_id = -1;
king_tower = noone;
tower_type = 0; // 0 - Player, 1 - Enemy
// target
range = 0;
can_fire = false;
// Image
idle_spr = noone;
attacking_spr = noone;
// Combat
projectile = noone;
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
