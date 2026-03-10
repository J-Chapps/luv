extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_hand_card_1_pressed() -> void:
	var card = 1
	send_card_to_parent(card)
	pass # Replace with function body.


func _on_hand_card_2_pressed() -> void:
	var card = 2
	send_card_to_parent(card)


func _on_hand_card_3_pressed() -> void:
	var card = 3
	send_card_to_parent(card)


func _on_hand_card_4_pressed() -> void:
	var card = 4
	send_card_to_parent(card)


func _on_hand_card_5_pressed() -> void:
	var card = 5
	send_card_to_parent(card)

func send_card_to_parent(card) -> void:
	var parent = get_parent()
	if parent.has_method("card_pressed"):
		parent.card_pressed(card)
	pass
