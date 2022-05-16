extends Node2D

var molar_abs = 0 #maximum molar absorptivity

var amp1 = 0
var center1 = 0
var width1 = 1

var amp2 = 0
var center2 = 0
var width2 = 1

var amp3 = 0
var center3 = 0
var width3 = 1

var vol_dye = 1
var vol_solvent = 1

#var structure_array = [
	
	#Vector2(400,400),
	#Vector2(300,400+100*sqrt(3)),
	#Vector2(100,400+100*sqrt(3)),
	#Vector2(0,400),
	#Vector2(100,400-100*sqrt(3)),
	#Vector2(300,400-100*sqrt(3)),
	#Vector2(400,400)]

export (NodePath) var Dropdown_path
onready var Dropdown = get_node(Dropdown_path)
	
func set_dye(dye):
	molar_abs = dye[0]
	
	amp1 = dye[1] * dye[0]
	center1 = dye[2]
	width1 = dye[3]
	
	amp2 = dye[4] * dye[0]
	center2 = dye[5]
	width2 = dye[6]

	amp3 = dye[7] * dye[0]
	center3 = dye[8]
	width3 = dye[9]

#uncomment func_draw when you want to include the structures - as well as the structure array comments above
#func _draw():
	#for i in range(len(structure_array)-1):
		#draw_line(structure_array[i],structure_array[i+1], Color(1.0,1.0,1.0), 1.0, true)

func drawPlot(nodePath: String) -> void:
	var line: Node = get_node(nodePath)
	
	line.clear_points()
	
	for i in range(1,3200):
		line.add_point(Vector2((i*12+5000), 
		2000 - 
		(vol_dye/(vol_dye+vol_solvent))*0.02*(
		amp1 * exp(-1*pow(((i-center1*4+700))/(width1*7),2)) +
		amp2 * exp(-1*pow(((i-center2*4+700))/(width2*7),2)) + 
		amp3 * exp(-1*pow(((i-center3*4+700))/(width3*7),2))) +
		
		rand_range(
				-30 -
				pow(vol_dye/(vol_dye+vol_solvent)*0.000035*(amp1 * exp(-1*pow(((i-center1*4+700))/(width1*7),2)) + 
				amp2 * exp(-1*pow(((i-center2*4+700))/(width2*7),2)) + 
				amp3 * exp(-1*pow(((i-center3*4+700))/(width3*7),2))),4),
				30 +
				pow(vol_dye/(vol_dye+vol_solvent)*0.000035*(amp1 * exp(-1*pow(((i-center1*4+700))/(width1*7),2)) + 
				amp2 * exp(-1*pow(((i-center2*4+700))/(width2*7),2)) + 
				amp3 * exp(-1*pow(((i-center3*4+700))/(width3*7),2))),4))))
		

var dye_array = [
	["Dye 1 1,1’-Diethyl-2,2’-cyanine iodide",[54000, 1, 522, 13.0, 0.6, 490.9, 12.0, 0.198, 460.0, 14.0]],
["Dye 2 1,1’-Diethyl-2,2’-carbocyanine iodide",[128000, 1, 605.0, 13.0, 0.446, 561.0, 15.0, 0.092, 523.0, 14.0]],
["Dye 3 1,1’-Diethyl-2,2’-dicarbocyanine iodide",[227000, 1, 708.0, 20.0, 0.352, 653.0, 20.0, 0.076, 604.0, 20.0]],
["Dye 4 3,3’-Diethylthiacyanine iodide",[75000, 1, 422, 9.0, 0.324, 400.0, 10.0, 0.14, 370.0, 20.0]],
["Dye 5 3,3’-Diethylthiacarbocyanine iodide",[161000, 1, 557.0, 12.0, 0.382, 527.5, 11.0, 0.102, 502.0, 25.0]],
["Dye 6 3,3’-Diethylthiadicarbocyanine iodide",[249000,1, 650, 15.0, 0.276, 620, 25.0, 0.086, 580, 35.0]],
["Dye 7 3,3’-Diethylthiatricarbocyanine iodide",[212000, 1, 762, 25.0, 0.276, 700.0, 25.0, 0.086, 626.0, 35.0]],
["Dye 8 1,1’diethyl-2,2’-tricarbocyanine iodide",[149000, 1, 808, 10.0, 0.5, 770, 9.0, 0.134, 760, 10.0]],
["Dye 9 1,1’diethyl-5,6,5’,6’-dibenz-2,2’-cyanine iodide",[237000, 1, 553, 15.0, 0.32, 510, 15.0, 0.134, 470, 10.0]],
["Dye 10 1,1’diethyl-5,6,5’,6’-dibenz-2,2’-carbocyanine iodide",[220010, 1, 635, 20.0, 0.282, 595, 25.0, 0.007, 542, 25.0]],
["Dye 11 1,1’diethyl-5,6,5’,6’-dibenz-2,2’-dicarbocyanine iodide",[133000, 1, 738, 12.0, 0.606, 710, 12.0, 0.218, 670, 12.0]],
["Dye 12 2,2’-Diethyl-3,4,3’,4’-dibenzthiacyanine iodide",[200010, 1, 456, 15.0, 0.382, 400, 15.0, 0.076, 360, 15.0]],
["Dye 13 2,2’-Diethyl-3,4,3’,4’-dibenzthiacarbocyanine iodide",[240000, 1, 597, 25.0, 0.304, 560, 25.0, 0.102, 520, 25.0]],
["Dye 14 2,2’-Diethyl-3,4,3’,4’-dibenzthiadicarbocyanine iodide",[194000, 1, 691, 25.0, 0.304, 650, 25.0, 0.102, 600, 25.0]],
["Dye 15 2,2’-Diethyl-3,4,3’,4’-dibenzthiatricarbocyanine iodide",[75000, 1, 800, 15.0, 0.324, 760, 20.0, 0.14, 720, 20.0]],
["Dye 16 2,2’-Diethyl-5,6,5’,6’-dibenzthiacyanine iodide",[211000, 1, 453, 17.0, 0.208, 410, 20.0, 0.038, 370, 20.0]],
["Dye 17 2,2’-Diethyl-5,6,5’,6’-dibenzthiacarbocyanine iodide",[213000, 1, 593, 25.0, 0.25, 560, 25.0, 0.02, 510, 25.0]],
["Dye 18 2,2’-Diethyl-5,6,5’,6’-dibenzthiadicarbocyanine iodide",[138010, 1, 687, 13.0, 0.352, 930, 10.0, 0.118, 890, 15.0]],
["Dye 19 2,2’-Diethyl-5,6,5’,6’-dibenzthiatricarbocyanine iodide",[68000, 1, 797, 13.0, 0.352, 770, 10.0, 0.118, 740, 15.0]],
["Dye 20 2,2’-Diethyloxacyanine iodide",[54000, 1, 372, 13.0, 0.6, 340, 12.0, 0.198, 310, 14.0]],
["Dye 21 2,2’-Diethyloxacarbocyanine iodide",[128000, 1, 485, 13.0, 0.446, 440, 15.0, 0.092, 400, 14.0]],
["Dye 22 2,2’-Diethyloxadicarbocyanine iodide",[227000, 1, 580, 20.0, 0.352, 540, 20.0, 0.076, 510, 20.0]],
["Dye 23 2,2’-Diethyloxatricarbocyanine iodide",[75000, 1, 684, 9.0, 0.324, 650, 10.0, 0.14, 620, 20.0]],
["Dye 24 2,2’-Diethyl-3,4,3’4’-dibenzoxacyanine iodide",[161000, 1, 402, 12.0, 0.382, 360, 11.0, 0.102, 320, 25.0]],
["Dye 25 2,2’-Diethyl-3,4,3’4’-dibenzoxacarbocyanine iodide",[249000,1, 513, 15.0, 0.276, 480, 25.0, 0.086, 440, 35.0]],
["Dye 26 2,2’-Diethyl-3,4,3’4’-dibenzoxadicarbocyanine iodide",[212000, 1, 606, 25.0, 0.276, 570, 25.0, 0.086, 530, 35.0]],
["Dye 27 2,2’-Diethyl-5,6,5’,6’-dibenzoxacyanine iodide",[149000, 1, 395, 10.0, 0.5, 365, 9.0, 0.134, 330, 10.0]],
["Dye 28 2,2’-Diethyl-5,6,5’,6’-dibenzoxacarbocyanine iodide",[237000, 1, 515, 15.0, 0.32, 470, 15.0, 0.134, 430, 10.0]],
["Dye 29 2,2’-Diethyl-5,6,5’,6’-dibenzoxadicarbocyanine iodide",[220010, 1, 608, 20.0, 0.282, 560, 25.0, 0.007, 530, 25.0]],
["Dye 30 2,2’-Diethylselenacyanine iodide",[133000, 1, 429, 12.0, 0.606, 400, 12.0, 0.218, 360, 12.0]],
["Dye 31 2,2’-Diethylselenacarbocyanine iodide",[200010, 1, 570, 15.0, 0.382, 540, 15.0, 0.076, 500, 15.0]],
["Dye 32 2,2’-Diethylselenadicarbocyanine iodide",[240000, 1, 660, 25.0, 0.304, 640, 25.0, 0.102, 600, 25.0]],
["Dye 33 2,2’-Diethylselenatricarbocyanine iodide",[194000, 1, 770, 25.0, 0.304, 735, 25.0, 0.102, 690, 25.0]],
["Dye 34 3,3,3’,3’-Tetramethyl-1,1’-diethylindocarbocyanine iodide",[75000, 1, 545, 15.0, 0.324, 500, 20.0, 0.14, 460, 20.0]],
["Dye 35 3,3,3’,3’-Tetramethyl-1,1’-diethylindodicarbocyanine iodide",[211000, 1, 636, 17.0, 0.208, 620, 20.0, 0.038, 580, 20.0]],
["Dye 36 3,3,3’,3’-Tetramethyl-1,1’-diethylindotricarbocyanine iodide",[213000, 1, 745, 25.0, 0.25, 710, 25.0, 0.02, 680, 25.0]],
["Dye 37 1,1’-Diethyl-4,4’-cyanine iodide",[138010, 1, 593, 13.0, 0.352, 560, 10.0, 0.118, 520, 15.0]],
["Dye 38 1,1’-Diethyl-4,4’-carbocyanine iodide",[68000, 1, 704, 13.0, 0.352, 675, 10.0, 0.118, 620, 15.0]],
["Dye 39 1,1’-Diethyl-4,4’-dicarbocyanine iodide",[138010, 1, 810, 13.0, 0.352, 780, 10.0, 0.118, 740, 15.0]],
["Dye 40 1,1’-Diethyl-4,4’-tricarbocyanine iodide",[68000, 1, 932, 13.0, 0.352, 900, 10.0, 0.118, 870, 15.0]]]

# Called when the node enters the scene tree for the first time.
func _ready():
	drawPlot("plot")
	#add_items()
	Dropdown.connect("item_selected", self, "on_item_selected")
	add_dye_items()
	
	
func add_dye_items():
	for item in dye_array:
		Dropdown.add_item(item[0])
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	drawPlot("plot")
	
	
func on_item_selected(dye):
	#print(str(Dropdown.get_item_text(dye)))
	#print(dye_array[dye][0])
	set_dye(dye_array[dye][1])
	vol_dye=0
	vol_solvent=1
	
func _on_Save_pressed():
	$FileDialog.popup()

func _on_FileDialog_file_selected(path):
	var f = File.new()
	f.open(path+".csv", 2)
	for i in range(1,8000):
		f.store_csv_line(PoolStringArray([199.9+i*0.1, 0.01*(vol_dye/(vol_dye+vol_solvent))*0.001*(
		
			amp1 * exp(-1*pow(((192+i*0.1-center1))/(width1*2),2)) +
			amp2 * exp(-1*pow(((192+i*0.1-center2))/(width2*2),2)) + 
			amp3 * exp(-1*pow(((192+i*0.1-center3))/(width3*2),2))) +
		
		0.0005*rand_range(
				-30 -
				pow(vol_dye/(vol_dye+vol_solvent)*0.000035*(amp1 * exp(-1*pow(((199.9+i*0.1-center1))/(width1*2),2)) + 
				amp2 * exp(-1*pow(((199.9+i*0.1-center2))/(width2*2),2)) + 
				amp3 * exp(-1*pow(((199.9+i*0.1-center3))/(width3*2),2))),4),
				30 +
				pow(vol_dye/(vol_dye+vol_solvent)*0.000035*(amp1 * exp(-1*pow(((199.9+i*0.1-center1))/(width1*2),2)) + 
				amp2 * exp(-1*pow(((199.9+i*0.1-center2))/(width2*2),2)) + 
				amp3 * exp(-1*pow(((199.9+i*0.1-center3))/(width3*2),2))),4))]))
		
	f.close()

#f.store_csv_line(PoolStringArray([349.9+i*0.1, 
#			amp1 * exp(-1*pow(((i*0.1+349.9-center1))/(width1*2),2))*0.01*0.1*vol_dye/(vol_dye+vol_solvent) + 
#			amp2 * exp(-1*pow(((i*0.1+349.9-center2))/(width2*2),2))*0.01*0.1*vol_dye/(vol_dye+vol_solvent) + 
#			amp3 * exp(-1*pow(((i*0.1+349.9-center3))/(width3*2),2))*0.01*0.1*vol_dye/(vol_dye+vol_solvent) + 
			
#			rand_range(
#				-0.02 -
#				pow(0.6*(amp1 * exp(-1*pow(((i*0.1+349.9-center1))/(width1*2),2))*0.01*vol_dye/(vol_dye+vol_solvent) + 
#				amp2 * exp(-1*pow(((i*0.1+349.9-center2))/(width2*2),2))*0.01*vol_dye/(vol_dye+vol_solvent) + 
#				amp3 * exp(-1*pow(((i*0.1+349.9-center3))/(width3*2),2))*0.01*vol_dye/(vol_dye+vol_solvent)),4),
#				0.02 +
#				pow(0.6*(amp1 * exp(-1*pow(((i*0.1+349.9-center1))/(width1*2),2))*0.01*vol_dye/(vol_dye+vol_solvent) + 
#				amp2 * exp(-1*pow(((i*0.1+349.9-center2))/(width2*2),2))*0.01*vol_dye/(vol_dye+vol_solvent) + 
#				amp3 * exp(-1*pow(((i*0.1+349.9-center3))/(width3*2),2))*0.01*vol_dye/(vol_dye+vol_solvent)),4))]))


func _on_Make_Solution_pressed():
	vol_dye = get_node("dye_box").value
	vol_solvent = get_node("solvent_box").value
	if vol_dye + vol_solvent < 200:
		OS.alert("The total volume must be at least 200 microliters","Error")
		vol_dye = 0
		vol_solvent = 1
	
	
	print(vol_dye)
	print(vol_solvent)
	
	
	
	pass # Replace with function body.


	

