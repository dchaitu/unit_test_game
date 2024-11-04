// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BeeImpl _$$BeeImplFromJson(Map<String, dynamic> json) => _$BeeImpl(
      antImagePath: json['antImagePath'] as String? ?? ImageAssets.bee,
      damage: (json['damage'] as num?)?.toInt() ?? 1,
      currHealth: (json['currHealth'] as num?)?.toInt() ?? 2,
      maxHealth: (json['maxHealth'] as num?)?.toInt() ?? 2,
    );

Map<String, dynamic> _$$BeeImplToJson(_$BeeImpl instance) => <String, dynamic>{
      'antImagePath': instance.antImagePath,
      'damage': instance.damage,
      'currHealth': instance.currHealth,
      'maxHealth': instance.maxHealth,
    };
