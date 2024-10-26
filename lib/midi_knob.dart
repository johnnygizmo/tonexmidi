import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:knob_widget/knob_widget.dart';
import 'package:tonexmidi/audio_parameters_provider.dart';
import 'package:tonexmidi/main.dart';
import 'package:tonexmidi/midi.dart';
import 'package:riverpod/riverpod.dart';

class MidiKnob extends ConsumerStatefulWidget {
  const MidiKnob({
    super.key,
    required this.ccMsg,
    this.width = 75,
    this.height = 75,
    required this.style,
    this.min = 0,
    this.max = 10,
    this.initial = 0,
    required this.label,
    required this.valueSetter,
  });

  final Widget label;
  final int ccMsg;
  final double width;
  final double height;
  final KnobStyle style;
  final double min;
  final double max;
  final double initial;
  final Function(int value) valueSetter;

  @override
  ConsumerState<MidiKnob> createState() => _MidiKnobState();
}

class _MidiKnobState extends ConsumerState<MidiKnob> {
  late KnobController _controller;

  @override
  void initState() {
    super.initState();
    _controller = KnobController(
      startAngle: -60,
      endAngle: 240,
      precision: 1,
      initial: widget.initial,
      minimum: widget.min,
      maximum: widget.max,
    );
    _controller.addOnValueChangedListener((value) {
      if (mounted) {
        widget.valueSetter(value.toInt());
        midi.midiCC(widget.ccMsg, ((value / widget.max) * 127).toInt());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(audioParametersProvider);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Knob(
            width: widget.width,
            height: widget.height,
            controller: _controller,
            style: widget.style,
          ),
          widget.label
        ],
      ),
    );
  }
}


// class MidiKnob extends StatelessWidget {
//   const MidiKnob(this.value,
//       {super.key,
//       required this.width,
//       required this.height,
//       required this.controller,
//       required this.style});

//   final int value;
//   final double width;
//   final double height;
//   final KnobController controller = KnobController(

//   );
//   final KnobStyle style;

//   @override
//   Widget build(BuildContext context) {
//     
//   }
// }
