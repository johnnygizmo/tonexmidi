// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio_parameter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AudioParameterImpl _$$AudioParameterImplFromJson(Map<String, dynamic> json) =>
    _$AudioParameterImpl(
      value: (json['value'] as num).toInt(),
      midiMsg: (json['midiMsg'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$$AudioParameterImplToJson(
        _$AudioParameterImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'midiMsg': instance.midiMsg,
      'name': instance.name,
    };
