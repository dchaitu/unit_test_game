import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:unit_test_game/constants/image_assets.dart';
part 'ant.g.dart';
part 'ant.freezed.dart';



@freezed
class Ant with _$Ant{
  static const antImagePath = ImageAssets.antThrower;
  static const damage = 1;
  static const lower = 0;
  static const upper = 99;
  static const food = 3;
  static const maxHealth = 2;
  static const name = "Thrower";
 const factory Ant({
   @Default(2) int currHealth,


 }) = _Ant;

 factory Ant.fromJson(Map<String, dynamic> json) => _$AntFromJson(json);
}