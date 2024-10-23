
import 'constants/image_assets.dart';

class Ant {
  final String antImagePath;
  final int damage;
  int health;
  final int lower;
  final int upper;



  Ant({
    this.antImagePath= ImageAssets.antThrower,
    this.damage = 1,
    this.health = 2,
    this.lower= 0,
    this.upper=99,
  });

  Ant copyWith({String? antImagePath, int? lower, int? upper, int? health, int? damage}) {
    return Ant(
      antImagePath: antImagePath ?? this.antImagePath,
      lower: lower ?? this.lower,
      upper: upper ?? this.upper,
      health: health ?? this.health,
      damage: damage ?? this.damage,
    );
  }

  void reduceAntHealth()
  {
    print("Ant Health $health");
    health -=1;
  }

}