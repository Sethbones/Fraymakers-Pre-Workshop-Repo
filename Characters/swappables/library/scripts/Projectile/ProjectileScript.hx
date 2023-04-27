// Projectile Controller Script
// Basically All Projectiles are proccessed through here
// this is so there's no need for 50 projectiles, just the one
// to explain how this works it plays an animation based on current animation playing on the owner when spawned
// so basically if an animation named special_neutral_blue is played it plays fireball animation and stats
// contemplating between doing everything in functions or in update()
// honestly this might not work
// i'm thinking of just saying fuck it and making 50 projectiles

var X_SPEED = 7; // X speed of water
var Y_SPEED = -7; // Y Speed of water

// Instance vars
var life = self.makeInt(60 * 5);
var originalOwner = null;

function initialize(){
	//if (self.getOwner().playFrameLabel()){
		//Engine.log("fucking");
	//}
	self.addEventListener(EntityEvent.COLLIDE_FLOOR, onGroundHit, { persistent: true });
	self.addEventListener(GameObjectEvent.HIT_DEALT, onHit, { persistent: true });

	self.setCostumeIndex(self.getOwner().getCostumeIndex());
	
    // Set up horizontal reflection
	Common.enableReflectionListener({ mode: "X", replaceOwner: true });

	self.setState(PState.ACTIVE);

	//self.setXSpeed(X_SPEED);
	//self.setYSpeed(Y_SPEED);
}

function onGroundHit(event) {
	self.removeEventListener(EntityEvent.COLLIDE_FLOOR, onGroundHit);
	self.removeEventListener(GameObjectEvent.HIT_DEALT, onHit);

	self.toState(PState.DESTROYING);
}

function onHit(event) {
	self.removeEventListener(EntityEvent.COLLIDE_FLOOR, onGroundHit);
	self.removeEventListener(GameObjectEvent.HIT_DEALT, onHit);

	self.toState(PState.DESTROYING);
}

function update() {
	if (self.inState(PState.ACTIVE)) {
		life.dec();
		if (life.get() <= 0) {
			self.removeEventListener(EntityEvent.COLLIDE_FLOOR, onGroundHit);
			self.removeEventListener(GameObjectEvent.HIT_DEALT, onHit);
			self.toState(PState.DESTROYING);
		}
	}
}

function onTeardown() {
	self.removeEventListener(EntityEvent.COLLIDE_FLOOR, onGroundHit);
	self.removeEventListener(GameObjectEvent.HIT_DEALT, onHit);
}