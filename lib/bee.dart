
import 'constants/image_assets.dart';

class Bee{
  final String? beeKey;
  final String imagePath;
  int health;
  final int damage;

  Bee({
    this.beeKey,
    this.imagePath = ImageAssets.bee,
    this.health = 2,
    this.damage = 1,
  });

  Bee copyWith({String? beeKey, String? imagePath, int? health, int? damage}) {
    return Bee(
      beeKey: beeKey ?? this.beeKey,
      imagePath: imagePath ?? this.imagePath,
      health: health ?? this.health,
      damage: damage ?? this.damage,
    );
  }

  void reduceBeeHealth()
  {
    health -=1;
  }

}