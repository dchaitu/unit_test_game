import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'ant_widget.dart';
import 'bee_widget.dart';
import 'providers.dart';
import 'tile.dart';

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

    // print("Tile Ants:- ${tile.antImagePath} ${tile.isAntPresent} ${tile.noOfBees}");

    print("NO of bees ${tile.bees!.length}");
    List<Widget> generateBees = List.generate(tile.bees!.length, (index) {
      return Positioned(
        top: 10,
        left: (10 + 10 * index).toDouble(),
        child: (tile.isBeePresent==true)? BeeWidget(
          onMove: () {
            // tile.moveBeeForward();
          },
          onSting: () {
            if (tile.isAntPresent) {
              // stingAnt(index);
              // bee.sting(tile.ant!);
            }
          },
        ):const SizedBox(),
      );
    });

    return Column(children: [
      Container(
        height: 80,
        width: 80,
        margin: const EdgeInsets.only(right: 5),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(tile.skyTileImgUrl),
            fit: BoxFit.fill,
          ),
        ),
        child: (tile.isBeePresent)
            ? Stack(
                children: generateBees,
              )
            : const SizedBox(),
      ),
      Container(
        height: 80,
        width: 80,
        margin: const EdgeInsets.only(right: 5),
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage(tile.groundTileImgUrl),
          fit: BoxFit.fill,
        )
        ),
        child: (tile.isAntPresent && tile.antImagePath != null)
            ? FittedBox(
                fit: BoxFit.scaleDown,
                child: AntWidget(onThrow: (){
                      ref.read(tilesProvider.notifier).antAttack();
                      ref.read(tilesProvider.notifier).nearestBee();
                      ref.read(tilesProvider.notifier).antSpecialAttack();
                } //onThrowOnAnt,
                ),
              )
            : const SizedBox(),
      ),
    ]);
  }



}
