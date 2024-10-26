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
        width: 400,
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
                          ccMsg: 23,
                          midi: midi,
                          label: const Text("Bass"),
                          valueSetter: (value) {
                            ref.read(audioParametersProvider.notifier).state =
                                ref
                                    .read(audioParametersProvider.notifier)
                                    .state
                                    .copyWith(bass23: value);
                          },
                          valueGetter: () {
                            return ref
                                .read(audioParametersProvider.notifier)
                                .state
                                .bass23;
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
                                        .state =
                                    ref
                                        .read(audioParametersProvider.notifier)
                                        .state
                                        .copyWith(bassFrq24: value);
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
                            ref.read(audioParametersProvider.notifier).state =
                                ref
                                    .read(audioParametersProvider.notifier)
                                    .state
                                    .copyWith(mid25: value);
                          },
                          valueGetter: () {
                            return ref
                                .read(audioParametersProvider.notifier)
                                .state
                                .mid25;
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
                                        .state =
                                    ref
                                        .read(audioParametersProvider.notifier)
                                        .state
                                        .copyWith(midQ26: value);
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
                                          .state =
                                      ref
                                          .read(
                                              audioParametersProvider.notifier)
                                          .state
                                          .copyWith(midFrq27: value);
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
                            ref.read(audioParametersProvider.notifier).state =
                                ref
                                    .read(audioParametersProvider.notifier)
                                    .state
                                    .copyWith(treble28: value);
                          },
                          valueGetter: () {
                            return ref
                                .read(audioParametersProvider.notifier)
                                .state
                                .treble28;
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
                                        .state =
                                    ref
                                        .read(audioParametersProvider.notifier)
                                        .state
                                        .copyWith(trblFrq29: value);
                              },
                            ),
                          ],
                        )
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
