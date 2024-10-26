@JS()
library js_interop;

import 'package:js/js.dart';

@JS()
external _midiCC(int msg, int value);

class Midi {
  midiCC(int msg, int value) {
    _midiCC(msg, value);
  }
}
