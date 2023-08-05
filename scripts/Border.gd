extends Spatial

export var numBodies = 600
export var squareSize = 80
export var bodyScene = preload("res://scenes/Anti-tank hedgehog.tscn")

func _ready():
	for i in range(numBodies):
		randomize()
		var newBody = bodyScene.instance()
		add_child(newBody)
		
		var posX = 0.0
		var posY = 0.0
		var posZ = 0.0
		
		var side = round(rand_range(0, 3))
		var edgePos = rand_range(-squareSize/2, squareSize/2)
		# print("side",side)
		# print("edgePos",edgePos)
		if side==0:
			posX = edgePos
			posZ = -squareSize/2
		elif side==1:
			posX = edgePos
			posZ = squareSize/2
		elif side==2:
			posX = -squareSize/2
			posZ = edgePos
		elif side==3:
			posX = squareSize/2
			posZ = edgePos
		
		newBody.translation = Vector3(posX, posY, posZ)
		# print(round(posX),round(posY),round(posZ))
