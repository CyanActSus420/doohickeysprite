extends Node

var main = null

var colors:Array[Color] = [
	Color("000000ff"),
	Color("282828ff"),
	Color("636363ff"),
	Color("707070ff"),
	Color("888888ff"),
	Color("939393ff"),
	Color("c6c6c6ff"),
	Color("ffffffff")
]

const PIXEL = preload("uid://dgnps7ogqslxl")

func DrawPixel(x:int, y:int, color:int):
	var curPixel = PIXEL.instantiate()
	curPixel.position.x = x - 1
	curPixel.position.y = y - 1
	curPixel.update_pixel(colors[color - 1])
	main.pixel_storage.add_child(curPixel)

func ClearPixels():
	main.ClearScreen()
