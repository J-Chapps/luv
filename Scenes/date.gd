extends Node2D

var connection = 0
var confidence = 100
var selected_character = "sharktopus"
var date_number = 1
var selected_question = []

var energy = 3

var card_blank_image = preload("res://Images/Cards/card-blank.png")
var card_compliment_image = preload("res://Images/Cards/card_compliment.png")
var card_funstory_image = preload("res://Images/Cards/card_funstory.png")
var card_coolstory_image = preload("res://Images/Cards/card_coolstory.png")
var card_getsocials_image = preload("res://Images/Cards/card_getsocials.png")
var card_boldgesture_image = preload("res://Images/Cards/card_boldgesture.png")
var card_makeamove_image = preload("res://Images/Cards/card_makeamove.png")

# ["Card name", "Tp", "Connection", "Confidence", "Aura", "Type", "image"]
var allCards = [
	["Blank Card", "0", "0", "0", "0", "basic", card_blank_image],
	["Compliment", "1", "5", "0", "0", "basic",card_compliment_image],
	["Fun Story", "1", "0", "5", "0", "basic", card_funstory_image],
	["Cool Story", "1", "0", "0", "10", "basic", card_coolstory_image],
	["Get Socials", "2", "5", "0", "5", "basic", card_getsocials_image],
	["Bold Gesture", "2", "0", "15", "0", "basic", card_boldgesture_image],
	["Make a move", "3", "20", "0", "10", "basic",  card_makeamove_image],
	]

var deckCards = []
var card1 = []
var card2 = []
var card3 = []
var card4 = []
var card5 = []

signal answer_processed()
signal continue_processed()

# sharktopus questions
var sq1 = []
var sq2 = []
var sq3 = []

# pteracuda questions
var pq1 = []
var pq2 = []
var pq3 = []

# whalewolf questions
var wq1 = []
var wq2 = []
var wq3 = []

# bearanha questions
var bq1 = []
var bq2 = []
var bq3 = []

# velocipastor questions
var vq1 = []
var vq2 = []
var vq3 = []

# kininja questions
var kq1 = []
var kq2 = []
var kq3 = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	read_questions()
	read_cards()
	date_loop()

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
				sq1.append(lineArray)
			elif section == 2:
				sq2.append(lineArray)
			elif section == 3:
				sq3.append(lineArray)
				
			#pteracuda sections
			elif section == 4:
				pq1.append(lineArray)
			elif section == 5:
				pq2.append(lineArray)
			elif section == 6:
				pq3.append(lineArray)
			
			#whalewolf sections
			elif section == 7:
				wq1.append(lineArray)
			elif section == 8:
				wq2.append(lineArray)
			elif section == 9:
				wq3.append(lineArray)
				
			#bearanha sections
			elif section == 10:
				bq1.append(lineArray)
			elif section == 11:
				bq2.append(lineArray)
			elif section == 12:
				bq3.append(lineArray)
				
			#velocipastor sections
			elif section == 13:
				vq1.append(lineArray)
			elif section == 14:
				vq2.append(lineArray)
			elif section == 15:
				vq3.append(lineArray)
				
			#kininja sections
			elif section == 16:
				kq1.append(lineArray)
			elif section == 17:
				kq2.append(lineArray)
			elif section == 18:
				kq3.append(lineArray)

func read_cards() -> void:
	var file = FileAccess.open("res://TextFiles/cards.txt", FileAccess.READ)
	
	# updates the deck cards
	while not file.eof_reached():
		var line = file.get_line()
		if line != "":
			deckCards.append(line)

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
		
		# await answer to be selected and processed
		await self.answer_processed
		
		# hide answers
		#diplay continue
		$DateQA/Questions/QuestionsBox/AnswersBox.visible = false
		$DateQA/Questions/QuestionsBox/ContinueButton.visible = true
	
		# call response function
		answer_respond()
		
		# await continue to be pressed
		await self.continue_processed
	
		# hide question elements
		$DateQA.visible = false
	
		# generate card elements
		generate_cards()
		$DateCards.visible = true
		
		# create intention
		intention_create()
		# display date intention
	
		# await end turn to be pressed
		# act on intention
		intention_act()
		
		# loop
		break
	
func question_ask() -> void:
	
	# Chooses a question from the specified 
	if selected_character == "sharktopus":
		if date_number == 1:
			selected_question = sq1[randi_range(1,sq1.size()-1)]
		elif date_number == 2:
			selected_question = sq2[randi_range(1,sq2.size()-1)]
		elif date_number == 3:
			selected_question = sq3[randi_range(1,sq3.size()-1)]
	
	elif selected_character == "pteracuda":
		if date_number == 1:
			selected_question = pq1[randi_range(1,pq1.size()-1)]
		elif date_number == 2:
			selected_question = pq2[randi_range(1,pq2.size()-1)]
		elif date_number == 3:
			selected_question = pq3[randi_range(1,pq3.size()-1)]
	
	elif selected_character == "whalewolf":
		if date_number == 1:
			selected_question = wq1[randi_range(1,wq1.size()-1)]
		elif date_number == 2:
			selected_question = wq2[randi_range(1,wq2.size()-1)]
		elif date_number == 3:
			selected_question = wq3[randi_range(1,wq3.size()-1)]
	
	elif selected_character == "bearanha":
		if date_number == 1:
			selected_question = bq1[randi_range(1,bq1.size()-1)]
		elif date_number == 2:
			selected_question = bq2[randi_range(1,bq2.size()-1)]
		elif date_number == 3:
			selected_question = bq3[randi_range(1,bq3.size()-1)]
	
	elif selected_character == "velocipastor":
		if date_number == 1:
			selected_question = vq1[randi_range(1,vq1.size()-1)]
		elif date_number == 2:
			selected_question = vq2[randi_range(1,vq2.size()-1)]
		elif date_number == 3:
			selected_question = vq3[randi_range(1,vq3.size()-1)]
	
	elif selected_character == "kininja":
		if date_number == 1:
			selected_question = kq1[randi_range(1,kq1.size()-1)]
		elif date_number == 2:
			selected_question = kq2[randi_range(1,kq2.size()-1)]
		elif date_number == 3:
			selected_question = kq3[randi_range(1,kq3.size()-1)]

	# display questions and answers
	$DateQA/Questions/QuestionsBox/QuestionTexture/QuestionText.text = selected_question[0]
	
	$DateQA/Questions/QuestionsBox/AnswersBox/AnswerButton1/AnswerText1.text = selected_question[1]
	$DateQA/Questions/QuestionsBox/AnswersBox/AnswerButton2/AnswerText2.text = selected_question[2]
	$DateQA/Questions/QuestionsBox/AnswersBox/AnswerButton3/AnswerText3.text = selected_question[3]

func answer_pressed(answer) -> void:
	
	# find value for answer
	answer = selected_question[answer + 3]
	var connection_change = 0
	var confidence_change = -20
	
	if answer == "good":
		connection_change = 20
		confidence_change = -5
	elif answer == "neutral":
		connection_change = 10
		confidence_change = -10
	
	# update connection and confidence
	change_connection(connection_change)
	change_confidence(confidence_change)
	
	# continue main loop
	emit_signal("answer_processed")

func change_connection(connection_change) -> void:
	# set connection bar progress
	connection = connection + connection_change
	$DateStats/Connection/ConnectionBox/ConnectionTexture.value = connection

func change_confidence(confidence_change) -> void:
	# set confidence bar progress
	confidence = confidence + confidence_change
	$DateStats/Confidence/ConfidenceBox/ConfidenceTexture.value = confidence
	if confidence > 100:
		confidence = 100

func answer_respond() -> void:
	pass

func continue_pressed() -> void:
	# send signal back to main loop
	emit_signal("continue_processed")
	pass

func generate_cards() -> void:
	# shuffles cards and creates the subarrays
	deckCards.shuffle()
	
	var card1type = int(deckCards[1])
	var card2type = int(deckCards[2])
	var card3type = int(deckCards[3])
	var card4type = int(deckCards[4])
	var card5type = int(deckCards[5])
	
	card1 = allCards[card1type]
	card2 = allCards[card2type]
	card3 = allCards[card3type]
	card4 = allCards[card4type]
	card5 = allCards[card5type]
	
	# sets the textures
	$DateCards/Cards/HandCards/HandCards/HandCard1.texture_normal = card1[6]
	$DateCards/Cards/HandCards/HandCards/HandCard2.texture_normal = card2[6]
	$DateCards/Cards/HandCards/HandCards/HandCard3.texture_normal = card3[6]
	$DateCards/Cards/HandCards/HandCards/HandCard4.texture_normal = card4[6]
	$DateCards/Cards/HandCards/HandCards/HandCard5.texture_normal = card5[6]

func card_pressed(card) -> void:
	
	var affordable = false
	var selectedCard = []
	# finds which card was pressed
	if card == 1:
		if check_tp_cost(card1) == true:
			$DateCards/Cards/HandCards/HandCards/HandCard1.visible = false
			selectedCard = card1
			affordable = true
		else:
			affordable = false
	elif card == 2:
		if check_tp_cost(card2) == true:
			$DateCards/Cards/HandCards/HandCards/HandCard2.visible = false
			selectedCard = card2
			affordable = true
		else:
			affordable = false
	elif card == 3:
		if check_tp_cost(card3) == true:
			$DateCards/Cards/HandCards/HandCards/HandCard3.visible = false
			selectedCard = card3
			affordable = true
		else:
			affordable = false
	elif card == 4:
		if check_tp_cost(card4) == true:
			$DateCards/Cards/HandCards/HandCards/HandCard4.visible = false
			selectedCard = card4
			affordable = true
		else:
			affordable = false
	elif card == 5:
		if check_tp_cost(card5) == true:
			$DateCards/Cards/HandCards/HandCards/HandCard5.visible = false
			selectedCard = card5
			affordable = true
		else:
			affordable = false
		
	if affordable == true:
		change_connection(int(selectedCard[2]))
		change_confidence(int(selectedCard[3]))
	else:
		$DateCards/Cards/HandCards/CantAfford.visible = true
		await get_tree().create_timer(1.0).timeout
		$DateCards/Cards/HandCards/CantAfford.visible = false

func check_tp_cost(card):
	if int(card[1]) <= energy:
		energy = energy - int(card[1])
		return true
	else:
		return false

func intention_create() -> void:
	pass
	
func intention_act() -> void:
	pass
