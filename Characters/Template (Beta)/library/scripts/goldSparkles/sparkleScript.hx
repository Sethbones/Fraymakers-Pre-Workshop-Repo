//this script is for the sparkles

function update() {
    //get its current position
	var sparkownerx = self.getOwner().getX();
	var sparkownery = self.getOwner().getY();

    //set to its current position
	self.setX(sparkownerx);
	self.setY(sparkownery);
}