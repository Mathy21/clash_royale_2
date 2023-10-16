if(!instance_exists(target) && target != -1 && target != noone){
		target = -1;
}

var _col = instance_place(x,y,par_entity);
if(_col){
	instance_destroy(_col,false);	
}
if(target != -1 && !instance_exists(target)){
		target = -1;
}