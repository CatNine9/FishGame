extends Node

# Settings:
var size_visibility = false
var fps_visibility = false

# UI:
var size_vis_toggle_setting = false
var fps_toggle_setting = false

# Game:
var is_paused = false
var camera_position = Vector2(0, 0)

# Player:
var player_position = Vector2(400, 300)
var player_score = 0
var player_alive = true
var player_name = null
var player_species = ""

# Leaderboard:
var entries = [["Cat9", "13/3/2023", 11],["", "", null], ["", "", null], ["", "", null], ["", "", null], ["", "", null], ["", "", null], ["", "", null], ["", "", null], ["", "", null]]
var entry_1 = ["Cat9", "13/3/2023", str(11)]
var entry_2 = ["","",""]
var entry_3 = ["","",""]
var entry_4 = ["","",""]
var entry_5 = ["","",""]
var entry_6 = ["","",""]
var entry_7 = ["","",""]
var entry_8 = ["","",""]
var entry_9 = ["","",""]
var entry_10 = ["","",""]
