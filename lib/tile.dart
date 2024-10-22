import 'package:unit_test_game/ant_widget.dart';
import 'package:unit_test_game/bee_widget.dart';


class Tile {
  String? tileKey;
  bool get isAntPresent => antImagePath != null;
  String? antImagePath;
  final String groundTileImgUrl;
  final String skyTileImgUrl;
  int noOfBees;
  List<BeeWidget>? get bees => Tile.createAndGetBees(noOfBees);
  Tile? nextTile;
  bool get isBeePresent=> bees?.isNotEmpty== true;


  Tile({
    this.tileKey,
    this.antImagePath,
    required this.groundTileImgUrl,
    required this.skyTileImgUrl,
    required this.noOfBees,
    this.nextTile,
  });
  @override
  String toString() {
    return 'Tile(tileKey: $tileKey, isAntPresent: $isAntPresent, isBeePresent: $isBeePresent, noOfBees: $noOfBees, nextTile: ${nextTile?.tileKey}';
  }

  Tile copyWith({
    String? tileKey,
    bool? isAntPresent,
    AntWidget? ant,
    String? antImagePath,
    bool? isBeePresent,
    String? groundTileImgUrl,
    String? skyTileImgUrl,
    int? noOfBees,
    List<BeeWidget>? bees,
    Tile? nextTile,})
  {
    return Tile(
        tileKey: tileKey ?? this.tileKey,
        antImagePath:antImagePath ?? this.antImagePath,
        groundTileImgUrl: groundTileImgUrl ?? this.groundTileImgUrl,
        skyTileImgUrl: skyTileImgUrl ?? this.skyTileImgUrl,
        noOfBees: noOfBees?? this.noOfBees,
        nextTile: nextTile?? this.nextTile
    );

  }

    static List<BeeWidget>? createAndGetBees(int noOfBees)
  {
    List<BeeWidget> bees = [];
    for(int i=0;i<noOfBees;i++)
      {
        bees.add(
            BeeWidget(
              onMove: () { print("Bee moving"); },
              onSting: () {
              print("Bee sting in tile");
            },)
        );
      }
    return bees;
  }



  // void moveBeeForward() {
  //   print("tile moveBeeForward $nextTile");
  //   if (nextTile != null) {
  //     nextTile!.bees!.addAll(bees!);  // Move bees to the next tile
  //     // nextTile!.isBeePresent = true;
  //     bees!.clear();  // Clear bees from current tile
  //     // bees = [];
  //     // isBeePresent = false;
  //     print("Removing Bees from ${nextTile?.tileKey}");
  //
  //   }
  //   else{
  //     print("Ending Cell");
  //   }
  // }


  // void beeStingsAnt() {
  //   if (isBeePresent && isAntPresent && ant != null) {
  //     for (BeeWidget bee in bees) {
  //       // bee.sting(ant!);
  //       print("Bee stung the ant on tile $tileKey, ant health: ${ant!.health}");
  //     }
  //     if (ant!.health <= 0) {
  //       removeAnt();
  //     }
  //   }
  // }

  // Ant attacks bees
  // void antAttacksBees() {
  //   if (isAntPresent && isBeePresent) {
  //     ant?.attack(bees);
  //     print("Ant attacked bees on tile $tileKey, number of bees left: ${bees.length}");
  //     if (bees.isEmpty) {
  //       isBeePresent = false;
  //     }
  //   }
  // }

  // void removeAnt() {
  //   isAntPresent = false;
  //   ant = null;
  //   antImage = null;
  // }



}



