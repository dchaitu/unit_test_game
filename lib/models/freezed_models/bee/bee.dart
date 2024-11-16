import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:unit_test_game/constants/image_assets.dart';
part 'bee.g.dart';
part 'bee.freezed.dart';

@freezed
class Bee with _$Bee{
  static const imagePath = ImageAssets.bee;
  static const damage = 1;
  static const maxHealth = 2;
  const factory Bee({
    @Default(2) int currHealth,

}) = _Bee;

factory Bee.fromJson(Map<String, dynamic> json) => _$BeeFromJson(json);

}