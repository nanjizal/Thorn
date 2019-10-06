package thorn.sound;
import thorn.video.SimpleVideoPlayer;

@:enum
abstract JakeSound( String ) to String from String {
    var glider1      = 'glader_1.mp3';
    var glider2      = 'glader_2.mp3';
    var glider3      = 'glader_3.mp3';
    var tinyGrunt1   = 'angry_tiny_grunt_1.mp3';
    var tinyGrunt2   = 'angry_tiny_grunt_2.mp3';
    var tinyGrunt3   = 'angry_tiny_grunt_3.mp3';
    var tinyGrunt4   = 'angry_tiny_grunt_4.mp3';
    var tinyGrunt5   = 'angry_tiny_grunt_5.mp3';
    var tinyHappy1   = 'happy_tiny_grunt_1.mp3';
    var tinyHappy2   = 'happy_tiny_grunt_2.mp3';
    var tinyHappy3   = 'happy_tiny_grunt_3.mp3';
    var tinyHappy4   = 'happy_tiny_grunt_4.mp3';
    var tinyHappy5   = 'happy_tiny_grunt_5.mp3';
    var tinyEat1     = 'eat_tiny_grunt_1.mp3';
    var dragonGrunt1 = 'dragon_grunt_1.mp3';
    var dragonGrunt2 = 'dragon_grunt_2.mp3';
    var dragonFoot1 = 'dragon_footsteps_1.mp3';
    var dragonFoot2 = 'dragon_footsteps_2.mp3';
    var dragonFoot3 = 'dragon_footsteps_3.mp3';
    var dragonFoot4 = 'dragon_footsteps_4.mp3';
    var dragonFont5 = 'dragon_footsteps_5.mp3';
    var ambient     = 'ambient_1.mp3';
}
class SoundController {
    // tiny
    // glider
    // dragon
    var tinySound:      SimpleVideoPlayer;
    var gliderSound:    SimpleVideoPlayer;
    var dragonSound:    SimpleVideoPlayer;
    var ambientSound:   SimpleVideoPlayer;
    public
    function new(){
        tinySound    = new SimpleVideoPlayer();
        gliderSound  = new SimpleVideoPlayer();
        dragonSound  = new SimpleVideoPlayer();
        ambientSound = new SimpleVideoPlayer();
    }
    public
    function playTiny( sound: JakeSound,?loop: Bool = true ){
        tinySound.source = sound;
        if( loop == true ) tinySound.loop = true;
        tinySound.play();
    }
    public
    function playGlider( sound: JakeSound, ?loop: Bool = true ){
        gliderSound.source = sound;
        if( loop == true ) gliderSound.loop = true;
        gliderSound.play();
    }
    public
    function playDragon( sound: JakeSound, ?loop: Bool = true ){
        dragonSound.source = sound;
        if( loop == true ) dragonSound.loop = true;
        dragonSound.play();
    }
    public
    function playAmient( sound: JakeSound, ?loop: Bool = true ){
        ambientSound.source = sound;
        if( loop == true ) ambientSound.loop = true;
        ambientSound.play();
    }
}