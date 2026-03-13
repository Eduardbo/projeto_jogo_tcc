shake = lerp(shake, 0, .1); // Reduz o shake suavemente

var _x = random_range(-shake, shake);
var _y = random_range(-shake, shake);

var _cam = view_get_camera(0); // Obtém a câmera da viewport 0
var _cam_x = camera_get_view_x(_cam);
var _cam_y = camera_get_view_y(_cam);

camera_set_view_pos(_cam, _cam_x + _x, _cam_y + _y); // Aplica o shake

// Se o shake for muito pequeno, destrói o objeto e reseta a câmera
if (shake <= .1) {
    instance_destroy();
    camera_set_view_pos(_cam, _cam_x, _cam_y); // Reseta a posição da câmera
}
