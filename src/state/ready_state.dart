import 'audio_player.dart';
import 'locked_state.dart';
import 'state_interface.dart';

class ReadyState implements State {
  AudioPlayer audioPlayer;

  ReadyState(this.audioPlayer);

  @override
  void clickLock() {
    audioPlayer.changeState(LockedState(audioPlayer));
  }

  @override
  void clickNext() {
    audioPlayer.nextSong();
  }

  @override
  void clickPlay() {
    audioPlayer.startPlayback();
  }

  @override
  void clickPrevious() {
    audioPlayer.previousSong();
  }
}
