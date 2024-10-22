
import 'constants/image_assets.dart';

class Bee{
  final String beeKey;
  final String imagePath;
  final int health;
  final int damage;

  const Bee({
    this.beeKey,
    this.imagePath = ImageAssets.bee,
    this.health = 2,
    this.damage = 1,
    // required this.onMove,
    // required this.onSting,
  });

}