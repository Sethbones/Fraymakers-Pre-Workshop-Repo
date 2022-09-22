//this is basically a worse version of shaggy's netural special from multiversus
var AURACOOLDOWN = 0;
var CANACTIVATEAURA = true;

var auracooldown = self.makeInt(AURACOOLDOWN);
var canactivateaura = self.makeBool(CANACTIVATEAURA);


function initialize(){
    //self.addEventListener(EntityEvent.STATE_CHANGE, ondspecial, { persistent: true });
    //self.addStatusEffect(13, 10)
    //Engine.log("Char init");
}

//function ondspecial() {
    //Engine.log("indspecial");
//}

function update() {
    //Engine.log(auracooldown.get());
    if (auracooldown.get() == 0){
        if (self.inState(CState.SPECIAL_DOWN)){
            //Engine.log("fuckign");
            match.createProjectile("Aura", self);
            //match.createProjectile("TemplateProjectile", self());
            //match.createProjectile("Aura", self()); //note to self, do not code at 2 am, i typed self with () without noticing
            auracooldown.set(1500);
        }
    }
    else {
        auracooldown.dec();
        if (auracooldown.get() <= 0){
            auracooldown.set(0);
        }
    }
}


function onTeardown() {

}