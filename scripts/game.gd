extends Node2D

var score := 0

@onready var _spawner: Node2D = $ObstacleSpawner
@onready var _player: CharacterBody2D = $Player
@onready var _score_label: Label = $HUD/ScoreLabel


func _ready() -> void:
	_spawner.obstacle_passed.connect(_on_obstacle_passed)
	_player.died.connect(_on_player_died)


func _on_obstacle_passed() -> void:
	score += 1
	_score_label.text = str(score)


func _on_player_died() -> void:
	_spawner.stop()