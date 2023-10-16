target = -1;
main_col_list = ds_list_create();
nearest_dist = 0;
nearest_inst = -1;
new_dist = 0;

collision_system = function(){
	var _col_list = ds_list_create();
	var _col = instance_place_list(x,y,par_entity,_col_list,false);
	if(instance_exists(target)){
		for(var i=0; i<ds_list_size(_col_list);i++){
			var _id = _col_list[| i];
			if(ds_list_find_index(main_col_list,_id) == -1){
				ds_list_add(main_col_list,_id);	
			}
		}
		ds_list_destroy(_col_list);
		if(ds_list_size(main_col_list) > 0){
			for(var i=0;i<ds_list_size(main_col_list);i++){
					if(main_col_list[| i+1] != undefined && main_col_list[| i+1] != noone){
						var _id1 = main_col_list[| i];
						var _id2 = main_col_list[| i+1];
						var _dist1, _dist2;
						_dist1 = point_distance(target.x,target.y,_id1.x,_id1.y);
						_dist2 = point_distance(target.x,target.y,_id2.x,_id2.y);
						var _calc = _dist1-_dist2;
						if(_calc > 0){
							if(i > 0){
								var _calc_dist = nearest_dist - _dist2;
								if(_calc_dist > 0){
									nearest_dist = _dist2;
									nearest_inst = _id2;	
								}
							}
								else{
									nearest_dist = _dist2;
									nearest_inst = _id2;	
								}
						}
						if(_calc < 0){
							if(i > 0){
								var _calc_dist = nearest_dist - _dist1;
								if(_calc_dist > 0){
									nearest_dist = _dist1;	
									nearest_inst = _id1;	
								}
							}
							else{
								nearest_dist = _dist1;	
								nearest_inst = _id1;	
							}
						}
						if(_calc == 0){
							nearest_inst = choose(_id1,_id2);
							nearest_dist = point_distance(target.x,target.y,nearest_inst.x,nearest_inst.y);
						}
					}
			}
			if(nearest_inst != noone && nearest_inst != -1 && nearest_inst != undefined){
					target.target = nearest_inst;
			}
		}
	}
}