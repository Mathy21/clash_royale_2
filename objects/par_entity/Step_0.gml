var _col = instance_place(x,y,par_entity);
if(_col && _col.type != 2){
	instance_destroy(_col,false);	
}
	else if(_col && _col.type == 2){
		pass_bridge = true;
	}
if(target != -1 && !instance_exists(target)){
		target = -1;
}