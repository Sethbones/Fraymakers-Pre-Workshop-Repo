var metercontainer = self.getViewRootContainer();

//ancient bloxxy code go brrrr
function initialize(){
    //required for projectile colors because inheritPalette is broken or too undocumented to be useful
	self.setCostumeIndex(self.getOwner().getCostumeIndex());

    self.getOwner().getDamageCounterContainer().addChild(metercontainer);
    self.setX(self.getX() + 35); //offsets be wildin
    self.setY(self.getY() + 5);
    Engine.log("meter init");
}

function update(){
    currentbouncesleft = self.getOwner().exports.bouncesLeft.get();
    //Engine.log("owner" + self.getOwner().exports.bouncesLeft.get());
    //Engine.log("Ball" + 1);
    if (self.getOwner().exports.ballExists.get()){
        if (self.getOwner().getCostumeIndex() == 11){
            self.playAnimation("Ball" + currentbouncesleft + "_gold");
        }
        else{
            self.playAnimation("Ball" + currentbouncesleft);
        }
        
    }
    else {
        if (self.getOwner().getCostumeIndex() == 11){
            self.playAnimation("Ball" + currentbouncesleft + "_no_ball" + "_gold");
        }
        else{
            self.playAnimation("Ball" + currentbouncesleft + "_no_ball");
        }
        
    }
    //for (i in currentbounces){
        //Engine.log(currentbounces);
        //self.playAnimation("Ball" + currentbounces[i]);
    //}
}