event_inherited()
key_left = keyboard_check(ord("A"));
key_right = keyboard_check(ord("D"));
key_jump = keyboard_check(vk_space);
key_sprint = keyboard_check(vk_shift);
key_reset = keyboard_check(ord("R"))
jumpstate = false;

if (key_jump) && place_meeting(x,y+1, obj_invisiblewall){
	jumpstate = true;
}

dx = key_right - key_left;
dy = jumpstate;
xforce = 2.5;

yforce = 16;
cf = 3.5;

if (key_reset){
	x = xstart;
	y = ystart;
	i = 0;
	j = 0;
}

if (key_sprint){
	xforce = 2.9;
} else {
	xforce = 2.5;
}

//multiply 2.1 by number of frames to accelerate for. currently 4 frames.
if (abs(i) >= 8.4) && (key_sprint = false) {
	xforce = 2.1;
} else if (abs(i) >= 16.8) && (key_sprint = true) {
	xforce = 2.1;
}

physics = true;
fsim = true;
gsim = true;

//Player sprites.
if (i == 0) && (j = 0) {
	sprite_index = spr_player;
} else {
	sprite_index = spr_playerwalk;
}

if (i != 0){
	image_xscale = sign(i);
}

if (j != 0){
	sprite_index = spr_playerjump;
}