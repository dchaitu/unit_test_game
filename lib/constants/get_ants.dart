import 'package:unit_test_game/models/ant.dart';
import 'package:unit_test_game/models/thrower_ant.dart';
import 'image_assets.dart';

Ant? getAntFromImage(String imagePath) {
  if (imagePath == ImageAssets.antThrower) {
    return Ant();
  } else if (imagePath == ImageAssets.antShortthrower) {
    return ShortThrowerAnt();
  } else if (imagePath == ImageAssets.antLongthrower) {
    return LongThrowerAnt();
  }

  return null;

}
