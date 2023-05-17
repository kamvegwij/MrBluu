extends Node

var songs: Array = ["res://assets/audio/track1.wav", "res://assets/audio/track2.wav", "res://assets/audio/track3.wav"]
	
func _process(_delta):
	$soundtrack.volume_db = GameManager.track_volume
	
	if !$soundtrack.playing and !GameManager.in_game:
		randomize()
		$soundtrack.stream = load( songs[rand_range(0, len(songs))] )
		$soundtrack.play()
		
func _play_soundtrack():
	#$soundtrack.stream = load( songs[rand_range(0, len(songs) )] ) # select a random song from the list
	$soundtrack.play()

func stop_soundtrack():
	$soundtrack.stop()

func _click_play():
	$click.play()
	
func _collect_play():
	$collect.play()
	
func _died_play():
	$died.play()
	
