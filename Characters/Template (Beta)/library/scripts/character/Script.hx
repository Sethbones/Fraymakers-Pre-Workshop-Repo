//general character script

//var AURACOOLDOWN = 0;
//var CANACTIVATEAURA = true;
var SPAWNPROJ = 0;
var PROJCOUNT = 0;
var canspawndeatheffect:Bool = true;
var test:Bool = false;

//var auracooldown = self.makeInt(AURACOOLDOWN);
//var canactivateaura = self.makeBool(CANACTIVATEAURA); useless for now 
var spawnproj = self.makeInt(SPAWNPROJ);
var projcount = self.makeInt(PROJCOUNT);


function initialize(){//on match start
    Engine.log("Char init"); //to check if script broke completely
    match.createProjectile(self.getResource().getContent("aurameter"), self);

    //check for costume and spawn the sparkles
    if (self.getCostumeIndex() == 9){
        match.createProjectile(self.getResource().getContent("goldpSparkles"), self);
    }
    //Engine.log(dustVfx); //specifying does cause the character to start in jump_loop
}

function update() {//every frame after match start
    //generateDashDust(GlobalVfx.KO_BLAST);
    //self.updateCharacterStats({ledgeJumpXSpeed, ledgeJumpYSpeed})
    //applyLedgeJumpSpeed(true);
    //applyLedgeJumpSpeed(-10);
    //applyLedgeJumpSpeed([-10, 2]);
    //applyLedgeJumpSpeed();
    //applyLedgeJumpSpeed({ledgeJumpXSpeed, ledgeJumpYSpeed}); //crashes script
    //applyLedgeJumpSpeed(self.setYSpeed(-30), self.setXSpeed(15));
    //applyLedgeJumpSpeed(self.getCharacterStat("ledgeJumpXSpeed"), self.getCharacterStat("ledgeJumpYSpeed"));
    if (self.inState(CState.REVIVAL)){ //things to reset on respawn
        Engine.log("undeads your character");
        canspawndeatheffect = true;
    }

    //aura creation code
    //old
    //this is basically a worse version of shaggy's netural special from multiversus, note that this part controls cooldown and creating the aura while the graphics are controlled by the aura's script file
   //if (auracooldown.get() == 0){
        //if (self.inState(CState.SPECIAL_DOWN)){//check if in down special
            //match.createProjectile(self.getResource().getContent("Aura"), self);
            //AudioClip.play("auraburst");
            //auracooldown.set(1500); ////60 frames = 1 second //lasts for 25 seconds
        //}
   //}
    //else {
        //auracooldown.dec();
        //if (auracooldown.get() <= 0){
            //auracooldown.set(0);
        //}
    //}

    //gold alt stuff, there's probably a better way to do this
    if (self.getCostumeIndex() == 9){ //checks costume id
        if (self.inState(CState.STAND)){ //checks state
            self.playAnimation("stand_gold"); //plays the animation when everything matches //if you have more than one frame playing you might need a bool to check if the animation is playing or not but my character's idle is currently one frame so there's no need
        }
    }

    if (self.inState(CState.KO)){ //ko effect spawning thing
        if (canspawndeatheffect == true){
            match.createProjectile(self.getResource().getContent("koeffect"), self);
            canspawndeatheffect = false; //so it won't go berserk and spawn 20
        }   
    }
}


function onTeardown(){ //on losing all stocks //note that if you need something to reset on respawn check for if (self.instate(CState.REVIVAL)) in update() instead

}