import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tonexmidi/audio_parameter.dart';
import 'package:tonexmidi/main.dart';

class AudioParameters extends Notifier<List<AudioParameter>> {
  @override
  List<AudioParameter> build() => [
        const AudioParameter(value: 0, midiMsg: 14, name: "noiseGt14"),
        const AudioParameter(value: 0, midiMsg: 15, name: "noiseGate15"),
        const AudioParameter(value: 0, midiMsg: 16, name: "ngRel16"),
        const AudioParameter(value: 64, midiMsg: 17, name: "ngDpth17"),
        const AudioParameter(value: 0, midiMsg: 18, name: "comp18"),
        const AudioParameter(value: 0, midiMsg: 19, name: "compressor19"),
        const AudioParameter(value: 80, midiMsg: 20, name: "cmpGain20"),
        const AudioParameter(value: 20, midiMsg: 21, name: "cmpAtk21"),
        const AudioParameter(value: 127, midiMsg: 22, name: "cmpPatc22"),
        const AudioParameter(value: 64, midiMsg: 23, name: "bass23"),
        const AudioParameter(value: 70, midiMsg: 24, name: "bassFrq24"),
        const AudioParameter(value: 64, midiMsg: 25, name: "mid25"),
        const AudioParameter(value: 64, midiMsg: 26, name: "midQ26"),
        const AudioParameter(value: 64, midiMsg: 27, name: "midFrq27"),
        const AudioParameter(value: 64, midiMsg: 28, name: "treble28"),
        const AudioParameter(value: 64, midiMsg: 29, name: "trblFrq29"),
        const AudioParameter(value: 0, midiMsg: 30, name: "eqPatch30"),
        const AudioParameter(value: 0, midiMsg: 75, name: "reverb75"),
        const AudioParameter(value: 64, midiMsg: 76, name: "time76"),
        const AudioParameter(value: 0, midiMsg: 77, name: "predelay77"),
        const AudioParameter(value: 64, midiMsg: 78, name: "color78"),
        const AudioParameter(value: 0, midiMsg: 79, name: "reverb79"),
        const AudioParameter(value: 0, midiMsg: 85, name: "revType85"),
        const AudioParameter(value: 64, midiMsg: 102, name: "gain102"),
        const AudioParameter(value: 64, midiMsg: 103, name: "modelVol103"),
        const AudioParameter(value: 127, midiMsg: 104, name: "mix104"),
        const AudioParameter(value: 64, midiMsg: 106, name: "presence106"),
        const AudioParameter(value: 64, midiMsg: 107, name: "depth107"),
        const AudioParameter(value: 64, midiMsg: 108, name: "reso108"),
        const AudioParameter(value: 0, midiMsg: 109, name: "mic1_109"),
        const AudioParameter(value: 64, midiMsg: 110, name: "mic1X110"),
        const AudioParameter(value: 0, midiMsg: 111, name: "mic1Z111"),
        const AudioParameter(value: 0, midiMsg: 112, name: "mic2_112"),
        const AudioParameter(value: 64, midiMsg: 113, name: "mic2X113"),
        const AudioParameter(value: 0, midiMsg: 114, name: "mic2Z114"),
        const AudioParameter(value: 64, midiMsg: 115, name: "micsMix115"),
      ];

  void set(String name, int newValue) {
    state = [
      for (final ap in state)
        if (ap.name == name)
          AudioParameter(value: newValue, midiMsg: ap.midiMsg, name: ap.name)
        else
          ap
    ];
  }

  AudioParameter get(String name) {
    return state.where((ap) => ap.name == name).first;
  }

  void sync() async {
    for (final ap in state) {
      midi.midiCC(ap.midiMsg, ap.value);
      await Future.delayed(Duration(milliseconds: 5));
    }
  }
}
