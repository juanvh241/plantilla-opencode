extends Node2D

enum GameState { START, PLAYING, GAME_OVER }

var score := 0
var _state: GameState = GameState.START

@onready var _player: CharacterBody2D = $Player
@onready var _spawner: Node2D = $ObstacleSpawner
@onready var _score_label: Label = $HUD/ScoreLabel
@onready var _start_label: Label = $HUD/StartLabel
@onready var _game_over_label: Label = $HUD/GameOverLabel


func _ready() -> void:
	_spawner.obstacle_passed.connect(_on_obstacle_passed)
	_player.died.connect(_on_player_died)
	_spawner.stop()
	_player.set_active(false)
	_show_start()


func _physics_process(_delta: float) -> void:
	if _state == GameState.START and Input.is_action_just_pressed("flap"):
		_start_game()
	elif _state == GameState.GAME_OVER and Input.is_action_just_pressed("flap"):
		_restart_game()


func _start_game() -> void:
	_state = GameState.PLAYING
	_score_label.text = str(score)
	_player.set_active(true)
	_spawner.reset()
	_show_playing()


func _on_obstacle_passed() -> void:
	if _state != GameState.PLAYING:
		return
	score += 1
	_score_label.text = str(score)


func _on_player_died() -> void:
	_state = GameState.GAME_OVER
	_spawner.stop()
	_show_game_over()


func _restart_game() -> void:
	score = 0
	_score_label.text = "0"
	_player.respawn()
	_spawner.reset()
	_state = GameState.PLAYING
	_show_playing()


func _show_start() -> void:
	_start_label.visible = true
	_game_over_label.visible = false


func _show_playing() -> void:
	_start_label.visible = false
	_game_over_label.visible = false


func _show_game_over() -> void:
	_start_label.visible = false
	_game_over_label.visible = true
	_game_over_label.text = "GAME OVER\nPuntaje: %d\nTAP / ESPACIO / CLICK para reiniciar" % score