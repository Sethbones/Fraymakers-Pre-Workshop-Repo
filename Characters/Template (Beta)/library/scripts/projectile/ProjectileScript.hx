// API Script for Assist Template Projectile
//this creates a missile like projectile, basically accelerating from 0 to 15, doesn't really make much sense considering the recoil, but it looks cool

var LIFE_TIMER = 60 * 4; // max life of projectile
var PROJECTILE_SPEED = 0; //starts at 0
var MAX_SPEED = 25;

var life = self.makeInt(LIFE_TIMER);
var projectile_speed = self.makeInt(PROJECTILE_SPEED);
var max_speed = self.makeInt(MAX_SPEED);

function initialize(){ //on projectile spawn

	//required for projectile colors because inheritPalette is broken or too undocumented to be useful
	self.setCostumeIndex(self.getOwner().getCostumeIndex());

	// Set up wall hit event
	self.addEventListener(EntityEvent.COLLIDE_WALL, onWallHit, { persistent: true });

	// Set up horizontal reflection
	enableReflectionListener({ mode: "X", replaceOwner: true });

	//break on opponent hit TODO
	self.addEventListener(GameObjectEvent.HIT_DEALT, onhit, { persistent: true });

}

function onWallHit(event) {
	self.destroy();
}

function onhit(event) {
	//Engine.log("fuck"); //what late night coding does to a mf
	self.destroy();

}

function update() {//check every frame after it has spawned
	if (self.inState(PState.ACTIVE)) {
		// Give some horizontal speed
		
		self.setXSpeed(projectile_speed.get());
		//Engine.log(projectile_speed.get());

		// Subtract 1 from life counter
		life.dec();
		projectile_speed.inc(0.1); //supposed to increase speed by 0.1 but that doesn't work cause i'm doing this incorrectly 

		//if (projectile_speed.get() >= max_speed.get()) {
			//projectile_speed.set(max_speed);
		//}

		// If life runs out, destroy
		if (life.get() <= 0) {
			self.destroy();
		}
	}
}
function onTeardown(){//when the projectile dissapears
}