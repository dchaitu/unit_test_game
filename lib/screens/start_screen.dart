import 'dart:async';

import 'package:flutter/material.dart';
import 'package:unit_test_game/widgets/background_widget.dart';

import 'game_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: BackgroundWidget(
          mainWidget: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Positioned(
            left: width * 0.2,
            top: height * 0.4,
            child: const Text(
              "Ants Web Viewer",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 32),
            ),
          ),
          const SizedBox(height: 20),
          Positioned(
            left: width * 0.2,
            top: height * 0.4 + 100,
            child: ElevatedButton.icon(
              iconAlignment: IconAlignment.end,
              icon: const Icon(
                Icons.play_arrow,
                color: Colors.black,
                size: 30.0,
              ),
              label: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Play Ants',
                    style: TextStyle(color: Colors.black, fontSize: 17)),
              ),
              onPressed: () {
                Timer(Duration(milliseconds: 5), () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const GameScreen()));
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xffFFEECC),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
