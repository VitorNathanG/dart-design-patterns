abstract class Device {
  bool isEnabled();

  void disable();

  void enable();

  int getVolume();

  void setVolume(int volume);

  int getChannel();

  void setChannel(int channel);
}
