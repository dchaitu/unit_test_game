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
    // Calculate tile size based on screen width
    final double screenWidth = MediaQuery.of(context).size.width;
    final double tileSize = screenWidth * 0.06; // 8% of screen width
    final double tileHeight = tileSize * 0.6; // Reduced height for better tunnel visibility
    
    // Calculate bee size as 85% of tile size (within 80-90% range)
    final double beeSize = tileSize * 0.6;

    List<Widget> generateBees = List.generate(tile.bees!.length, (index) {
      return Positioned(
        top: (tileSize * 0.2) - (beeSize / 2), // Center vertically
        left: (beeSize * 0.5 * index), // Space out bees horizontally
        child: tile.isBeePresent == true
            ? BeeWidget(
                bee: tile.bees![index],
                size: beeSize,
              )
            : const SizedBox(),
      );
    });

    Widget tileBgImage(String imageUrl, Widget childWidget) {
      return Container(
        height: tileHeight,
        width: tileSize,
        margin: const EdgeInsets.only(right: 5),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imageUrl),
            fit: BoxFit.fill,
          ),
        ),
        child: childWidget,
      );
    }

    return GestureDetector(
      onTap: () {
        ref.read(gameStateProvider.notifier).addImgToTile(tile);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Sky tile with bees
          SizedBox(
            height: tileSize,
            width: tileSize,
            child: tileBgImage(
              tile.skyTileImgUrl,
              tile.isBeePresent
                  ? Stack(
                      clipBehavior: Clip.none,
                      children: generateBees,
                    )
                  : const SizedBox(),
            ),
          ),
          // Ground tile with ant
          SizedBox(
            height: tileHeight,
            width: tileSize,
            child: tileBgImage(
              tile.groundTileImgUrl,
              tile.isAntPresent && tile.antImagePath != null
                  ? FittedBox(
                      fit: BoxFit.scaleDown,
                      child: AntWidget(
                        ant: tile.ant!,
                        size: tileSize * 0.8, // Make ant size consistent with bees
                      ),
                    )
                  : const SizedBox(),
            ),
          ),
        ],
      ),
    );
  }
}
