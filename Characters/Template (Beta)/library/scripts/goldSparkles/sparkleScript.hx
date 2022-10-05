//this script is for the sparkles

var sparkownerx = self.getOwner().getX();
var sparkownery = self.getOwner().getY();


function initialize(){
}

function update() {
    //get its current position
	sparkownerx = self.getOwner().getX();
	sparkownery = self.getOwner().getY();

    //set to its current position
	self.setX(sparkownerx);
	self.setY(sparkownery);
}

function onTeardown() {
}