package thorn.sound;
import thorn.video.SimpleVideoPlayer;
class SoundController {
    // tiny
    // glider
    // dragon
    
    var s0 = 'TAP_High_01.mp3';
    var s1 = 'TAP_High_01.ogg';
    var s2 = 'TAP_High_02.mp3';
    var s3 = 'TAP_High_02.ogg';
    var s4 = 'TAP_low_02.mp3';
    var s5 = 'TAP_low_02.ogg';
    var s6 = 'TAP_low01.mp3';
    var s7 = 'TAP_low01.ogg';
    var s8 = 'TAP01.wav';
    var s9 = 'TAP02.wav';
    var s10 = 'TAP03.wav';
    var s11 = 'TAPLow01.wav';
    var s12 = 'TAPLow02.wav';
    var s13 = 'TAPLow03.wav';
    var s14 = 'TAPLow04.wav';
    var s15 = 'TAPLow05.wav';
    var starsSound: String = 'AMBIENT -  MP3 TEST 1.mp3';//'stars.mp3';
    
    var tinySound: SimpleVideoPlayer;
    var gliderSound: SimpleVideoPlayer;
    var dragonSound: SimpleVideoPlayer;
    var ambientSound: SimpleVideoPlayer;
    
    public function new(){
        tinySound = new SimpleVideoPlayer();
        gliderSound = new SimpleVideoPlayer();
        dragonSound = new SimpleVideoPlayer();
        ambientSound = new SimpleVideoPlayer();
    }
    public function playTiny(){
        tinySound.source = s3;
        //tinySound.loop = true;
        tinySound.play();
    }
    
}