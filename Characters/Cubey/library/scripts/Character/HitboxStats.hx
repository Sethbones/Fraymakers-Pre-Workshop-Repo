// Hitbox stats
//please note most things here do not represent the actual stats of the hitboxes as most (if not all) are set by the character entity timeline itself so i don't have to search where a move is here, it's easier for me.
{
	//LIGHT ATTACKS
	jab1: {},
	jab2: {},
	dash_attack: {},
	tilt_forward: {},
	tilt_up: {},
	tilt_down: {},

	//STRONG ATTACKS
	strong_forward_attack: {},
	strong_up_attack: {},
	strong_down_attack: {},

	//AERIAL ATTACKS
	aerial_neutral: {},
	aerial_forward: {},
	aerial_back: {},
	aerial_up: {},
	aerial_down: {},

	//SPECIAL ATTACKS
	special_neutral: {},
	special_neutral_air: {},
	special_side: {},
	special_side_air: {},
	special_up: {}, 
	special_up_air: {}, 
	special_down: {}, 
	special_down_air: {},

	//THROWS
	throw_down: {},
	throw_up: {},
	throw_forward: {},
	throw_back: {},
	
	//MISC ATTACKS
	ledge_attack: {},
	crash_attack: {},
	emote: {}
}
//---------Angle Referance---------\\
// things to note:
// this makes making hitboxes less annoying
// this could be really useful as a built in feature
// if an attack has the character turn around (specifically Back air and Back throw) then the hitbox angles are reversed (180 becoming 0, and vice versa, you'll see what i mean when you get there)
//
//                        90
//                -----------------
//             /          |          \
//    135   /             |             \   45
//        |               |               |
//      |                 |                 |
//     |                  |                  |
//    |                   |                   |
//   |                    |                    |
//   |                    |                    |
//180|--------------------|--------------------| 0
//   |                    |                    |
//   |                    |                    |
//    |                   |                   |
//     |                  |                  |
//      |                 |                 |
//        |               |               |
//    225   \             |             /   315
//             \          |          /
//                -----------------
//                       270
//