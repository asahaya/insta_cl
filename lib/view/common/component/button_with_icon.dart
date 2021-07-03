import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ButtonWithIcon extends StatelessWidget {
  final IconData iconData;
  final VoidCallback? onPressed;
  final String label;

  //required==絶対入れる変数
  ButtonWithIcon({
    required this.iconData,
    this.onPressed,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: FaIcon(iconData),//  font_awesome_flutter:
      label:Text(label),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        )
      ),
    );
  }
}
