import 'package:freezed_annotation/freezed_annotation.dart';

part 'audio_parameters.freezed.dart';
part 'audio_parameters.g.dart';

@freezed
class AudioParameters with _$AudioParameters {
  const factory AudioParameters({
    @Default(0) int reverb79,
    @Default(0) int compressor19,
    @Default(0) int noiseGate15,
    @Default(0) int presence106,
    @Default(0) int depth107,
    @Default(0) int modelVol103,
    @Default(0) int noiseGt14,
    @Default(0) int ngRel16,
    @Default(0) int ngDpth17,
    @Default(0) int comp18,
    @Default(0) int cmpGain20,
    @Default(0) int cmpAtk21,
    @Default(0) int cmpPatc22,
    @Default(0) int bass23,
    @Default(0) int bassFrq24,
    @Default(0) int mid25,
    @Default(0) int midQ26,
    @Default(0) int midFrq27,
    @Default(0) int treble28,
    @Default(0) int trblFrq29,
    @Default(0) int eqPatch30,
    @Default(0) int mix104,
    @Default(0) int reverb75,
    @Default(0) int revType85,
    @Default(0) int time76,
    @Default(0) int predelay77,
    @Default(0) int color78,
    @Default(0) int reso108,
    @Default(0) int mic1_109,
    @Default(0) int mic1X110,
    @Default(0) int mic1Z111,
    @Default(0) int mic2_112,
    @Default(0) int mic2X113,
    @Default(0) int mic2Z114,
    @Default(0) int micsMix115,
  }) = _AudioParameters;

  factory AudioParameters.fromJson(Map<String, dynamic> json) =>
      _$AudioParametersFromJson(json);
}
