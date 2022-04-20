import 'audio_player.dart';

void main() {
  AudioPlayer audioPlayer = AudioPlayer();
  audioPlayer.clickPlay();
  audioPlayer.clickNext();

  audioPlayer.clickLock();
  audioPlayer.clickPlay(); // Does not play, state is Locked
}
