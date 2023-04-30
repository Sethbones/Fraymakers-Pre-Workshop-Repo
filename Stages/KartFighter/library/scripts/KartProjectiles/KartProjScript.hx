
function initialize(){
    self.addEventListener(GameObjectEvent.HIT_DEALT, oncollide, {persistent: true});
}

function oncollide(){
    self.destroy();
}