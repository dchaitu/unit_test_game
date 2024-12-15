import 'package:flutter/material.dart';

class AlertWidget extends StatelessWidget {
  final String result;
  const AlertWidget({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding:const EdgeInsets.all(100),
      title: const Text('Game Completed'),
      content: Text(result),
      actions: <Widget>[
        TextButton(
          child: const Text('OK'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
