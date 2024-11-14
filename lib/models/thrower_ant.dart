import 'ant.dart';
import 'package:unit_test_game/constants/image_assets.dart';

class ShortThrowerAnt extends Ant {
  static const antImagePath = ImageAssets.antShortthrower;
  static const damage = 1;
  static const lower = 0;
  static const upper = 3;
  static const food = 2;
  static const maxHealth = 2;
  static const name = "Short";

  ShortThrowerAnt({
    super.currHealth,
  });

  @override
  ShortThrowerAnt copyWith({int? currHealth}) {
    return ShortThrowerAnt(
      currHealth: currHealth ?? this.currHealth,
    );
  }
}

class LongThrowerAnt extends Ant {
  static const antImagePath = ImageAssets.antLongthrower;
  static const damage = 1;
  static const lower = 5;
  static const upper = 99;
  static const food = 2;
  static const maxHealth = 2;
  static const name = "Long";

  LongThrowerAnt({
    super.currHealth,
  });

  @override
  LongThrowerAnt copyWith({int? currHealth}) {
    return LongThrowerAnt(
      currHealth: currHealth ?? this.currHealth,
    );
  }
}
