extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var my_obj_json_scenes = [
		{
			"id": "1",
			"scene_current": "res://test/change_scenes/Level_01/Level_01.tscn",
			"scene_active": true,
			"scene_next": "res://test/change_scenes/Level_02/Level_02.tscn"
		},
		{
			"id": "2",
			"scene_current": "res://test/change_scenes/Level_02/Level_02.tscn",
			"scene_active": true,
			"scene_next": "res://test/change_scenes/Level_03/Level_03.tscn"
		},
		{
			"id": "3",
			"scene_current": "res://test/change_scenes/Level_03/Level_03.tscn",
			"scene_active": true,
			"scene_next": "res://test/change_scenes/Level_01/Level_01.tscn"
		}
	]

# Called when the node enters the scene tree for the first time.
func _ready():
	#Su usas Json
	#Agrega tu Json antes de empezar
	ChangeScenes.set_the_obj_json_scenes(my_obj_json_scenes)
	#Escoge el id para inicial la escena
	ChangeScenes.change_current_scene_by_json('1')
	
	#Si quieres cargar la escena sin json
	#ChangeScenes.change_scene('res://test/change_scenes/Level_01/Level_01.tscn')
	

func _process(delta):
	#Si presiona la tecla hacia arriba cambiara al scene_next del id 1
	if Input.is_action_just_pressed('ui_up'):
		#Cambia a la siguiene escena con json (scene_next)
		ChangeScenes.change_next_scene_by_json('1')
		#Obten un json de la escena actual
		print(ChangeScenes.get_the_json_current_scene())
		
	#Si presiona la tecla hacia abajo cambiara al scene_current del id 3
	if Input.is_action_just_pressed('ui_down'):
		ChangeScenes.change_current_scene_by_json('3')
		
	#Cambia de nivel si presiona derecha y scene_active es true
	if Input.is_action_just_pressed('ui_right'):
		#obtener el json de la escena que se requiere
		ChangeScenes.set_the_json_scene('3')
		
		#Imprime todo el json
		#print(ChangeScenes.get_the_json_scene())
		
		#Si scene_active es true cambia a esa escena
		if ChangeScenes.get_the_json_scene().scene_active == true:
			#opcion 1
			ChangeScenes.change_current_scene_by_json(ChangeScenes.get_the_json_scene().id)
			#opcion 2
			#ChangeScenes.change_current_scene_by_json('3')
		