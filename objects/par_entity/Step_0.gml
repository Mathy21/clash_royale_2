var _col = instance_place(x,y,par_entity);
if(_col && _col.type != 3){
	instance_destroy(_col,false);	
}
	else if(_col && _col.type == 3){
		pass_bridge = true;		
	}
if(target != -1 && !instance_exists(target)){
		target = -1;
}

if(mouse_check_button_pressed(mb_right)){
	pass_bridge = false;	
}