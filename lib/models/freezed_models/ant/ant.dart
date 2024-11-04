import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:unit_test_game/constants/image_assets.dart';
part 'ant.g.dart';
part 'ant.freezed.dart';



@freezed
class Ant with _$Ant{
 const factory Ant({
   @Default(ImageAssets.antThrower) String antImagePath,
   @Default(1) int damage,
   @Default(2) int currHealth,
   @Default(2) int maxHealth,
   @Default(0) int lower,
   @Default(99) int upper,
   @Default(3) int food,
   @Default("Thrower") String name

 }) = _Ant;

 factory Ant.fromJson(Map<String, dynamic> json) => _$AntFromJson(json);
}