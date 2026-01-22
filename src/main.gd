extends Node2D

@onready var pixel_storage: Node2D = $PixelStorage

var target:String = "./main.txt"

func _ready() -> void:
	Global.main = self
	
	# stole ts from the godot docs lmao
	var args = {}
	for arg in OS.get_cmdline_args():
		if arg.contains("="):
			var key = arg.split("=")
			args[key[0].trim_prefix("--")] = key[1]
		else:
			args[arg.trim_prefix("--")] = ""
	
	if args.has("file"):
		print("Loaded file: %s" % args["file"])
		target = "./%s" % args["file"]
	
	if !FileAccess.file_exists(target):
		push_error("File %s doesn't exist!" % target)
		get_tree().quit(1)
	
	var file:String = FileAccess.open(target, FileAccess.READ).get_as_text()
	
	Evaluator.evaluate(file)

func _exit_tree() -> void:
	Global.main = null

func ClearScreen():
	for pixel in pixel_storage.get_children():
		pixel.queue_free()
