//this script is just for the effect, if you want the actual code of it go to character -> Script.hx
var LIFE_TIMER = 60 * 4; // max life of projectile
var AURACOOLDOWN = 750;

var auracooldown = self.makeInt(AURACOOLDOWN);

var ownerx = self.getOwner().getX();
var ownery = self.getOwner().getY();
var projcontainer = self.getViewRootContainer();


//var auradamage = self.makeInt(AURADAMAGE);


function initialize(){
	self.getOwner().addEventListener(GameObjectEvent.HIT_DEALT, ondamage, { persistent: true }); //people told me to use this for some reason
	stage.getCharactersBackContainer().addChild(projcontainer);
	self.getOwner().addStatusEffect(6, 2);
}


function ondamage(event) {
	//Engine.log("opponent Damaged");
	//self.getOwner().addStatusEffect(6, 0.5); //i have no idea how to use removestatuseffect so i do this instead
	self.destroy();
}

function update() {
	auracooldown.dec();

	if (auracooldown.get() <= 0){
		//self.getOwner().addStatusEffect(6, 0.5);
		self.destroy();
	}

	ownerx = self.getOwner().getX();
	ownery = self.getOwner().getY();

	self.setX(ownerx);
	self.setY(ownery);
}

function onTeardown() {
	self.getOwner().addStatusEffect(6, 0.5);
}