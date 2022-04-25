extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var triangle_pv = 25
var triangle_xp = Tank.level*25 + 500

# Called when the node enters the scene tree for the first time.
func _ready():
	$ProgressBar.set_max(triangle_pv)
	var coord_x = (randi() % 29000)
	var coord_y = (randi() % 29000) 
	var neg_x =  (randi() % 2)
	var neg_y =  (randi() % 2)
	if neg_x <1:
		coord_x = coord_x
	else:
		coord_x = -coord_x
		
	if neg_y <1:
		coord_y = coord_y
	else:
		coord_y = -coord_y
	if -1000 < coord_x and coord_x < 0 :
		coord_x -= 1200
		position.x += coord_x 
		position.y += coord_y 
	elif 0 < coord_x and coord_x < 1000 :
		coord_x += 1200
		position.x += coord_x 
		position.y += coord_y 
	else:
			position.x += coord_x 
			position.y += coord_y
	$ProgressBar.hide()

func _process(delta):
	triangle_xp = Tank.level*25 + 500
	$ProgressBar.value = triangle_pv
	if triangle_pv <= 0 :
		Tank._add_xp(triangle_xp)
		queue_free()
		Tank.nombre_triangle -= 1



func _on_Triangle_body_entered(body):
	if body.is_in_group("Balles"):
		triangle_pv -= Tank.Stats["attack"]["attack_value"]
		Tank._get_lifesteal()
	elif body.is_in_group("Tank"):
		print("TANK")
		triangle_pv -= Tank._fist_damage()
	$ProgressBar.show()
