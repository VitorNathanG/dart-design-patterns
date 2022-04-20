import 'audio_player.dart';
import 'playing_state.dart';
import 'ready_state.dart';
import 'state_interface.dart';

class LockedState implements State {
  AudioPlayer audioPlayer;

  LockedState(this.audioPlayer);

  @override
  void clickLock() {
    if (audioPlayer.playing) {
      audioPlayer.changeState(PlayingState(audioPlayer));
    } else {
      audioPlayer.changeState(ReadyState(audioPlayer));
    }
  }

  @override
  void clickNext() {
    // Locked. Do nothing
  }

  @override
  void clickPlay() {
    // Locked. Do nothing
  }

  @override
  void clickPrevious() {
    // Locked. Do nothing
  }
}
