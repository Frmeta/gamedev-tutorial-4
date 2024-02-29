extends RigidBody2D


export var sceneName = "LoseScreen"

func _ready():
	linear_velocity = Vector2.DOWN * 200


func _on_Area2D_body_entered(body):
	if body.name == "Player":
		get_tree().change_scene(str("res://scenes/" + sceneName + ".tscn"))
	else:
		queue_free()
		
