import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unit_test_game/models/ant.dart';
import 'package:unit_test_game/models/freezed_models/tile/tile.dart';
import 'package:unit_test_game/models/thrower_ant.dart';
import 'package:unit_test_game/providers/game_state_provider.dart';
import 'image_assets.dart';

 getAntFromImage(String? imagePath) {
  if (imagePath == ImageAssets.antShortthrower) {
    return ShortThrowerAnt();
  } else if (imagePath == ImageAssets.antLongthrower) {
    return LongThrowerAnt();
  }
  return Ant();


}

String getStringFromAnt(Ant ant)
{
  String? antImgPath;
  if(ant is ShortThrowerAnt)
    {
      antImgPath = ImageAssets.antShortthrower;
    }
  else if(ant is LongThrowerAnt)
  {
    antImgPath = ImageAssets.antLongthrower;
  }
  else
  {
    antImgPath = ImageAssets.antThrower;
  }


  return antImgPath;
}
