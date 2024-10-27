import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tonexmidi/audio_parameter.dart';
import 'package:tonexmidi/audio_parameters.dart';

final audioParametersProvider =
    NotifierProvider<AudioParameters, List<AudioParameter>>(
        AudioParameters.new);
