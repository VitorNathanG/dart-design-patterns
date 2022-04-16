import 'device.dart';

class TV implements Device {
  TV({this.turnedOn = false, this.volume = 0, this.channel = 1});

  bool turnedOn;
  int volume;
  int channel;

  @override
  void disable() {
    this.turnedOn = false;
  }

  @override
  void enable() {
    this.turnedOn = true;
  }

  @override
  int getChannel() {
    return channel;
  }

  @override
  int getVolume() {
    return volume;
  }

  @override
  bool isEnabled() {
    return turnedOn;
  }

  @override
  void setChannel(int channel) {
    this.channel = channel;
  }

  @override
  void setVolume(int volume) {
    this.volume = volume;
  }
}