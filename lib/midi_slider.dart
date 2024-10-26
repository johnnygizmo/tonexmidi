import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:tonexmidi/audio_parameters_provider.dart';
import 'package:tonexmidi/midi.dart';

class MidiSlider extends ConsumerStatefulWidget {
  const MidiSlider(
      {super.key,
      required this.ccMsg,
      required this.midi,
      required this.label,
      required this.valueSetter,
      required this.valueGetter});
  final Midi midi;
  final int ccMsg;
  final Widget label;
  final Function(int value) valueSetter;
  final int Function() valueGetter;
  @override
  ConsumerState<MidiSlider> createState() => _MidiSliderState();
}

class _MidiSliderState extends ConsumerState<MidiSlider> {
  @override
  Widget build(BuildContext context) {
    ref.watch(audioParametersProvider);
    return Expanded(
      child: SizedBox(
        height: 225,
        child: Column(
          children: [
            SizedBox(
              height: 200,
              width: 40,
              child: FlutterSlider(
                values: [(widget.valueGetter().toDouble() / 127) * 10],
                min: 0.0,
                max: 10.0,
                rtl: true,
                step: FlutterSliderStep(step: 0.1),
                axis: Axis.vertical,
                onDragging: (handlerIndex, lowerValue, upperValue) {
                  widget.valueSetter(((lowerValue / 10.0) * 127).toInt());
                  widget.midi.midiCC(
                      widget.ccMsg, ((lowerValue / 10.0) * 127).toInt());
                  setState(() {});
                },
              ),
            ),
            widget.label
          ],
        ),
      ),
    );
  }
}
