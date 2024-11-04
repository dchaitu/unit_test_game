import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:unit_test_game/constants/image_assets.dart';
part 'bee.g.dart';
part 'bee.freezed.dart';

@freezed
class Bee with _$Bee{
  const factory Bee({
    @Default(ImageAssets.bee) String antImagePath,
    @Default(1) int damage,
    @Default(2) int currHealth,
    @Default(2) int maxHealth

}) = _Bee;

factory Bee.fromJson(Map<String, dynamic> json) => _$BeeFromJson(json);

}