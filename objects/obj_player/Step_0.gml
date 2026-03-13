state(); // Chamando a variavel que está funcionado como uma função que armazena a chamanda do SCRIPT 
//script_execute(state); //podemos evocala desse jeito.
event_inherited();

#region  PARALLAX


var _b_layer_2 = layer_get_id("_b_layer_2");
var _b_layer_3 = layer_get_id("_b_layer_3");
var _b_layer_4 = layer_get_id("_b_layer_4");
//var _b_layer_5 = layer_get_id("_b_layer_5"); //Sem a Layer 5

var _b_light = layer_get_id("_b_layer_light");


layer_x(_b_layer_2, lerp(0, camera_get_view_x(view_camera[0]), 0.7));  //0.9
layer_x(_b_layer_3, lerp(0, camera_get_view_x(view_camera[0]), 0.6));  //0.7
layer_x(_b_layer_4, lerp(0, camera_get_view_x(view_camera[0]), 0.5));  //0.5
//layer_x(_b_layer_5, lerp(0, camera_get_view_x(view_camera[0]), 0.2));  //0.5


layer_x(_b_light, lerp(0, camera_get_view_x(view_camera[0]),0.5));


#endregion


