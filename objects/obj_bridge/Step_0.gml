var _col = instance_place(x,y,par_entity);
if(_col && _col.pass_bridge == false){
	with(_col){
		pass_bridge = true;
		for(var i=0;i<array_length(room_instance);i++){
			if(room_instance[i] == id){
				array_delete(room_instance,i,1);	
			}
		}
	}
}