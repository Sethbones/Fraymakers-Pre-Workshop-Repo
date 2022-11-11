//this script is for the effect itself of the down special, if you want the spawn code of it go to character -> Script.hx
//so basically any variable created outside of functions is only usable within the current object, so basically for now putting variables in update and variables outside of functions basically do the same thing
//what this means for this is that the effect has to act seperately with it's own timer instead of everything being connected to a single timed variable in the player script. i love this game, it hates every good idea i throw at it and forces me to create hacky workarounds for hacky workarounds.

var AURACOOLDOWN = 750; //60 frames = 1 second //lasts for 12.5 seconds

var auracooldown = self.makeInt(AURACOOLDOWN);

var projcontainer = self.getViewRootContainer();


function initialize(){
	//required for projectile colors because inheritPalette is broken or too undocumented to be useful
	self.setCostumeIndex(self.getOwner().getCostumeIndex());

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