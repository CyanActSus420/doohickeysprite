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
	if args.has("color_palette"):
		print("Loaded color palette: %s" % args["color_palette"])
		var colors:String = FileAccess.open("./%s" % args["color_palette"], FileAccess.READ).get_as_text()
		Global.setColorPalette(colors)
	if args.has("wait_time"):
		print("Program Counter wait time: %s" % args["wait_time"])
		Evaluator.wait_time = args["wait_time"]
	
	if !FileAccess.file_exists(target):
		push_error("File %s doesn't exist!" % target)
		get_tree().quit(1)

func _exit_tree() -> void:
	Global.main = null

func ClearScreen():
	for pixel in pixel_storage.get_children():
		pixel.queue_free()

# wait for a little bit so we dont have to wait until the program is done being evaluated
func _on_evaluation_start_timeout() -> void:
	var file:String = FileAccess.open(target, FileAccess.READ).get_as_text()
	
	Evaluator.evaluate(file)
