
import '../constants/image_assets.dart';
import 'insect.dart';

class Bee{

  final String imagePath;
  final int damage;
  final int currHealth;
  final int maxHealth;

  Bee({
    this.imagePath=ImageAssets.bee,
    this.damage = 1,
    this.maxHealth = 2,
    this.currHealth=2,
  });



  Bee copyWith({String? imagePath, int? currHealth, int? damage, int? maxHealth}) {
    return Bee(
        currHealth: currHealth ?? this.currHealth,
        maxHealth: maxHealth ?? this.maxHealth,
        damage:damage ?? this.damage,
        imagePath:imagePath??this.imagePath
    );
  }

  // void reduceBeeHealth()
  // {
  //   print("Bee health reduced");
  //   // super.reduceHealth();
  // }

}