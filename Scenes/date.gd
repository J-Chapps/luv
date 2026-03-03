extends Node2D

var connection = 0

var sharktopus_questions1 = []
var sharktopus_questions2 = []
var sharktopus_questions3 = []

var pteracuda_questions1 = []
var pteracuda_questions2 = []
var pteracuda_questions3 = []

var whalewolf_questions1 = []
var whalewolf_questions2 = []
var whalewolf_questions3 = []

var bearanha_questions1 = []
var bearanha_questions2 = []
var bearanha_questions3 = []

var velocipastor_questions1 = []
var velocipastor_questions2 = []
var velocipastor_questions3 = []

var kininja_questions1 = []
var kininja_questions2 = []
var kininja_questions3 = []


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	read_questions()
	date_loop()
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func read_questions() -> void:
	var file = FileAccess.open("res://TextFiles/questions.txt", FileAccess.READ)
	var section = 1
	
	# loops through entire file
	while not file.eof_reached():
		var line = file.get_line()
		
		# if line is blank
		if line == "":
			section = section + 1
		else:
			
			# split line into array
			var lineArray = line.split("; ")
			
			#sharktopus sections
			if section == 1:
				sharktopus_questions1.append(lineArray)
			elif section == 2:
				sharktopus_questions2.append(lineArray)
			elif section == 3:
				sharktopus_questions3.append(lineArray)
				
			#pteracuda sections
			elif section == 4:
				pteracuda_questions1.append(lineArray)
			elif section == 5:
				pteracuda_questions2.append(lineArray)
			elif section == 6:
				pteracuda_questions3.append(lineArray)
			
			#whalewolf sections
			elif section == 7:
				whalewolf_questions1.append(lineArray)
			elif section == 8:
				whalewolf_questions2.append(lineArray)
			elif section == 9:
				whalewolf_questions3.append(lineArray)
				
			#bearanha sections
			elif section == 10:
				bearanha_questions1.append(lineArray)
			elif section == 11:
				bearanha_questions2.append(lineArray)
			elif section == 12:
				bearanha_questions3.append(lineArray)
				
			#velocipastor sections
			elif section == 13:
				velocipastor_questions1.append(lineArray)
			elif section == 14:
				velocipastor_questions2.append(lineArray)
			elif section == 15:
				velocipastor_questions3.append(lineArray)
				
			#kininja sections
			elif section == 4:
				kininja_questions1.append(lineArray)
			elif section == 5:
				kininja_questions2.append(lineArray)
			elif section == 6:
				kininja_questions3.append(lineArray)
			
# the main gameplay loop
func date_loop() -> void:
	
	while connection < 100:
		# hide all elements
		$DateQA.visible = false
		$DateCards.visible = false
		# display question elements
		$DateQA.visible = true
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
		$DateQA.visible = false
	
		# display card elements
		# create intention
		intention_create()
		# display date intention
		$DateCards.visible = true
	
		# await end turn to be pressed
		# act on intention
		intention_act()
		# loop
		connection = 100
	pass
	
func question_ask() -> void:
	pass
	
func answer_respond() -> void:
	pass
	
func intention_create() -> void:
	pass
	
func intention_act() -> void:
	pass
