extends Node


var has_music := true
var character := "Red"
var position := Vector2(2215, 40)
var level_no := 0
var level := "res://Levels/level_*.tscn"

var game_language: String

const language := {
	"english": {
		"main": {
			"play": "Play",
			"option": "Option",
			"exit": "Exit"
		},
		"option_page": {
			"change_character": "Change character",
			"music": "Music",
			"ok": "Ok"
		},
		"pause": {
			"paused": "PAUSED",
			"continue": "Continue"
		},
		"end": {
			"thanks": "Thanks for playing!"
		}
	},
	"chinese": {
		"main": {
			"play": "开始",
			"option": "选项",
			"exit": "退出"
		},
		"option_page": {
			"change_character": "更换角色",
			"music": "音乐",
			"ok": "完成"
		},
		"pause": {
			"paused": "暂停",
			"continue": "继续"
		},
		"end": {
			"thanks": "感谢您的游玩!"
		}
	},
	"japanese": {
		"main": {
			"play": "スタート",
			"option": "オプション",
			"exit": "終了"
		},
		"option_page": {
			"change_character": "キャラクターを変える",
			"music": "音楽",
			"ok": "完了"
		},
		"pause": {
			"paused": "一時停止",
			"continue": "つづく"
		},
		"end": {
			"thanks": "プレイしていただき\nありがとうございました!"
		}
	}
}


func _ready() -> void:
	match OS.get_locale_language():
		"zh": game_language = "chinese"
		"ja": game_language = "japanese"
		_: game_language = "english"
