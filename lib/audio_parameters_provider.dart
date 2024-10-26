import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tonexmidi/audio_parameters.dart';

var audioParametersProvider =
    StateProvider<AudioParameters>((ref) => const AudioParameters());
