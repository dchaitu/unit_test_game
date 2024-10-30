
import '../constants/image_assets.dart';

class Ant {
  final String antImagePath;
  final int damage;
  final int currHealth;
  final int maxHealth;
  final int lower;
  final int upper;
  final int food;
  final String name;



  Ant({
    this.antImagePath= ImageAssets.antThrower,
    this.damage = 1,
    this.maxHealth = 2,
    this.currHealth=2,
    this.lower= 0,
    this.upper=99,
    this.food=3,
    this.name="Thrower"
  });

  Ant copyWith({String? antImagePath, int? lower, int? upper, int? maxHealth, int? damage, int? food, int? currHealth}) {
    return Ant(
      antImagePath: antImagePath ?? this.antImagePath,
      lower: lower ?? this.lower,
      upper: upper ?? this.upper,
      currHealth: currHealth ?? this.currHealth,
      damage: damage ?? this.damage,
      food: food?? this.food,
      maxHealth:maxHealth ?? this.maxHealth
    );
  }


}