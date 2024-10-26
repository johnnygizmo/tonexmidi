import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:knob_widget/knob_widget.dart';
import 'package:tonexmidi/audio_parameters_provider.dart';
import 'package:tonexmidi/main.dart';
import 'package:tonexmidi/midi.dart';
import 'package:tonexmidi/midi_knob.dart';

class Compressor extends ConsumerStatefulWidget {
  const Compressor({
    super.key,
    required this.knobStyle,
  });

  final KnobStyle knobStyle;

  @override
  ConsumerState<Compressor> createState() => _CompressorState();
}

class _CompressorState extends ConsumerState<Compressor> {
  @override
  Widget build(BuildContext context) {
    var values = ref.watch(audioParametersProvider);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 300,
        child: Container(
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 253, 135, 135),
              borderRadius: BorderRadius.circular(10.0)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text("Compressor"),
                Row(
                  children: [
                    Switch(
                        value: values.comp18 > 0,
                        onChanged: (value) {
                          midi.midiCC(18, (value ? 1 : 0) * 127);
                          ref.read(audioParametersProvider.notifier).state = ref
                              .read(audioParametersProvider.notifier)
                              .state
                              .copyWith(comp18: (value ? 1 : 0) * 127);
                        }),
                    SegmentedButton<int>(
                      style: TextButton.styleFrom(
                        textStyle: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(fontSize: 10),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 2, vertical: 1),
                      ),
                      segments: const [
                        ButtonSegment<int>(
                          value: 0,
                          label: Text('Pre'),
                        ),
                        ButtonSegment<int>(
                          value: 127,
                          label: Text('Post'),
                        ),
                      ],
                      selected: {values.cmpPatc22},
                      onSelectionChanged: (Set<int> newSelection) {
                        midi.midiCC(22, newSelection.first);
                        ref.read(audioParametersProvider.notifier).state = ref
                            .read(audioParametersProvider.notifier)
                            .state
                            .copyWith(cmpPatc22: newSelection.first);
                      },
                    )
                  ],
                ),
                Row(
                  children: [
                    MidiKnob(
                      label: const Text(
                        "Threshold",
                        style: TextStyle(color: Colors.black),
                      ),
                      style: widget.knobStyle,
                      ccMsg: 19,
                      width: 50,
                      height: 50,
                      valueSetter: (value) {
                        ref.read(audioParametersProvider.notifier).state = ref
                            .read(audioParametersProvider.notifier)
                            .state
                            .copyWith(compressor19: value);
                      },
                    ),
                    MidiKnob(
                      label: const Text(
                        "Gain",
                        style: TextStyle(color: Colors.black),
                      ),
                      style: widget.knobStyle,
                      ccMsg: 20,
                      width: 50,
                      height: 50,
                      valueSetter: (value) {
                        ref.read(audioParametersProvider.notifier).state = ref
                            .read(audioParametersProvider.notifier)
                            .state
                            .copyWith(cmpGain20: value);
                      },
                    ),
                    MidiKnob(
                      label: const Text(
                        "Attack",
                        style: TextStyle(color: Colors.black),
                      ),
                      style: widget.knobStyle,
                      ccMsg: 21,
                      width: 50,
                      height: 50,
                      valueSetter: (value) {
                        ref.read(audioParametersProvider.notifier).state = ref
                            .read(audioParametersProvider.notifier)
                            .state
                            .copyWith(cmpAtk21: value);
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
