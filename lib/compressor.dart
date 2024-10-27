import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:knob_widget/knob_widget.dart';
import 'package:tonexmidi/audio_parameters_provider.dart';
import 'package:tonexmidi/main.dart';
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
    ref.watch(audioParametersProvider);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 200,
        width: 300,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Switch(
                        value: ref
                                .read(audioParametersProvider.notifier)
                                .get("comp18")
                                .value >
                            0,
                        onChanged: (value) {
                          midi.midiCC(18, (value ? 1 : 0) * 127);
                          ref
                              .read(audioParametersProvider.notifier)
                              .set("comp18", (value ? 1 : 0) * 127);
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
                      selected: {
                        ref
                            .read(audioParametersProvider.notifier)
                            .get("cmpPatc22")
                            .value
                      },
                      onSelectionChanged: (Set<int> newSelection) {
                        midi.midiCC(22, newSelection.first);
                        ref
                            .read(audioParametersProvider.notifier)
                            .set("cmpPatc22", newSelection.first);
                      },
                    )
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MidiKnob(
                      label: const Text(
                        "Threshold",
                        style: TextStyle(color: Colors.black),
                      ),
                      style: widget.knobStyle,
                      ccMsg: 19,
                      width: 50,
                      height: 75,
                      valueSetter: (value) {
                        ref
                            .read(audioParametersProvider.notifier)
                            .set("compressor19", value);
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
                      height: 75,
                      valueSetter: (value) {
                        ref
                            .read(audioParametersProvider.notifier)
                            .set("cmpGain20", value);
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
                      height: 75,
                      valueSetter: (value) {
                        ref
                            .read(audioParametersProvider.notifier)
                            .set("cmpAtk21", value);
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
