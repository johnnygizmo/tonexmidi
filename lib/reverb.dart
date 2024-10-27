import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:knob_widget/knob_widget.dart';
import 'package:tonexmidi/audio_parameters_provider.dart';
import 'package:tonexmidi/main.dart';
import 'package:tonexmidi/midi_knob.dart';

class Reverb extends ConsumerStatefulWidget {
  const Reverb({
    super.key,
    required this.knobStyle,
  });

  final KnobStyle knobStyle;

  @override
  ConsumerState<Reverb> createState() => _ReverbState();
}

class _ReverbState extends ConsumerState<Reverb> {
  @override
  Widget build(BuildContext context) {
    ref.watch(audioParametersProvider);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 175,
        child: Container(
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 174, 219, 255),
              borderRadius: BorderRadius.circular(10.0)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text("Reverb"),
                Row(
                  children: [
                    Switch(
                        value: ref
                                .read(audioParametersProvider.notifier)
                                .get("reverb75")
                                .value >
                            0,
                        onChanged: (value) {
                          midi.midiCC(75, (value ? 1 : 0) * 127);
                          ref
                              .read(audioParametersProvider.notifier)
                              .set("reverb75", (value ? 1 : 0) * 127);
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
                          label: Text('Spring 1'),
                        ),
                        ButtonSegment<int>(
                          value: 30,
                          label: Text('Spring 2'),
                        ),
                        ButtonSegment<int>(
                          value: 60,
                          label: Text('Spring 3'),
                        ),
                        ButtonSegment<int>(
                          value: 90,
                          label: Text('Room'),
                        ),
                        ButtonSegment<int>(
                          value: 120,
                          label: Text('Plate'),
                        )
                      ],
                      selected: {
                        ref
                            .read(audioParametersProvider.notifier)
                            .get("revType85")
                            .value
                      },
                      onSelectionChanged: (Set<int> newSelection) {
                        setState(() {
                          midi.midiCC(85, newSelection.first);
                          ref
                              .read(audioParametersProvider.notifier)
                              .set("revType85", newSelection.first);
                        });
                      },
                    )
                  ],
                ),
                Row(
                  children: [
                    MidiKnob(
                      label: const Text(
                        "Time",
                        style: TextStyle(color: Colors.black),
                      ),
                      style: widget.knobStyle,
                      ccMsg: 76,
                      width: 50,
                      height: 50,
                      valueSetter: (value) {
                        ref
                            .read(audioParametersProvider.notifier)
                            .set("time76", value);
                      },
                    ),
                    MidiKnob(
                      label: const Text(
                        "Color",
                        style: TextStyle(color: Colors.black),
                      ),
                      style: widget.knobStyle,
                      ccMsg: 78,
                      width: 50,
                      height: 50,
                      valueSetter: (value) {
                        ref
                            .read(audioParametersProvider.notifier)
                            .set("color78", value);
                      },
                    ),
                    MidiKnob(
                      label: const Text(
                        "Predelay",
                        style: TextStyle(color: Colors.black),
                      ),
                      style: widget.knobStyle,
                      ccMsg: 77,
                      width: 50,
                      height: 50,
                      valueSetter: (value) {
                        ref
                            .read(audioParametersProvider.notifier)
                            .set("predelay77", value);
                      },
                    ),
                    MidiKnob(
                      label: const Text(
                        "Mix",
                        style: TextStyle(color: Colors.black),
                      ),
                      style: widget.knobStyle,
                      ccMsg: 79,
                      width: 50,
                      height: 50,
                      valueSetter: (value) {
                        ref
                            .read(audioParametersProvider.notifier)
                            .set("reverb79", value);
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
