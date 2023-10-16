var _x, _w;
_x = view_xport[0];
_w = view_wport[0];

for(var i=0;i<array_length(room_instance);i++){
	draw_text(_x+_w/2,32*i,room_instance[i]);
}