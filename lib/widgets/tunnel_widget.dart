import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unit_test_game/widgets/tile_widget.dart';
import '../models/tile.dart';

class TunnelWidget extends ConsumerWidget {
  final List<Tile> tiles;

  const TunnelWidget({super.key, required this.tiles});



  List<Widget> generateTunnel(List<Tile> tiles)
  {
    List<TileWidget> tileWidgets = [];

    for (int i = 0; i < tiles.length - 1; i++) {
      tiles[i].nextTile = tiles[i + 1];
    }

    for(int i=0; i< tiles.length;i++) {
      tileWidgets.add(TileWidget(tile: tiles[i])
    );
  }

    return tileWidgets;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: generateTunnel(tiles),
    );
  }
}
