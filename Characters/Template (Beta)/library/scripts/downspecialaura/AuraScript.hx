//this script is for the effect itself of the down special, if you want the spawn code of it go to character -> Script.hx
var AURACOOLDOWN = 750; //60 frames = 1 second //lasts for 12.5 seconds

var auracooldown = self.makeInt(AURACOOLDOWN);

var projcontainer = self.getViewRootContainer();


function initialize(){
	self.getOwner().addEventListener(GameObjectEvent.HIT_DEALT, ondamage, { persistent: true }); //checks for when an entity is hit
	stage.getCharactersBackContainer().addChild(projcontainer); //sets aura behind the character
	self.getOwner().addStatusEffect(6, 2); //applies damage boost
}


function ondamage(event) {
	//Engine.log("opponent Damaged");
	self.destroy(); //destroys object
}

function update() {
	auracooldown.dec();

	if (auracooldown.get() <= 0){
		self.destroy(); //destroys object
	}

	var ownerx = self.getOwner().getX(); //get character x position
	var ownery = self.getOwner().getY(); //get character y position

	self.setX(ownerx); //sets aura x position to user x position
	self.setY(ownery); //sets aura y position to user y position
}

function onTeardown() {
	self.getOwner().addStatusEffect(6, 0.5);  //removeStatusEffect doesn't work for some reason, so addStatusEffect is repeated backwards to normalize damage
}