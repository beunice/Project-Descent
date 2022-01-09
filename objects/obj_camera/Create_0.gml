camera = camera_create();

var view_mat = matrix_build_lookat(x, y, -10, x, y, 0, 0, 1, 0);
var proj_mat = matrix_build_projection_ortho(1366, 768, 3, 30000);

camera_set_view_mat(camera, view_mat);
camera_set_proj_mat(camera, proj_mat);

view_camera[0] = camera;

follow = obj_player;
xTo = x;
yTo = y;