//this is basically a worse version of shaggy's netural special from multiversus
var AURACOOLDOWN = 0;
var CANACTIVATEAURA = true;
var SPAWNPROJ = 0;
var PROJCOUNT = 0;

var auracooldown = self.makeInt(AURACOOLDOWN);
var canactivateaura = self.makeBool(CANACTIVATEAURA);
var spawnproj = self.makeInt(SPAWNPROJ);
var projcount = self.makeInt(PROJCOUNT);


function initialize(){//on match start
    //self.addEventListener(EntityEvent.STATE_CHANGE, ondspecial, { persistent: true });
    //self.addStatusEffect(13, 10)
    Engine.log("Char init");
    Engine.log(self.getCostumeIndex());

    //check for costume and spawn the sparkles
    if (self.getCostumeIndex() == 9){
        match.createProjectile("goldpSparkles", self);
    }
}

//function ondspecial() {
    //Engine.log("indspecial");
//}

function update() {//every frame after match start
    //Engine.log(spawnproj.get());
    //Engine.log(auracooldown.get());

    //aura creation code
    if (auracooldown.get() == 0){
        if (self.inState(CState.SPECIAL_DOWN)){
            //Engine.log("fuckign");
            //match.createProjectile("TemplateProjectile", self());
            //match.createProjectile("Aura", self()); //note to self, do not code at 2 am, i typed self with () without noticing
            match.createProjectile("Aura", self);
            auracooldown.set(1500);
        }
    }
    else {
        auracooldown.dec();
        if (auracooldown.get() <= 0){
            auracooldown.set(0);
        }
    }
    if (self.getCostumeIndex() == 9){
        if (self.inState(CState.STAND)){
            self.playAnimation("stand_gold");
        }
    }
}
//ko effect spawn code //might not be the most efficient code ever but i never claimed to be a good programmer //currently broken til i can A find a solution or B wait for non script local variables
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
    //spawnproj.set(0);
}