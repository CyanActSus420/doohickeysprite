extends Node

# "line" is an array of tokens.
func interpret(line:Array, lines:Array):
	if line == [""] or line == [" "]:
		return # empty line, do nothing
	
	var token = line[0]
	
	match (token):
		# basics
		"SET":
			Evaluator.bytes[int(line[2])] = int(line[1])
		"MOVE":
			var ByteValue = Evaluator.bytes[int(line[1])]
			Evaluator.bytes[int(line[1])] = null
			Evaluator.bytes[int(line[2])] = ByteValue
		"PRINT":
			print(Evaluator.bytes[int(line[1])])
		"SAY":
			var intArray = []
			for shit in line:
				if shit != "SAY":
					intArray.push_back(String.chr(Evaluator.bytes[int(shit)]))
			
			var finalString = ""
			
			for letter in intArray:
				finalString += letter
			
			print(finalString)
		# math
		"ADD":
			var byte_one = Evaluator.bytes[int(line[1])]
			var byte_two = Evaluator.bytes[int(line[2])]
			var result = byte_one + byte_two
			Evaluator.bytes[int(line[3])] = result
		"SUB":
			var byte_one = Evaluator.bytes[int(line[1])]
			var byte_two = Evaluator.bytes[int(line[2])]
			var result = byte_one - byte_two
			Evaluator.bytes[int(line[3])] = result
		"DIV":
			var byte_one = Evaluator.bytes[int(line[1])]
			var byte_two = Evaluator.bytes[int(line[2])]
			var result = byte_one / byte_two
			Evaluator.bytes[int(line[3])] = result
		"MUL":
			var byte_one = Evaluator.bytes[int(line[1])]
			var byte_two = Evaluator.bytes[int(line[2])]
			var result = byte_one * byte_two
			Evaluator.bytes[int(line[3])] = result
		# drawing
		"DRAW":
			var x:int = Evaluator.bytes[int(line[1])]
			var y:int = Evaluator.bytes[int(line[2])]
			var color:int = Evaluator.bytes[int(line[3])]
			Global.DrawPixel(x, y, color)
		"CLEAR":
			Global.ClearPixels()
		# functions
		"DEF":
			var curFunctionDefinition = FunctionData.new()
			curFunctionDefinition.FunctionName = line[1]
			curFunctionDefinition.StartingLine = Evaluator.pc
			while lines[Evaluator.pc].split(" ")[0] != "END":
				Evaluator.pc += 1
			
			curFunctionDefinition.EndingLine = Evaluator.pc
			Evaluator.pc += 1
			Evaluator.functions.set(curFunctionDefinition.FunctionName, curFunctionDefinition)
		"END":
			push_warning("There is no function to be declared! Is this a mistake on your part or are you trying to make a fucked up jump loop?")
		"CALL":
			Evaluator.remembered_pc_positions.push_front(Evaluator.pc)
			var func_data:FunctionData = Evaluator.functions[line[1]]
			Evaluator.pc = func_data.StartingLine + 1
			
			while Evaluator.pc != func_data.EndingLine:
				var curLine = lines[Evaluator.pc].split(" ")
				
				interpret(curLine, lines)
				Evaluator.pc += 1
			
			Evaluator.pc = Evaluator.remembered_pc_positions[0]
			Evaluator.remembered_pc_positions.remove_at(0)
		# if """statements"""
		"IF":
			if Evaluator.bytes[int(line[1])] == Evaluator.bytes[int(line[2])]:
				Evaluator.pc = int(line[3]) - 1
		"NOT":
			if Evaluator.bytes[int(line[1])] != Evaluator.bytes[int(line[2])]:
				Evaluator.pc = int(line[3]) - 1
		# other
		"JUMP":
			Evaluator.pc = int(line[1]) - 1
		";": pass
		_:
			push_error("Invalid Token!")
