# Godot Plugin ChangeScenes
Plugin para cambiar de escenas fácilmente en Godot Engine 3.1 por medio de un nodo llamado ChangeScenes 


## Instalar

1.  Descargar el plugin
2.  Descomprimir
3.  Crear una carpeta addons en la raíz de tu proyecto (si es que esta no existe)
4.  Copiar la carpeta "**ChangeScenes**" (que esta en la carpeta descargada) a dentro de la carpeta addons creada en el paso 3.
5.  Activar el plugin en: Proyecto>Ajustes del proyecto>Plugins
6.  Crear una escena y añadir como nodo raíz **ChangeScenes**
7.  **Agregar esa escena al autoload (Proyecto>Ajustes del proyecto>AutoLoad)**

## Cambiar una escena sin JSON 

    #Sin json
	ChangeScenes.change_scene('ruta-de-la-escena')
	#o tambien
	ChangeScenes.change_scene('escena')
	
	
	
#Ejemplos

    #Cambiar escena con ruta
    ChangeScenes.change_scene('res://test/change_scenes/Level_01/Level_01.tscn')
    #Cambiar escena con load 
    ChangeScenes.change_scene(load('res://test/change_scenes/Level_01/Level_01.tscn') as PackedScene)
    
 
 ## Obtener y Asignar Escenas

    #Obtener la escena 
    ChangeScenes.get_the_scene()
    #Asignar uns escena
    set_the_scene('res://test/change_scenes/Level_01/Level_01.tscn')

	
## Cambiar una escena con JSON 
Creamos un json en nuestro script debe tener 
**id** : Debe ser unico y no repetido
**scene_current**: Sera la url de la escena actual
**scene_active**: Falso si la escena esta desbloqueada
**scene_next**: Sera la siguiente escena a la cual cambiara

    var my_obj_json_scenes = [
		{
			"id": "1",
			"scene_current": "res://test/change_scenes/Level_01/Level_01.tscn",
			"scene_active": true,
			"scene_next": "2"
		},
		{
			"id": "2",
			"scene_current": "res://test/change_scenes/Level_02/Level_02.tscn",
			"scene_active": true,
			"scene_next": "3"
		},
		{
			"id": "3",
			"scene_current": "res://test/change_scenes/Level_03/Level_03.tscn",
			"scene_active": true,
			"scene_next": "1"
		}
	]

Ejemplo de uso:

    #Podemos cambiar de escena mediante el id, cambiara al scene_current
    ChangeScenes.change_next_scene_by_json('1')
    #Podemos cambiar a la siguiente escena mediante el id,cambiara al scene_next
    ChangeScenes.change_current_scene_by_json('3')
    #Podemos cambiar a la siguiente escena mediante el id actual,cambiara al scene_next
    ChangeScenes.change_next_scene_by_json(ChangeScenes.get_the_json_current_scene().id)
    #Cambia si es active la siguiente escena
    if ChangeScenes.get_the_json_scene().scene_active == true:
	ChangeScenes.change_current_scene_by_json(ChangeScenes.get_the_json_scene().id)
  
  

## Obtener y Asignar Escenas Json

    #Obtenemos un Json de la escena actual
    ChangeScenes.get_the_json_current_scene()
    #Buscamos un Json por el ID
    set_the_json_scene('_the_json_scene_id')
    #Obtenemos el Json
    ChangeScenes.get_the_json_scene()

