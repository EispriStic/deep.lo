extends TextureProgress


# Called when the node enters the scene tree for the first time.
func _ready():
	value = Tank.max_health 

func _physics_process(delta):
	value = Tank.pv
	print(Tank.pv)