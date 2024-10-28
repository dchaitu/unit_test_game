
import 'package:flutter/material.dart';
import 'package:unit_test_game/constants/image_assets.dart';

class BackgroundWidget extends StatelessWidget {
  final Widget mainWidget;
  const BackgroundWidget({super.key, required this.mainWidget });


  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
        image: DecorationImage(
        image: AssetImage(ImageAssets.swirlPatternBg),
        repeat: ImageRepeat.repeat,
          ),
        ),
      child: Container(
      width: width * 0.7,
      height: height * 0.8,
      decoration: const BoxDecoration(
      image: DecorationImage(
          image: AssetImage(ImageAssets.gameBg),
          fit: BoxFit.contain,
      ),
    ),
      child: mainWidget,

    )

    );
  }
}
