import RPi.GPIO as GPIO
GPIO.setmode(GPIO.BOARD)

class gpkey:
	def __init__(self,name, channel):
		self.name=name
		self.channel=channel
	
	
		
LEFT=gpkey('LEFT', 18)
RIGHT=gpkey('RIGHT', 19)
UP=gpkey('UP', 20)
DOWN=gpkey('DOWN', 21)
GKKEYS=[LEFT, RIGHT, UP, DOWN]

for gkey in GKKEYS:
	print "Trying to set:", gkey.channel
	GPIO.setup(gkey.channel, GPIO.OUT)

