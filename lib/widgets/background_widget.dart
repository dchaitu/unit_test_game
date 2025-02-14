import 'package:flutter/material.dart';
import 'package:unit_test_game/constants/image_assets.dart';

class BackgroundWidget extends StatelessWidget {
  final Widget mainWidget;
  final double gameScreenWidth;

  final double gameScreenHeight;

  const BackgroundWidget(
      {super.key,
      required this.mainWidget,
      required this.gameScreenWidth,
      required this.gameScreenHeight});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Stack(alignment: AlignmentDirectional.center, children: [
      Container(
        width: width,
        height: height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImageAssets.swirlPatternBg),
            repeat: ImageRepeat.repeat,
          ),
        ),
      ),
      Container(
        width: gameScreenWidth,
        height: gameScreenHeight,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImageAssets.gameBg),
            fit: BoxFit.fill,
          ),
        ),
        child: mainWidget,
      )
    ]);
  }
}
