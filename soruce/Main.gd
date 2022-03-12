extends Control


onready var  bg       := get_node("back_ground")
onready var yes_btn   := get_node("yes")
onready var no_btn    := get_node("no")
onready var text      := get_node("Text")
onready var question_text      := get_node("Text/text")
onready var anim      := get_node("Text/anim")

var color_list          := [Color.crimson ,Color.aqua ,Color.burlywood ,
						   Color.darkgoldenrod, Color.teal ,Color.springgreen ,
						   Color.salmon]
						
var screen_size 
onready var btn_pos = no_btn.rect_global_position
const button_size := [85,35,40]

func _ready():
	screen_size = get_viewport_rect().size
	randomize()
	bg.color = color_list[randi() % len(color_list)]

func change_bg_color():
	bg.color = color_list[randi() % len(color_list)]

func _process(_delta):
	screen_size = get_viewport_rect().size
	btn_pos = no_btn.rect_global_position
	
	if  btn_pos.x > screen_size.x - button_size[0]:
		no_btn.set_global_position(Vector2(btn_pos.x - 20,btn_pos.y))
	elif  btn_pos.x < 10:
		no_btn.set_global_position(Vector2(btn_pos.x + 20,btn_pos.y))
	elif  btn_pos.y > screen_size.y - button_size[1] - button_size[2]:
		no_btn.set_global_position(Vector2(btn_pos.x ,btn_pos.y -20))
	elif  btn_pos.y < 10:
		no_btn.set_global_position(Vector2(btn_pos.y ,btn_pos.y + 20)) 
	
func _on_no_button_down():
	var new_pos = get_global_mouse_position() - Vector2(rand_range(-100,100),rand_range(-100,100))
	no_btn.set_global_position(new_pos)
	
func _on_yes_pressed():
	hide_all()
	anim.play("answer_anim")
		
func hide_all():
	yes_btn.visible = false
	no_btn.visible = false
	question_text.visible = false
	
func _on_restart_pressed():
	get_tree().reload_current_scene()
