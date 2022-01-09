/// @description Insert description here
event_inherited()

left = keyboard_check(ord("A"));
right = keyboard_check(ord("D"));
up = keyboard_check(ord("W"));
down = keyboard_check(ord("S"));

mass = 65;
dx = (right - left)
dy = 0
xforce = 650;
yforce = 0;

physics = true;
gsim = true;
fsim = true;