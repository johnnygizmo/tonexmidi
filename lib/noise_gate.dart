import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:knob_widget/knob_widget.dart';
import 'package:tonexmidi/audio_parameters_provider.dart';
import 'package:tonexmidi/main.dart';
import 'package:tonexmidi/midi.dart';
import 'package:tonexmidi/midi_knob.dart';

class NoiseGate extends ConsumerStatefulWidget {
  const NoiseGate({
    super.key,
    required this.knobStyle,
  });

  final KnobStyle knobStyle;

  @override
  ConsumerState<NoiseGate> createState() => _NoiseGateState();
}

class _NoiseGateState extends ConsumerState<NoiseGate> {
  @override
  Widget build(BuildContext context) {
    var values = ref.watch(audioParametersProvider);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 300,
        width: 350,
        child: Container(
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 231, 255, 144),
              borderRadius: BorderRadius.circular(10.0)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text("Noise Gate"),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Switch(
                      value: values.noiseGt14 > 0,
                      onChanged: (value) {
                        midi.midiCC(14, (value ? 1 : 0) * 127);
                        ref.read(audioParametersProvider.notifier).state = ref
                            .read(audioParametersProvider.notifier)
                            .state
                            .copyWith(noiseGt14: (value ? 1 : 0) * 127);
                      }),
                ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MidiKnob(
                      label: const Text(
                        "Threshold",
                        style: TextStyle(color: Colors.black),
                      ),
                      style: widget.knobStyle,
                      ccMsg: 15,
                      width: 50,
                      height: 50,
                      valueSetter: (value) {
                        ref.read(audioParametersProvider.notifier).state = ref
                            .read(audioParametersProvider.notifier)
                            .state
                            .copyWith(noiseGate15: value);
                      },
                    ),
                    MidiKnob(
                      label: const Text(
                        "Release",
                        style: TextStyle(color: Colors.black),
                      ),
                      style: widget.knobStyle,
                      ccMsg: 16,
                      width: 50,
                      height: 50,
                      valueSetter: (value) {
                        ref.read(audioParametersProvider.notifier).state = ref
                            .read(audioParametersProvider.notifier)
                            .state
                            .copyWith(ngRel16: value);
                      },
                    ),
                    MidiKnob(
                      label: const Text(
                        "Depth",
                        style: TextStyle(color: Colors.black),
                      ),
                      style: widget.knobStyle,
                      ccMsg: 17,
                      width: 50,
                      height: 50,
                      valueSetter: (value) {
                        ref.read(audioParametersProvider.notifier).state = ref
                            .read(audioParametersProvider.notifier)
                            .state
                            .copyWith(ngDpth17: value);
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
