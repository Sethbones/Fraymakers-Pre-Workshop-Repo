// API Script

//the way to pass variables between scripts
//these are basically the "global" variables another script can access
self.exports = {
    bouncesLeft: self.makeInt(14),
    ballExists: self.makeBool(false)
};

var neutralSpecialProjectile = self.makeObject(null); // Tracks active Neutral Special projectile (in case we need to handle any special cases)

var lastDisabledNSpecStatusEffect = self.makeObject(null);

var lastDisabledDSpecStatusEffect = self.makeObject(null);

var downSpecialLoopCheckTimer = self.makeInt(-1);

//gold vfx variables
var canSpawnSparkles:Bool = true;
var timeBetweenSparkles:Int = 8;
var currentTimeBetweenSparkles = timeBetweenSparkles;

//offset projectile start position
var NSPEC_PROJ_X_OFFSET = 40;
var NSPEC_PROJ_Y_OFFSET = -50;

var DOWN_SPECIAL_COOLDOWN = 65;
var getSelfOwner = self;
// start general functions --- 

//Runs on object init
function initialize(){
    Engine.log(self.getCostumeIndex());
    if (self.getCostumeIndex() == 11){
        //Engine.log("in gold alt");
        self.addEventListener(EntityEvent.STATE_CHANGE, goldAltLogic, {persistent:true});
    }
    match.createProjectile(self.getResource().getContent("cubeyBallIndicator"), self);
    self.addEventListener(GameObjectEvent.LINK_FRAMES, handleLinkFrames, {persistent:true});
    //spawnSparkles();
    
}

function update(){
    if (self.exports.ballExists.get() == false){
        enableNeutralSpecial(); //spamming this every frame is not the most efficient thing ever but hey it works
    }
    if (self.getCostumeIndex() == 11){
        spawnSparkles();
    }
}

function spawnSparkles(){
    if (canSpawnSparkles == true){
        match.createVfx(new VfxStats({spriteContent: "global::vfx.vfx", animation: "vfx_gold_sparkle", x: Random.getFloat(-30,30), y: Random.getFloat(-70,0) }), self);
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

// CState-based handling for LINK_FRAMES
// needed to ensure important code that would be skipped during the transition is still executed
function handleLinkFrames(e){
	if(self.inState(CState.SPECIAL_SIDE)){
		if(self.getCurrentFrame() >= 14){
			self.updateAnimationStats({bodyStatus:BodyStatus.NONE});
		}
	} else if(self.inState(CState.SPECIAL_DOWN)){
        specialDown_resetTimer();
        downSpecialLoopCheckTimer.set(self.addTimer(1, -1, specialDown_checkLoop));    
    }
}

function onTeardown() {
	
}

function goldAltLogic(){
    //Engine.log(self.getState());
    if (self.inState(CState.STAND)){
        self.playAnimation("gold_stand");
    }
}

// --- end general functions

//-----------NEUTRAL SPECIAL-----------

//projectile
function fireNSpecialProjectile(){
    neutralSpecialProjectile.set(match.createProjectile(self.getResource().getContent("CubeyBouncyBall"), self));
    neutralSpecialProjectile.get().setX(self.getX() + self.flipX(NSPEC_PROJ_X_OFFSET));
    neutralSpecialProjectile.get().setY(self.getY() + NSPEC_PROJ_Y_OFFSET);
    self.exports.ballExists.set(true);
}

//cooldown timer

function disableNeutralSpecial(){
    if (lastDisabledNSpecStatusEffect.get() != null) {
        self.removeStatusEffect(StatusEffectType.DISABLE_ACTION, lastDisabledNSpecStatusEffect.get().id);
    }
    lastDisabledNSpecStatusEffect.set(self.addStatusEffect(StatusEffectType.DISABLE_ACTION, CharacterActions.SPECIAL_NEUTRAL));
}

function enableNeutralSpecial(){
    if (lastDisabledNSpecStatusEffect.get() != null) {
        self.removeStatusEffect(StatusEffectType.DISABLE_ACTION, lastDisabledNSpecStatusEffect.get().id);
        lastDisabledNSpecStatusEffect.set(null);
    }
}

//-----------SIDE SPECIAL-----------

//shield hit slowdown 
function sideSpecialShieldHit(){
	self.setXSpeed(-4);
}

//jump cancel hit confirm
function sideSpecialHit(){
	self.updateAnimationStats({allowJump: true});
}

//-----------DOWN SPECIAL-----------

function startDownSpecialCooldown(){
    disableDownSpecial();
    self.addTimer(DOWN_SPECIAL_COOLDOWN, 1, enableDownSpecial, {persistent:true});
}

function enableDownSpecial(){
    if (lastDisabledDSpecStatusEffect.get() != null) {
        self.removeStatusEffect(StatusEffectType.DISABLE_ACTION, lastDisabledDSpecStatusEffect.get().id);
        lastDisabledDSpecStatusEffect.set(null);
    }
}

function disableDownSpecial(){
    if (lastDisabledDSpecStatusEffect.get() != null) {
        self.removeStatusEffect(StatusEffectType.DISABLE_ACTION, lastDisabledDSpecStatusEffect.get().id);
    }
    lastDisabledDSpecStatusEffect.set(self.addStatusEffect(StatusEffectType.DISABLE_ACTION, CharacterActions.SPECIAL_DOWN));
}