import '../constants/image_assets.dart';

class Ant {
  static const antImagePath = ImageAssets.antThrower;
  static const damage = 1;
  static const lower = 0;
  static const upper = 99;
  static const food = 3;
  static const maxHealth = 2;
  static const name = "Thrower";

  final int currHealth;

  Ant({this.currHealth = 2});

  Ant copyWith({int? currHealth}) {
    return Ant(currHealth: currHealth ?? this.currHealth);
  }

  @override
  String toString() {
    return '($name : health $currHealth)';
  }


}