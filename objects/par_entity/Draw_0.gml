draw_self();

draw_set_halign(1);
draw_text(x,y+sprite_height/2,target);
draw_text(x,y-sprite_height,state);
draw_text(x+sprite_width,y-sprite_height,pass_bridge);
draw_set_halign(-1);

draw_text(x+sprite_width*2,y,vspd);
draw_text(x-sprite_width*2,y,hspd);

for(var i=0; i<instance_number(par_tower);i++){
	draw_line_color(x,y,instance_find(par_tower,i).x,instance_find(par_tower,i).y,c_blue,c_blue);	
}
