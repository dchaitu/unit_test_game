import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unit_test_game/models/ant.dart';
import 'package:unit_test_game/models/bee.dart';
import 'package:unit_test_game/models/tile.dart';

final beeManagementProvider = StateNotifierProvider<BeeManagementNotifier, BeeState>((ref) {
  return BeeManagementNotifier();
});

class BeeState {
  final List<Tile> tiles;
  final int beesInHive;

  BeeState({required this.tiles, required this.beesInHive});

  BeeState copyWith({List<Tile>? tiles, int? beesInHive}) {
    return BeeState(
      tiles: tiles ?? this.tiles,
      beesInHive: beesInHive ?? this.beesInHive,
    );
  }
}

class BeeManagementNotifier extends StateNotifier<BeeState> {
  BeeManagementNotifier() : super(BeeState(tiles: [], beesInHive: 10));

  void addBeeToEnd(List<Tile> gameTiles) {
    if (state.beesInHive > 0) {
      final updatedTiles = state.tiles;
      for (Tile tile in gameTiles) {
        tile.bees?.add(Bee());
        updatedTiles.add(tile);
      }
      state = state.copyWith(tiles: updatedTiles, beesInHive: state.beesInHive - gameTiles.length);
    }
  }

  void moveBeeForward() {
    print("Bees moving forward");
    // Implement move logic here
  }

  Ant? reduceHealth(Ant ant)
  {
    return ant.currHealth>1? ant.copyWith(currHealth: ant.currHealth-1):null;
  }

  void beeSting(Tile tile) {
    if (tile.isBeePresent && tile.isAntPresent) {
      print("Ant reduceHealth ${tile.ant}");
      Ant? newAnt = this.reduceHealth(tile.ant!);

      tile.ant = newAnt;
      if(tile.ant!.currHealth<=0) {
        tile.antImagePath = null;
        tile.ant = null;
        print("Ant end");
      }
      state = state.copyWith(tiles: List.from(state.tiles)); // Update with new tile state
    }
  }
}
