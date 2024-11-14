import 'ant.dart';
import 'bee.dart';
import '../constants/get_ants.dart';


class Tile {
  String? tileKey;
  String? antImagePath;
  Ant? ant;
  final String groundTileImgUrl;
  final String skyTileImgUrl;
  List<Bee>? bees;
  Tile? nextTile;
  int get noOfBees => bees!.length;
  bool get isBeePresent=> bees?.isNotEmpty== true;
  bool get isAntPresent => ant != null;


  Tile({
    this.tileKey,
    this.antImagePath,
    this.ant,
    required this.groundTileImgUrl,
    required this.skyTileImgUrl,
    this.nextTile,
    this.bees
  });

  factory Tile.fromImgPath({
    String? tileKey,
    String? antImagePath,
    required String groundTileImgUrl,
    required String skyTileImgUrl,
    Tile? nextTile,
    List<Bee>? bees
  })
  {
    Ant? antObj = antImagePath != null ? getAntFromImage(antImagePath) : null;


    return Tile(
      tileKey: tileKey,
      antImagePath: antImagePath,
      ant: antObj,
      groundTileImgUrl: groundTileImgUrl,
      skyTileImgUrl: skyTileImgUrl,
      nextTile: nextTile,
      bees: bees
    );
  }


  @override
  String toString() {
    return 'Tile(tileKey: $tileKey, isAntPresent: $isAntPresent, isBeePresent: $isBeePresent, noOfBees: $noOfBees, nextTile: ${nextTile?.tileKey})';
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
        ant: ant ?? this.ant
    );

  }


}



