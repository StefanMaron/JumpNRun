extends Node

var points = 0
@onready var points_label = %points_Label

func getPoints():
	return points

func addPoints(pointsToAdd):
	points += pointsToAdd
	points_label.text = "Points: " + str(points)
