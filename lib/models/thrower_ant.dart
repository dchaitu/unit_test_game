import 'ant.dart';
import '../constants/image_assets.dart';

class ShortThrowerAnt extends Ant {
  ShortThrowerAnt({
    super.antImagePath = ImageAssets.antShortthrower,
    super.lower,
    super.upper = 3,
    super.food = 2,
    super.maxHealth,
    super.currHealth,
    super.damage,
    super.name = "Short"
  });

  @override
  ShortThrowerAnt copyWith({
    String? antImagePath,
    int? lower,
    int? upper,
    int? maxHealth,
    int? currHealth,
    int? damage,
    int? food,
  }) {
    return ShortThrowerAnt(
      antImagePath: antImagePath ?? this.antImagePath,
      lower: lower ?? this.lower,
      upper: upper ?? this.upper,
      maxHealth: maxHealth ?? this.maxHealth,
      currHealth: currHealth ?? this.currHealth,
      damage: damage ?? this.damage,
      food: food ?? this.food,
    );
  }
}

class LongThrowerAnt extends Ant {
  LongThrowerAnt({
    super.antImagePath = ImageAssets.antLongthrower,
    super.lower = 5,
    super.upper,
    super.food = 2,
    super.maxHealth,
    super.currHealth,
    super.damage,
    super.name = "Long"
  });

  @override
  LongThrowerAnt copyWith(
      {String? antImagePath,
        int? lower,
        int? upper,
        int? maxHealth,
        int? currHealth,
        int? damage,
        int? food}) {

    return LongThrowerAnt(
      antImagePath: antImagePath ?? this.antImagePath,
      lower: lower ?? this.lower,
      upper: upper ?? this.upper,
      maxHealth: maxHealth ?? this.maxHealth,
      currHealth: currHealth ?? this.currHealth,
      damage: damage ?? this.damage,
    );
  }


}
