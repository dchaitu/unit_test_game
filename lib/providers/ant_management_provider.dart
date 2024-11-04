import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unit_test_game/models/ant.dart';
import 'package:unit_test_game/models/bee.dart';
import 'package:unit_test_game/models/tile.dart';

final antManagementProvider = StateNotifierProvider<AntManagementNotifier, AntState>((ref) {
  return AntManagementNotifier();
});

class AntState {
  final List<Tile> tiles;
  final int foodAvailable;

  AntState({required this.tiles, required this.foodAvailable});

  AntState copyWith({List<Tile>? tiles, int? foodAvailable}) {
    return AntState(
      tiles: tiles ?? this.tiles,
      foodAvailable: foodAvailable ?? this.foodAvailable,
    );
  }
}

class AntManagementNotifier extends StateNotifier<AntState> {
  AntManagementNotifier() : super(AntState(tiles: [], foodAvailable: 50));

  void addAntToTile(Tile tile, String antImagePath) {
    if (state.foodAvailable > 0 && !tile.isAntPresent) {
      tile.antImagePath = antImagePath;
      tile.ant = Ant(); // Assuming an Ant constructor
      state = state.copyWith(
          tiles: List.from(state.tiles), foodAvailable: state.foodAvailable - tile.ant!.food);
    }
  }

  Bee reduceBeeHealth(Bee bee)
  {
    return bee.copyWith(currHealth: bee.currHealth-1);
  }

  void antAttack(Tile tile, Tile? nearestBeeTile) {
    if (nearestBeeTile != null) {
      var bee = nearestBeeTile.bees?.last;
      bee = reduceBeeHealth(bee!);
      if (bee != null && bee.currHealth <= 0) {
        nearestBeeTile.bees?.remove(bee);
      }
      state = state.copyWith(tiles: List.from(state.tiles)); // Triggers update for tiles
    }
  }
}
