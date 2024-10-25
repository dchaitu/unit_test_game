import 'package:unit_test_game/models/thrower_ant.dart';

import 'ant.dart';
import 'bee.dart';
import '../constants/get_ants.dart';
import '../constants/image_assets.dart';


class Tile {
  String? tileKey;
  bool get isAntPresent => antImagePath != null;
  String? antImagePath;
  Ant? get ant => getAntFromImage(antImagePath!);
  final String groundTileImgUrl;
  final String skyTileImgUrl;
  int get noOfBees => bees!.length;
  List<Bee>? bees;
  Tile? nextTile;
  bool get isBeePresent=> bees?.isNotEmpty== true;


  Tile({
    this.tileKey,
    this.antImagePath,
    // this.ant,
    required this.groundTileImgUrl,
    required this.skyTileImgUrl,
    this.nextTile,
    this.bees
  });
  @override
  String toString() {
    return 'Tile(tileKey: $tileKey, isAntPresent: $isAntPresent, isBeePresent: $isBeePresent, noOfBees: $noOfBees, nextTile: ${nextTile?.tileKey}';
  }

  Tile copyWith({
    String? tileKey,
    bool? isAntPresent,
    Ant? ant,
    String? antImagePath,
    bool? isBeePresent,
    String? groundTileImgUrl,
    String? skyTileImgUrl,
    int? noOfBees,
    List<Bee>? bees,
    Tile? nextTile,})
  {
    return Tile(
        tileKey: tileKey ?? this.tileKey,
        antImagePath:antImagePath ?? this.antImagePath,
        groundTileImgUrl: groundTileImgUrl ?? this.groundTileImgUrl,
        skyTileImgUrl: skyTileImgUrl ?? this.skyTileImgUrl,
        bees: bees?? this.bees,
        nextTile: nextTile?? this.nextTile,
        // ant: ant ?? this.ant
    );

  }

  static List<Bee>? createAndGetBees(int noOfBees)
  {
    List<Bee> bees = [];
    for(int i=0;i<noOfBees;i++)
      {
        bees.add(Bee());
      }
    return bees;
  }

  Tile? getTileFromTileKey(String tileKey)
  {
    if(this.tileKey == tileKey)
        return this;
    return null;
  }


}



