
import '../constants/image_assets.dart';

class Ant {
  final String antImagePath;
  final int damage;
  int health;
  final int lower;
  final int upper;
  final int food;
  final String name;



  Ant({
    this.antImagePath= ImageAssets.antThrower,
    this.damage = 1,
    this.health = 2,
    this.lower= 0,
    this.upper=99,
    this.food=3,
    this.name="Thrower"
  });

  Ant copyWith({String? antImagePath, int? lower, int? upper, int? health, int? damage, int? food}) {
    return Ant(
      antImagePath: antImagePath ?? this.antImagePath,
      lower: lower ?? this.lower,
      upper: upper ?? this.upper,
      health: health ?? this.health,
      damage: damage ?? this.damage,
      food: food?? this.food
    );
  }

  void reduceAntHealth()
  {
    print("Ant Health $health");
    health -=1;
  }

}