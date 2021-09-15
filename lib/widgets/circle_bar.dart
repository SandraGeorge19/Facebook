import 'package:flutter/material.dart';

class CircleBar extends StatelessWidget {
  final Widget icon;
  final Function onPress;

  const CircleBar({
    required this.icon,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: () {
          onPress;
        },
        icon: icon,
      ),
    );
  }
}
