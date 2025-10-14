class MIDIControl {
  String name;
  int cc;
  float value, min, max;
  
  MIDIControl(String n, int c, float mn, float mx) {
    name = n;
    cc = c;
    min = mn;
    max = mx;
    value = min;
  }
  
  void update(int midiValue) {
    value = map(midiValue, 0, 127, min, max);
  }
  
  float get() {
    return value;
  }
}
