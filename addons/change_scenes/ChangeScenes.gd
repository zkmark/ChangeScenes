extends Node

#instance the scene
var the_new_scene

# Setters and Getters With Json
var the_scene = "" setget set_the_scene , get_the_scene

# Json Values
var the_obj_json_scenes = "" setget set_the_obj_json_scenes , get_the_obj_json_scenes

# Get one json Value
var the_json_scene = "" setget set_the_json_scene , get_the_json_scene
# Get Current Json
var the_json_current_scene = "" setget set_the_json_current_scene , get_the_json_current_scene


#	SETS AND GETS
#	get and set the_scene (current scene)
#	Detect String or PackedScene
func set_the_scene(_the_scene):
	if(typeof(_the_scene) == TYPE_STRING):
		the_scene = load(_the_scene) as PackedScene
	else:
		the_scene = _the_scene

func get_the_scene():
	return the_scene 


# FUNCTIONS
#	Change the scene and add group node_scenes
func change_scene(_the_scene):
	if (_the_scene != null):
					
		set_the_scene(_the_scene)
		
		if get_tree().has_group("group_node_scenes"):
			get_tree().get_nodes_in_group("group_node_scenes")[0].free()
			
		the_new_scene = get_the_scene().instance()
		add_child(the_new_scene)
		the_new_scene.add_to_group('group_node_scenes')



#	JSON
#	SETS AND GETS
#	Obj JSON
func set_the_obj_json_scenes(_the_obj_json_scenes):
	the_obj_json_scenes = _the_obj_json_scenes

func get_the_obj_json_scenes():
	return the_obj_json_scenes 

#	Needs the id of one scene
func set_the_json_scene(_the_json_scene_id):
	for item in the_obj_json_scenes:
		if _the_json_scene_id == item['id']:
			the_json_scene = item

func get_the_json_scene():
	return the_json_scene


#	Needs the id of CURRENT scene
func set_the_json_current_scene(_the_json_current_scene):
	for item in the_obj_json_scenes:
		if _the_json_current_scene == item['id']:
			the_json_current_scene = item

func get_the_json_current_scene():
	return the_json_current_scene
	
	
# 	FUNCTIONS
func change_current_scene_by_json(_the_scene_id = ""):
	if _the_scene_id != "":
		for item in the_obj_json_scenes:
			if _the_scene_id == item['id']:
				#print(item)
				set_the_json_current_scene(_the_scene_id)
				change_scene(item['scene_current'])
	else:
		print('change_current_scene_by_json invalid _the_scene_id')


func change_next_scene_by_json(_the_scene_id = ""):
	if _the_scene_id != "":
		for item in the_obj_json_scenes:
			if _the_scene_id == item['id']:
				#print(item)
				set_the_json_current_scene(_the_scene_id)
				change_scene(item['scene_next'])
	else:
		print('change_next_scene_by_json invalid _the_scene_id')
