var _col = instance_place(x,y,par_entity);
if(_col){
	instance_destroy(_col,false);	
}
if(target != -1 && !instance_exists(target)){
		target = -1;
}