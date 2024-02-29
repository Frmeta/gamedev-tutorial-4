Proses pengerjaan level baru:
1. Pertama saya membuat scene baru: `Level2.tcsn`
2. Membuat tilemap dengan tileset yang baru, yaitu dari spritesheet tile grass
3. Kemudian saya meletakkan prefab player di scene tersebut
4. Saya desain level menggunakan tileset yang baru tersebut & meletakkan roket di finish line
5. Saya membuat objek enemy baru saw yang berjatuhan dari langit
6. Saya membuat objek yang diinstance secara periodik (tapi hanya hiasan tanpa mengganggu player). Kodenya adalah sebagai berikut:
    ```gdscript
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

    ```