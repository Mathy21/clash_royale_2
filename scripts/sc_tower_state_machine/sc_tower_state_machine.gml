function tower_idle_state(){
	animation_start(idle_spr);
}

function tower_attacking_state(){
	if(shoot_cooldown > 0){
		shoot_cooldown--;	
	}
	if(shoot_cooldown <= 0){
		instance_create_layer(x,y,"Instances",projectile);
		shoot_cooldown = shoot_cooldown_v;
	}
}