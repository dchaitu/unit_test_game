import 'ant.dart';
import '../constants/image_assets.dart';

class ShortThrowerAnt extends Ant {
  ShortThrowerAnt()
      : super(
          antImagePath: ImageAssets.antShortthrower,
          lower: 0,
          upper: 3,
          food: 2,
          name:"Short"
        );

  @override
  ShortThrowerAnt copyWith(
      {String? antImagePath,
      int? lower,
      int? upper,
      int? health,
      int? damage,
      int? food}) {
    return ShortThrowerAnt()..health = health ?? this.health;
  }

  @override
  void reduceAntHealth() {
    super.reduceAntHealth();
    print("Short Thrower Ant");
  }
}

class LongThrowerAnt extends Ant {
  LongThrowerAnt()
      :super(antImagePath: ImageAssets.antLongthrower,
            lower: 5,
            upper: 99,
            food: 2,
            name:"Long"
      );

  @override
  LongThrowerAnt copyWith(
      {String? antImagePath,
        int? lower,
        int? upper,
        int? health,
        int? damage,
        int? food}) {

    return LongThrowerAnt()..health = health ?? this.health;
  }

  @override
  void reduceAntHealth() {
    super.reduceAntHealth();
    print("Short Thrower Ant");
  }
}
