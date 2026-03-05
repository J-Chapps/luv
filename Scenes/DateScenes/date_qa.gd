extends Control

signal answer_pressed(answer)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

# answer 1 pressed
func _on_answer_button_1_pressed() -> void:
	var answer = 1
	send_answer_to_parent(answer)

# answer 2 pressed
func _on_answer_button_2_pressed() -> void:
	var answer = 2
	send_answer_to_parent(answer)

# answer 3 pressed
func _on_answer_button_3_pressed() -> void:
	var answer = 3
	send_answer_to_parent(answer)

# send answer to parent (Date)
func send_answer_to_parent(answer) -> void:
	
	var parent = get_parent()
	if parent.has_method("answer_pressed"):
		parent.answer_pressed(answer)

# send continue message to parent
func _on_continue_button_pressed() -> void:
	var parent = get_parent()
	if parent.has_method("continue_pressed"):
		parent.continue_pressed()
