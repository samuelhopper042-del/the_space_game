extends Node3D


@export var look_sensitivity: float = 0.003

var is_first_person: bool = true

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	Input.set_custom_mouse_cursor(null)
func _unhandled_input(event):
	if event is InputEventMouseMotion:
		rotate_y(-event.relative.x * look_sensitivity)
		$Camera3D.rotate_x(-event.relative.y * look_sensitivity)
		$Camera3D.rotation.x = clamp($Camera3D.rotation.x, deg_to_rad(-85), deg_to_rad(85))
func _process(_delta):
	if Input.is_action_just_pressed("ui_cancel"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	if Input.is_action_just_pressed("toggle_camera"):
		is_first_person = !is_first_person
		
		if is_first_person:
			$Camera3D.position.z = 0.0
		
		else:
			$Camera3D.position.z = 3.5
