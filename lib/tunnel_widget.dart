import 'package:flutter/material.dart';
import 'package:unit_test_game/tile_widget.dart';
import 'tile.dart';

class TunnelWidget extends StatelessWidget {
  final List<Tile> tiles;

  const TunnelWidget({super.key, required this.tiles});



  List<Widget> generateTunnel(List<Tile> tiles)
  {
    print("generateTunnel");
    List<TileWidget> tileWidgets = [];

    for (int i = 0; i < tiles.length - 1; i++) {
      tiles[i] = tiles[i].copyWith(nextTile: tiles[i + 1]);
    }

    for(int i=0; i< tiles.length;i++) {
      tileWidgets.add(TileWidget(tile: tiles[i])
    );
  }

    return tileWidgets;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: generateTunnel(tiles),
    );
  }
}
