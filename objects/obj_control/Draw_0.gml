draw_text(x+70,y+70,"Is Game:"+string(is_game));
for(var i=0;i<array_length(enemy_tower);i++)
	draw_text(x+room_width/2,y+32*i,enemy_tower[i]);