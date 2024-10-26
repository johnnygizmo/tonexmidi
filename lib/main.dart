import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:knob_widget/knob_widget.dart';
import 'package:tonexmidi/compressor.dart';
import 'package:tonexmidi/equalization.dart';
import 'package:tonexmidi/midi.dart';
import 'package:tonexmidi/midi_knob.dart';
import 'package:tonexmidi/midi_slider.dart';
import 'package:tonexmidi/reverb.dart';

void main() {
  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

final midi = Midi();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'TONEX LIVE CONTROL'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  late KnobController _controller;
  late double _knobValue;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var style = const KnobStyle(
        showLabels: false,
        tickOffset: 5,
        labelOffset: -20,
        minorTicksPerInterval: 1,
        controlStyle: ControlStyle(
          backgroundColor: Colors.black87,
        ));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            child: Container(
              decoration: const BoxDecoration(
                  color: Color.fromARGB(221, 185, 185, 185)),
              child: Column(
                children: [
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: <Widget>[
                  //     MidiKnob(
                  //       label: Text(
                  //         "Gain",
                  //         style: TextStyle(color: Colors.white),
                  //       ),
                  //       style: style,
                  //       ccMsg: 104,
                  //       midi: midi,
                  //     ),
                  //     MidiKnob(
                  //       label: Text(
                  //         "Depth",
                  //         style: TextStyle(color: Colors.white),
                  //       ),
                  //       style: style,
                  //       ccMsg: 107,
                  //       midi: midi,
                  //     ),
                  //     MidiKnob(
                  //       label: Text(
                  //         "Bass",
                  //         style: TextStyle(color: Colors.white),
                  //       ),
                  //       style: style,
                  //       ccMsg: 23,
                  //       midi: midi,
                  //     ),
                  //     MidiKnob(
                  //       label: Text(
                  //         "Mid",
                  //         style: TextStyle(color: Colors.white),
                  //       ),
                  //       style: style,
                  //       ccMsg: 25,
                  //       midi: midi,
                  //     ),
                  //     MidiKnob(
                  //       label: Text(
                  //         "Treble",
                  //         style: TextStyle(color: Colors.white),
                  //       ),
                  //       style: style,
                  //       ccMsg: 28,
                  //       midi: midi,
                  //     ),
                  //   ],
                  // ),
                  // SizedBox.shrink(
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       MidiKnob(
                  //         label: const Text(
                  //           "Gain",
                  //           style: TextStyle(color: Colors.white),
                  //         ),
                  //         style: style,
                  //         ccMsg: 102,
                  //         midi: midi,
                  //       ),
                  //       MidiKnob(
                  //         label: const Text(
                  //           "Depth",
                  //           style: TextStyle(color: Colors.white),
                  //         ),
                  //         style: style,
                  //         ccMsg: 25,
                  //         midi: midi,
                  //       ),
                  //       MidiKnob(
                  //         label: const Text(
                  //           "Presence",
                  //           style: const TextStyle(color: Colors.white),
                  //         ),
                  //         style: style,
                  //         ccMsg: 107,
                  //         midi: midi,
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  Row(
                    children: [
                      Equalization(style: style),
                    ],
                  ),
                  Row(
                    children: [
                      Compressor(
                        knobStyle: style,
                      ),
                      Reverb(
                        knobStyle: style,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          midi.midiCC(104, 24);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
