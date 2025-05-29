// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BeeImpl _$$BeeImplFromJson(Map<String, dynamic> json) => _$BeeImpl(
      currHealth: (json['currHealth'] as num?)?.toInt() ?? 2,
      isMoving: json['isMoving'] as bool? ?? false,
    );

Map<String, dynamic> _$$BeeImplToJson(_$BeeImpl instance) => <String, dynamic>{
      'currHealth': instance.currHealth,
      'isMoving': instance.isMoving,
    };
