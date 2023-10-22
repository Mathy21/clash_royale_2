draw_self();

draw_set_halign(1);
draw_text(x,y+sprite_height/2,target);
draw_text(x,y-sprite_height/2,state);
draw_set_halign(-1);

draw_text(x+sprite_width*2,y,vspd);
draw_text(x-sprite_width*2,y,hspd);

