//Script for a projectile that comes out when the player is ko'd
//this creates 8 projectiles each going in seperate directions

var AURACOOLDOWN = 0;

var auracooldown = self.makeInt(AURACOOLDOWN);
var metercontainer = self.getViewRootContainer();
var animationlimit:Bool = false; //so the animation doesn't restart itself

function initialize(){
    //required for projectile colors because inheritPalette is broken or too undocumented to be useful
	self.setCostumeIndex(self.getOwner().getCostumeIndex());
    self.getOwner().getDamageCounterContainer().addChild(metercontainer);
    self.setX(self.getX() + 88); //offsets be wildin
    self.setY(self.getY() - 10);
    Engine.log("meter init");

    self.getOwner().addEventListener(GameObjectEvent.HIT_DEALT, metereset, { persistent: true });
}

function metereset(event) {
    if (self.getAnimation() == "meter_full"){
        self.playAnimation("meter_empty");
        animationlimit = false;
    }
}


function update() {

    if (self.getOwner().inState(CState.REVIVAL)){ //things to reset on respawn
        //auracooldown.set(0);
        self.playAnimation("meter_start");
        animationlimit = false;
    }
    //aura creation code
    //this is basically a worse version of shaggy's netural special from multiversus, note that this part controls cooldown and creating the aura while the graphics are controlled by the aura's script file
    if (self.getAnimation() == "meter_start"){ //auracooldown.get() == 0
        if (self.getOwner().inState(CState.SPECIAL_DOWN)){//check if in down special
            if (animationlimit == false){
                match.createProjectile(self.getOwner().getResource().getContent("Aura"), self.getOwner());
                AudioClip.play("auraburst");
                self.playAnimation("meter_full");
                animationlimit = true;
            }
            //auracooldown.set(1500); ////60 frames = 1 second //lasts for 25 seconds
        }
    }
    else if (self.getAnimation() == "meter_full"){
        if (self.finalFramePlayed()){
            if (animationlimit == true){
                self.playAnimation("meter_empty");
                animationlimit = false;
            }
        }
    }
    else if (self.getAnimation() == "meter_empty"){
        if (self.finalFramePlayed()){
            self.playAnimation("meter_start");
        }
    }
}

function onTeardown(){
}