//ignore this file, if you need vfx wait for the official character template so this gets updated
//things here are just here for them to be there untill it's actually done

//supposed usage instruction wil all things
//match.createVfx( {animation: null, chain: null, fadeOut: false, flipWith: true, forceVisible: false, layer: "front", loop: false, physics: false, relativeWith: true, resizeWith: true, rotation: 0, scaleX: 1, scaleY: 1, shrink: false, smoothing: false, spriteContent: null, timeout: -1, x: 0, y: 0 } , self);

//supposed documentation, as vfx ccurrently does not work and will probably keep not working untill the official character template is out
//
//animation (type:String, default:null) Name of the Vfx animation to play
//supposed animations (taken from globalvfx on the docs):
    //AIRDASH
    //AIRDASH_BACK
    //CLANK
    //CRASH_BOUNCE
    //CRASH_BOUNCE_BACK
    //CRASH_NORMAL
    //DOUBLE_JUMP_DUST
    //DOUBLE_JUMP_DUST_BACK
    //DUST_POOF
    //DUST_POOF_BACK
    //DUST_SPIN
    //DUST_SPIN_BACK
    //DUST_START_HEAVY
    //DUST_START_LIGHT
    //DUST_THROUGH
    //FATAL_NORMAL_ANGLED_HIT
    //FATAL_NORMAL_ANGLED_HIT_BACK
    //FATAL_NORMAL_HIT
    //FATAL_NORMAL_HIT_BACK
    //GROUNDED_SPIKE
    //GROUNDED_SPIKE_BACK
    //GROUND_BOUNCE
    //GROUND_BOUNCE_BACK
    //HEAVY_NORMAL_ANGLED_HIT
    //HEAVY_NORMAL_ANGLED_HIT_BACK
    //HEAVY_NORMAL_HIT
    //HEAVY_NORMAL_HIT_BACK
    //JUMP_TRAIL
    //KNOCKBACK_SMOKE
    //KO_BLAST
    //LAND_DUST
    //LAND_DUST_BACK
    //LIGHT_NORMAL_ANGLED_HIT
    //LIGHT_NORMAL_ANGLED_HIT_BACK
    //LIGHT_NORMAL_HIT
    //LIGHT_NORMAL_HIT_BACK
    //MEDIUM_NORMAL_ANGLED_HIT
    //MEDIUM_NORMAL_ANGLED_HIT_BACK
    //MEDIUM_NORMAL_HIT
    //MEDIUM_NORMAL_HIT_BACK
    //REVIVAL
    //SPARKLE_FASTFALL
    //SPARKLE_HEAVY
    //SPARKLE_LIGHT
    //SPIKE
    //SPIKE_BACK

//chain (type:VfxStatsProps, default:null) Stats for a child Vfx to generate, inheriting all of the properties of its parent by default

//fadeOut (type:Bool, default:false) When true, the Vfx animation will fade out linearly from initial spawn to timeout.

//flipWith (type:Bool, default:TRUE) Whether or not to flip the effect based on the calling GameObject’s horizontal scale

//forceVisible (type:Bool, default:false) When true, The Vfx will be shown regardless of any optimization settings/configs

//layer (type:String, default:"front") //other options are probably "back" and "hud"

//loop (type:Bool, default:false) When true, the Vfx animation will loop.

//physics (type:Bool, default:false) When true, the Vfx will respond to physics-related methods

//relativeWith (type:Bool, default:true) Whether or not to force relative positioning of the effect against the GameObject’s position

//resizeWith (type:Bool, default:true) Whether or not to scale the effect with the calling GameObject’s current scale

//rotation (type:Float, default:0) Rotation of the Vfx in degrees

//scaleX (type:Float, default:1) Horizontal scale of the Vfx

//scaleY (type:Float, default:1) Vertical scale of the Vfx

//shrink (type:Bool, default:false) When true, the Vfx animation will scale down linearly from initial spawn to timeout.

//smoothing (type:Bool, default:false) Whether or not to enable smoothing on the Vfx Sprite

//spriteContent (type:String, default:null) Content path for sprite entity of the Vfx   //its default is unknown and as such we have no access to the fraymakers vfx

//timeout (type:Int, default:-1) How long to wait in frames before the Vfx should be removed. This also affects how long fade out and shrink should last (default: 0 = no timeout)

//x	(type:Float, default:0) Absolute x position of the Vfx

//y	(type:Float, default:0) Absolute y position of the Vfx
