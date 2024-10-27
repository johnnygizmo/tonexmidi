import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:knob_widget/knob_widget.dart';
import 'package:tonexmidi/audio_parameters_provider.dart';
import 'package:tonexmidi/main.dart';
import 'package:tonexmidi/midi_knob.dart';
import 'package:tonexmidi/midi_slider.dart';

class Equalization extends ConsumerWidget {
  const Equalization({
    super.key,
    required this.style,
  });

  final KnobStyle style;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 370,
        width: 550,
        child: Container(
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 216, 249, 154),
              borderRadius: BorderRadius.circular(10.0)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("Equalization"),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        MidiSlider(
                          ccMsg: 102,
                          midi: midi,
                          label: const Text("Gain"),
                          valueSetter: (value) {
                            ref
                                .read(audioParametersProvider.notifier)
                                .set("gain102", value);
                          },
                          valueGetter: () {
                            return ref
                                .read(audioParametersProvider.notifier)
                                .get("gain102")
                                .value;
                          },
                        ),
                      ],
                    ),
                    const VerticalDivider(),
                    Column(
                      children: [
                        MidiSlider(
                          ccMsg: 23,
                          midi: midi,
                          label: const Text("Bass"),
                          valueSetter: (value) {
                            ref
                                .read(audioParametersProvider.notifier)
                                .set("bass23", value);
                          },
                          valueGetter: () {
                            return ref
                                .read(audioParametersProvider.notifier)
                                .get("bass23")
                                .value;
                          },
                        ),
                        Row(
                          children: [
                            MidiKnob(
                              label: const Text(
                                "Bass Freq",
                                style: TextStyle(color: Colors.black),
                              ),
                              style: style,
                              ccMsg: 24,
                              width: 50,
                              height: 75,
                              valueSetter: (value) {
                                ref
                                    .read(audioParametersProvider.notifier)
                                    .set("bassFrq24", value);
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                    Column(
                      children: [
                        MidiSlider(
                          ccMsg: 25,
                          midi: midi,
                          label: const Text("Mid"),
                          valueSetter: (value) {
                            ref
                                .read(audioParametersProvider.notifier)
                                .set("mid25", value);
                          },
                          valueGetter: () {
                            return ref
                                .read(audioParametersProvider.notifier)
                                .get("mid25")
                                .value;
                          },
                        ),
                        Row(
                          children: [
                            MidiKnob(
                              label: const Text(
                                "Mid Q",
                                style: TextStyle(color: Colors.black),
                              ),
                              style: style,
                              ccMsg: 26,
                              width: 50,
                              height: 75,
                              valueSetter: (value) {
                                ref
                                    .read(audioParametersProvider.notifier)
                                    .set("midQ26", value);
                              },
                            ),
                            MidiKnob(
                                label: const Text(
                                  "Mid Freq",
                                  style: TextStyle(color: Colors.black),
                                ),
                                style: style,
                                ccMsg: 27,
                                valueSetter: (value) {
                                  ref
                                      .read(audioParametersProvider.notifier)
                                      .set("midFrq27", value);
                                },
                                width: 50,
                                height: 75)
                          ],
                        )
                      ],
                    ),
                    Column(
                      children: [
                        MidiSlider(
                          ccMsg: 28,
                          midi: midi,
                          label: const Text("Treble"),
                          valueSetter: (value) {
                            ref
                                .read(audioParametersProvider.notifier)
                                .set("treble28", value);
                          },
                          valueGetter: () {
                            return ref
                                .read(audioParametersProvider.notifier)
                                .get("treble28")
                                .value;
                          },
                        ),
                        Row(
                          children: [
                            MidiKnob(
                              label: const Text(
                                "High Freq",
                                style: TextStyle(color: Colors.black),
                              ),
                              style: style,
                              ccMsg: 29,
                              width: 50,
                              height: 75,
                              valueSetter: (value) {
                                ref
                                    .read(audioParametersProvider.notifier)
                                    .set("trblFrq29", value);
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                    const VerticalDivider(),
                    Column(
                      children: [
                        MidiSlider(
                          ccMsg: 107,
                          midi: midi,
                          label: const Text("Depth"),
                          valueSetter: (value) {
                            ref
                                .read(audioParametersProvider.notifier)
                                .set("depth107", value);
                          },
                          valueGetter: () {
                            return ref
                                .read(audioParametersProvider.notifier)
                                .get("depth107")
                                .value;
                          },
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        MidiSlider(
                          ccMsg: 106,
                          midi: midi,
                          label: const Text("Presence"),
                          valueSetter: (value) {
                            ref
                                .read(audioParametersProvider.notifier)
                                .set("presence106", value);
                          },
                          valueGetter: () {
                            return ref
                                .read(audioParametersProvider.notifier)
                                .get("presence106")
                                .value;
                          },
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        MidiSlider(
                          ccMsg: 104,
                          midi: midi,
                          label: const Text("Mix"),
                          valueSetter: (value) {
                            ref
                                .read(audioParametersProvider.notifier)
                                .set("mix104", value);
                          },
                          valueGetter: () {
                            return ref
                                .read(audioParametersProvider.notifier)
                                .get("mix104")
                                .value;
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
