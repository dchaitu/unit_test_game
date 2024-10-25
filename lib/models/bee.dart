
import '../constants/image_assets.dart';
import 'insect.dart';

class Bee extends Insect{
  Bee() :super(
    imagePath: ImageAssets.bee,
    health: 2,
    damage: 1,
  );



  @override
  Bee copyWith({String? imagePath, int? health, int? damage, int? food}) {
    return Bee()..health= health ?? this.health;
  }

  void reduceBeeHealth()
  {
    super.reduceHealth();
  }

}