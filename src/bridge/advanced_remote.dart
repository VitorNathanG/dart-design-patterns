import 'device.dart';
import 'remote.dart';

class AdvancedRemote implements Remote {
  Device device;
  bool isMuted;
  int volumeBeforeMuted;

  AdvancedRemote({required this.device, this.isMuted = false, this.volumeBeforeMuted = 0});

  @override
  void togglePower() {
    if (device.isEnabled()) {
      device.disable();
      return;
    }
    device.enable();
  }

  @override
  void volumeDown() {
    device.setVolume(device.getVolume() - 10);
  }

  @override
  void volumeUp() {
    device.setVolume(device.getVolume() + 10);
  }

  @override
  void channelDown() {
    device.getChannel() > 1
        ? device.setChannel(device.getChannel() - 1)
        : () => null;
  }

  @override
  void channelUp() {
    device.setChannel(device.getChannel() + 1);
  }

  void mute() {
    if(isMuted) return;
    this.volumeBeforeMuted = device.getVolume();
    this.device.setVolume(0);
    this.isMuted = true;
  }
}
