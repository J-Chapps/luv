extends Node2D

var connection = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

# the main gameplay loop
func _date_loop() -> void:
	
	while connection < 100:
		# hide all elements
		$DateQA.visble = false
		$DateCards.visible = false
		# display question elements
		$DateQA.visble = true
		$DateQA/Questions/QuestionsBox/AnswersBox.visible = true
		$DateQA/Questions/QuestionsBox/ContinueButton.visible = false
	
		# call question function
		question_ask()
		# await answer to be selected
	
		# hide answers
		#diplay continue
		$DateQA/Questions/QuestionsBox/AnswersBox.visible = false
		$DateQA/Questions/QuestionsBox/ContinueButton.visible = true
	
		# call response function
		answer_respond()
		# await continue to be pressed
	
		# hide question elements
		$DateQA.visble = false
	
		# display card elements
		# create intention
		intention_create()
		# display date intention
		$DateCards.visible = true
	
		# await end turn to be pressed
		# act on intention
		intention_act()
	
		# loop
	pass
	
func question_ask() -> void:
	pass
	
func answer_respond() -> void:
	pass
	
func intention_create() -> void:
	pass
	
func intention_act() -> void:
	pass
