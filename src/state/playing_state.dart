import 'audio_player.dart';
import 'locked_state.dart';
import 'ready_state.dart';
import 'state_interface.dart';

class PlayingState implements State {
  AudioPlayer audioPlayer;

  PlayingState(this.audioPlayer);

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
    audioPlayer.stopPlayback();
    audioPlayer.changeState(ReadyState(audioPlayer));
  }

  @override
  void clickPrevious() {
    audioPlayer.clickPrevious();
  }
}
