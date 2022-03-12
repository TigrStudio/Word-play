extends Control

onready var anim := get_node("anim")

var question_list := ["are you still stupid?"  , 
					  "are you Ugly?" ,
					  "are you mad?" ,
					"are you still single?",
					"did your crush also blocked you?",
					"are you dumb in studies?"]
var answer_list  := ["i knew it :-)",
					"no one is ugly everyone is beautiful for someone  but not you :-)",
					"i knew it :-)",
					"i know the reason for that; \n it is your ugly face",
					"mine too, \n\n but* \n \n as* i never mind it ;-(",
					"tooo jake padh le bsdk!"]
#;)
var x
func _ready():
	x = randi() % len(question_list)
	set_animation()
	set_answer()
	anim.playback_speed = 2
	#anim.play("answer_anim")
	anim.play("First_anim")
	

	
func set_animation():
	anim.get_animation("First_anim").track_set_key_value(0,1,question_list[x])

func set_answer():
	anim.get_animation("answer_anim").track_set_key_value(0,1,answer_list[x])
