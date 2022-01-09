x += (xTo - x)/20;
y += (yTo - y)/20;

if (follow != noone) {
	xTo = follow.x;
	yTo = follow.y;
}

var view_mat = matrix_build_lookat(x, y, -10, x, y, 0, 0, 1, 0);
camera_set_view_mat(camera, view_mat);