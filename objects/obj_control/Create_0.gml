// Main
is_game = true;
enemy_tower = [];
// Enemy Data
enemy_tower1_life = 0;
enemy_tower2_life = 0;
enemy_king_tower_life = 0;

// Player Data
player_tower1_life = 0;
player_tower2_life = 0;
player_king_tower_life = 0;


all_enemy_towers = function(){
		var _n = instance_number(par_tower);
		for(var i=0;i<_n;i++){
			var _tower = instance_find(par_tower,i);
			if(_tower.tower_type == 1){
				enemy_tower[i] = _tower;	
			}
		}
}