import 'advanced_remote.dart';
import 'device.dart';
import 'tv.dart';

/// Enables Devices and Remotes to be extended without interfering with each other
void main() {
  Device device = TV();
  AdvancedRemote remote = AdvancedRemote(device: device);

  remote.togglePower();
  remote.channelUp();
  remote.mute();
}
