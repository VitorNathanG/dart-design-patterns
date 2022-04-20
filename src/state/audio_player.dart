import 'ready_state.dart';
import 'state_interface.dart';

class AudioPlayer {
  late State state;
  bool playing = false;

  AudioPlayer() {
    this.state = ReadyState(this);
  }

  void changeState(State state) {
    this.state = state;
  }

  void clickLock() {
    state.clickLock();
  }

  void clickPlay() {
    state.clickPlay();
  }

  void clickNext() {
    state.clickNext();
  }

  void clickPrevious() {
    state.clickPrevious();
  }

  void startPlayback() {
    if (playing == false) {
      print("Playing song");
      playing = true;
    }
  }

  void stopPlayback() {
    if (playing == true) {
      print("Stopping playback");
      playing = false;
    }
  }

  void nextSong() {
    print("Playing next song");
  }

  void previousSong() {
    print("Playing previous song");
  }
}
