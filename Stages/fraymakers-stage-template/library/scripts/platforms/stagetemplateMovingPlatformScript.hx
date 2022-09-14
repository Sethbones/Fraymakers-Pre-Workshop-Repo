// Script for Stage Template moving platform beneath the stage

var startX = 0;
var movingRight = self.makeBool(true);
var MOVE_DISTANCE = 550 * 2 - 237;

function initialize(){
	startX = self.getX();
}

function onTeardown(){
	sprite.get().dispose();
	sprite.set(null);
}

function update(){
	if (movingRight.get()){
		self.setX(self.getX() + 1);
		if (self.getX() >= startX + MOVE_DISTANCE){
			movingRight.set(false);
		}
	}else{
		self.setX(self.getX() - 1);
		if (self.getX() <= startX){
			movingRight.set(true);
		}
	}
}
