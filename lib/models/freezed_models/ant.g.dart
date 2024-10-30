// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AntImpl _$$AntImplFromJson(Map<String, dynamic> json) => _$AntImpl(
      antImagePath: json['antImagePath'] as String? ?? ImageAssets.antThrower,
      damage: (json['damage'] as num?)?.toInt() ?? 1,
      currHealth: (json['currHealth'] as num?)?.toInt() ?? 2,
      lower: (json['lower'] as num?)?.toInt() ?? 0,
      upper: (json['upper'] as num?)?.toInt() ?? 99,
      food: (json['food'] as num?)?.toInt() ?? 3,
      name: json['name'] as String? ?? "Thrower",
    );

Map<String, dynamic> _$$AntImplToJson(_$AntImpl instance) => <String, dynamic>{
      'antImagePath': instance.antImagePath,
      'damage': instance.damage,
      'currHealth': instance.currHealth,
      'lower': instance.lower,
      'upper': instance.upper,
      'food': instance.food,
      'name': instance.name,
    };
