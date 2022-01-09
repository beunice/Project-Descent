event_inherited()
accR = keyboard_check(vk_right);
accL = keyboard_check(vk_left);
accU = keyboard_check(vk_up);
accD = keyboard_check(vk_down);
levelreset = keyboard_check(ord("R"));
//Define mass in kg.
mass = 1;
//Define direction of x and y forces.
dx = (accR - accL)
dy = (accU - accD)

//Turn on physics engine. Always run physics engine after you set up your variables.
//This includes mass, dx, dy, etc.
physics = true;

if (levelreset){
	x = xstart;
	y = ystart;
	i = 0;
	j = 0;
}