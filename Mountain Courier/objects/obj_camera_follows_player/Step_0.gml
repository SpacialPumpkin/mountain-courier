current_x = x;
current_y = y;

player_x = obj_player.x
player_y = obj_player.y

new_x = lerp(current_x, player_x, lerpAmount);
new_y = lerp(current_y, player_y, lerpAmount);

x = new_x;
y = new_y;