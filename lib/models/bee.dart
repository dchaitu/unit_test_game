import 'package:unit_test_game/constants/image_assets.dart';

class Bee {
  static const imagePath = ImageAssets.bee;
  static const damage = 1;
  static const maxHealth = 2;
  final int currHealth;

  Bee({
    this.currHealth = 2,
  });

  Bee copyWith({int? currHealth}) {
    return Bee(
      currHealth: currHealth ?? this.currHealth,
    );
  }
}