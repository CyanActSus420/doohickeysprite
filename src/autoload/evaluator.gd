extends Node

var bytes:Array

var functions:Dictionary[String, FunctionData] = {
	
}

var pc:int = 0

var remembered_pc_positions:Array[int] = []

func _ready():
	bytes.resize(1024)
	bytes.fill(0)

func evaluate(file:String):
	var lines = file.split("\n")
	
	while pc < len(lines):
		var line = lines[pc].split(" ")
		
		Interpreter.interpret(line, lines)
		
		# ALWAYS keep this on the bottom of the while loop. trust me.
		pc += 1
