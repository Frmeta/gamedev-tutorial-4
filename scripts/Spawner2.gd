extends Node2D

export (PackedScene) var obstacle
export (float) var spawn_delay = 0.3
export (float) var angle = 0
export (float) var speed = 800

func _ready():
	repeat()

func spawn():
	var spawned = obstacle.instance()
	get_parent().add_child(spawned)

	var spawn_pos = global_position
	spawned.position = spawn_pos
	
	spawned.linear_velocity = Vector2(cos(deg2rad(angle)) , sin(deg2rad(angle))) * speed

func repeat():
	spawn()
	yield(get_tree().create_timer(spawn_delay), "timeout")
	repeat()
