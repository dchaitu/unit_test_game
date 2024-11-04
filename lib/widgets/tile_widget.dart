import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'ant_widget.dart';
import 'bee_widget.dart';
import '../providers/game_state_provider.dart';
import '../models/tile.dart';

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


    List<Widget> generateBees = List.generate(tile.bees!.length, (index) {
      return Positioned(
        top: 10,
        left: (10 + 10 * index).toDouble(),
        child: (tile.isBeePresent==true)? BeeWidget(bee: tile.bees![index],

        ):const SizedBox(),
      );
    });

    Widget tileBgImage(String imageUrl, Widget childWidget)
    {
      return Container(
        height: 80,
        width: 80,
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
