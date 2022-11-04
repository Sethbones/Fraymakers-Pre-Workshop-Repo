//general character script

var AURACOOLDOWN = 0;
//var CANACTIVATEAURA = true;
var SPAWNPROJ = 0;
var PROJCOUNT = 0;

var auracooldown = self.makeInt(AURACOOLDOWN);
//var canactivateaura = self.makeBool(CANACTIVATEAURA); useless for now 
var spawnproj = self.makeInt(SPAWNPROJ);
var projcount = self.makeInt(PROJCOUNT);


function initialize(){//on match start
    //debug things
    //Engine.log("Char init");
    //Engine.log(self.getCostumeIndex());


    //check for costume and spawn the sparkles
    if (self.getCostumeIndex() == 9){
        match.createProjectile(self.getResource().getContent("goldpSparkles"), self);
    }
    //self.addEventListener(GameObjectEvent.HIT_DEALT, jabswitch, { persistent: true});
}

//function jabswitch(){ //here untill official character template
//    if (self.inState(CState.JAB)){
//        Engine.log("well at least this works");
//        self.updateAnimationStats // how do you use this there's no documentation on this
//        if (ControlsObject.determinePressedControls (ATTACK, ATTACK)){
//            Engine.log("Switch jabs");
//        }
//    }
//}



function update() {//every frame after match start
    //Engine.log(auracooldown.get()); //enable this if you need a visual indicator for aura cooldown
    //aura creation code
    //this is basically a worse version of shaggy's netural special from multiversus, note that this part controls cooldown and creating the aura
    if (auracooldown.get() == 0){
        if (self.inState(CState.SPECIAL_DOWN)){
            //Engine.log("fuckign");
            //match.createProjectile("TemplateProjectile", self());
            //match.createProjectile("Aura", self()); //note to self, do not code at 2 am, i typed self with () without noticing
            match.createProjectile(self.getResource().getContent("Aura"), self);
            AudioClip.play("auraburst");
            auracooldown.set(1500); ////60 frames = 1 second //lasts for 25 seconds
        }
    }
    else {
        auracooldown.dec();
        if (auracooldown.get() <= 0){
            auracooldown.set(0);
        }
    }
    //gold alt stuff, there's probably a better way to do this
    if (self.getCostumeIndex() == 9){ //checks costume id
        if (self.inState(CState.STAND)){ //checks state
            self.playAnimation("stand_gold"); //plays the animation when everything matches
        }
    }
}
//ko effect spawn code //might not be the most efficient code ever but i never claimed to be a good programmer //currently broken til i can A find a solution or B wait for non script local variables
//cause as it stands its either waiting for that or creating 8 seperate projectiles each with their own direction speed
//    if (self.inState(CState.KO)){
//        if (spawnproj.get() == 0){
//            match.createProjectile("koEffect");
//            spawnproj.set(1);
//        }
//        else if (spawnproj.get() == 1){
//            match.createProjectile("koEffect");
//            spawnproj.set(2);
//        }
//        else if (spawnproj.get() == 2){
//            match.createProjectile("koEffect");
//            spawnproj.set(3);
//        }
//        else if (spawnproj.get() == 3){
//            Engine.log("spawn done");
//            spawnproj.set(4);
//        }
//    }
//}


function onTeardown(){ //on losing all stocks //note that if you need something to reset on respawn check for if (self.instate(CState.REVIVAL)) in update() instead

}

