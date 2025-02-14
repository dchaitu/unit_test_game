import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unit_test_game/models/freezed_models/tile/tile.dart';
import 'ant_widget.dart';
import 'bee_widget.dart';
import '../providers/game_state_provider.dart';

class TileWidget extends ConsumerWidget {
  final Tile tile;
  final AntWidget? ant;

  const TileWidget({
    super.key,
    required this.tile,
    this.ant
  });



  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    List<Widget> generateBees = List.generate(tile.bees!.length, (index) {
      return Positioned(
        top: 0,
        left: (9*(1+index) ).toDouble(),
        child:  Stack(
          children: [
            (tile.isBeePresent==true)? FittedBox(
                  child: BeeWidget(
                    bee: tile.bees![index],
                  ),
                )
              : const SizedBox()
        ]
        ),
      );
    });

    Widget tileBgImage(String imageUrl, Widget childWidget)
    {
      return Container(
        height: height*0.15,
        width: width*0.08,
        margin: const EdgeInsets.only(right: 5),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imageUrl),
            fit: BoxFit.fill,
          ),
        ),
        child: childWidget
      );
    }

    return GestureDetector(
      onTap: ()
      {
        ref.read(gameStateProvider.notifier).addImgToTile(tile);

      },
      child: Column(
          children: [

            tileBgImage(tile.skyTileImgUrl,(tile.isBeePresent)
                ? Stack(
              children: generateBees,
            )
                : const SizedBox()
            ),

          tileBgImage(tile.groundTileImgUrl,

          (tile.isAntPresent && tile.antImagePath != null)
              ? FittedBox(
                  fit: BoxFit.scaleDown,
                  child: AntWidget(
                      ant: tile.ant!,
                  ),
                )
              : const SizedBox(),
        ),
      ]),
    );
  }



}
