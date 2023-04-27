// I apologize for the lack of comments if you're trying read through it and understand it as is
//i rushed the code out code out as quickly as i could to finish as quickly as i could so i had no time for comments really
//please note that as such there are several variables that either have no use or are pointless
//and also that its super buggy and an absolute mess that needs optimizing
//currently speaking its buggy against foes that have their bodystatus as intangible
//and also it gets quite glitchy with more than 1 ball interacting with each other
//or some unfixable bugs like the rhythm doctor assist (or assists in general) being able to target the ball and take ownership

var X_SPEED = 2; // X speed of water
var Y_SPEED = -12; // Y Speed of water
var bounceheight:Float = 0;
var bouncespeed:Float = 1.5;
var playerdir:Int = 1;
var bouncehitdelay:Int = 25;
var currentbounces:Int = 14;

// Instance vars
var life = self.makeInt(60 * 5);
var currentowner = self.getOwner();
var playervar = self.getOwner();

//gold vfx variables
var canSpawnSparkles:Bool = true;
var timeBetweenSparkles:Int = 8;
var currentTimeBetweenSparkles = timeBetweenSparkles;

var hasHitTarget:Bool = false;

function initialize(){
	currentbounces = playervar.exports.bouncesLeft.get();

	if (self.getOwner().getCostumeIndex() == 11){
		self.playAnimation("projectileIdle_gold");
	}

	if (self.getOwner().isFacingLeft()) {
		playerdir = -1;
		//Engine.log("facing left");
	}
	if (self.getOwner().isFacingRight()) {
		playerdir = 1;
		//Engine.log("facing right");
	}
	self.addTimer(1,1,shootStart); // now this may look dumb but, fraymakers sucks at having things done at frame 1 so i need to do things on frame 2 instead and as such there's a carp load of these here, good game.
	self.addEventListener(EntityEvent.COLLIDE_FLOOR, onGroundHit, { persistent: true });
	self.addEventListener(GameObjectEvent.HIT_RECEIVED, onselfhit, { persistent: true });
	self.addEventListener(GameObjectEvent.HIT_DEALT, onballhit, {persistent: true} );
	self.addEventListener(GameObjectEvent.REFLECTED, onballreflect, {persistent: true} );

	self.setCostumeIndex(self.getOwner().getCostumeIndex());
	
    // Set up horizontal reflection
	Common.enableReflectionListener({ mode: "X", replaceOwner: true });

	self.setState(PState.ACTIVE);
}

function shootStart(){
	//honestly i have no idea why this only works like this but it only works like this
	bouncespeed = bouncespeed * (playerdir);
	self.setXSpeed(bouncespeed * (playerdir));
	//Engine.log(playerdir);
	self.setYSpeed(Y_SPEED);
	self.addTimer(1,1, resetowner);
}

function resetowner(){
	self.setOwner(null);
}

function onGroundHit(event) {
	self.setYSpeed((bounceheight * (-1)) / 1.25);
	currentbounces--; //i don't hate this being here but i don't like it either, my fear is that without it the move is too broken and with it its too weak
}

function onselfhit(event) {
	Engine.log(event.data.foe);
	currentowner = event.data.foe;
	bouncespeed = self.getXKnockback() / 1.5;
	bounceheight = self.getYKnockback() / 1.5;
	currentbounces--;
}

function onballhit(getballhitter) {
	//every once in a while the it detects its hitting a target but the hitbox is not activating quickly enough to be relevent
	//this is most definitely because its activating the hitbox on the next frame, so if the velocity is high enough it could potentially be quick enough to activate the hitbox outside of the opponent's hurtbox, shouldn't happen often hopefully
	//Engine.log(getballhitter.data.foe);
	//Engine.log(currentowner);
	if (getballhitter.data.foe == currentowner){
		//Engine.log("Hitting Owner");
		self.updateHitboxStats(0, {
			disabled: true
		});
	} else {
		if (!hasHitTarget){
			self.setOwner(currentowner);
			//Engine.log("Not Hitting Owner");
			//self.setXVelocity(self.getXVelocity() * (-1));
			//hasHitTarget = true;
			self.addTimer(1,1,resetOnHit); //this is what we in the business call a "fuck you, it works"
		};
	};
}

function resetOnHit(){
	self.updateHitboxStats(0, {
		disabled: false
	});
	self.reactivateHitboxes();
	//self.setXVelocity(0);
	bouncespeed = bouncespeed * (-1);
	self.setKnockback(0);
	//self.setXVelocity(self.getXVelocity() * (-1));
	//self.setXVelocity(self.getXVelocity() * (-1)); //ball go brrr //also very inconsistent
	self.setYVelocity(self.getYVelocity() * (-1)); //ball go brrr //also very inconsistent
	hasHitTarget = true;
	self.addTimer(1,1,resetOnHit2);
	//hasHitTarget = false;
	bouncehitdelay = 25;
	currentbounces--;
}

function resetOnHit2(){ //what do you call this thing?
	self.updateHitboxStats(0, {
		disabled: true
	});
	self.setOwner(null);
}

function onballreflect(){
	//this exists, and that's the most i can say about it, i have no idea how to properly reflect the ball so i'm leaving it as is
	self.addTimer(1,1, onballreflect2); //when a projectile is reflected it sets the owner to the one reflecting... or it least i think that's what happening i have no idea
	//Engine.log("being reflected");
	//bouncespeed = bouncespeed * (-1);
}

function onballreflect2(){
	self.setOwner(null);
	bouncespeed = bouncespeed * (-1);
	self.setYVelocity(self.getYVelocity() * (-1));
}


function update() {//every frame
	if (playervar.getCostumeIndex() == 11){
		spawnSparkles();
	}
	playervar.exports.bouncesLeft.set(currentbounces);
	//Engine.log(currentowner.exports.bouncesLeft.get());

	if (bouncehitdelay > 0){
		bouncehitdelay--;
	}

	if (bouncehitdelay == 0) {
		hasHitTarget = false;
		self.reactivateHitboxes();
	}
	self.setXVelocity(bouncespeed); //since hitting the ball stops its momentum, this just makes sure its alway moving

	if (currentbounces == 0){
		self.destroy();
	}

	if (self.getYVelocity() > 0 || self.getYVelocity() < 0 ) {
		bounceheight = self.getYVelocity();
	}

}

function onTeardown() {
	playervar.exports.ballExists.set(false);
	playervar.exports.bouncesLeft.set(14);
	//self.removeEventListener(EntityEvent.COLLIDE_FLOOR, onGroundHit);
	//self.removeEventListener(GameObjectEvent.HIT_DEALT, onHit);
}

function spawnSparkles(){
    if (canSpawnSparkles == true){
        match.createVfx(new VfxStats({spriteContent: "global::vfx.vfx", animation: "vfx_gold_sparkle", x: Random.getFloat(-18,18), y: Random.getFloat(-32,0) }), self);
        canSpawnSparkles = false;
    }

    if(currentTimeBetweenSparkles > 0){
        currentTimeBetweenSparkles--;
    }

    if (currentTimeBetweenSparkles == 0){
        canSpawnSparkles = true;
        currentTimeBetweenSparkles = timeBetweenSparkles;
    }
}