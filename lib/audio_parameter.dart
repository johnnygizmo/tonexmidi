import 'package:freezed_annotation/freezed_annotation.dart';

part 'audio_parameter.freezed.dart';
part 'audio_parameter.g.dart';

@freezed
class AudioParameter with _$AudioParameter {
  const factory AudioParameter(
      {required int value,
      required int midiMsg,
      required String name}) = _AudioParameter;

  factory AudioParameter.fromJson(Map<String, dynamic> json) =>
      _$AudioParameterFromJson(json);
}
