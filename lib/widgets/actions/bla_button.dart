import 'package:flutter/material.dart';
import 'package:week_3_blabla_project/theme/theme.dart';

enum BlaButtonType { primary, secondary }

class BlaButton extends StatelessWidget {
  final BlaButtonType type;
  final String text;
  final VoidCallback onPressed;
  final IconData? icon;

  const BlaButton({
    super.key,
    required this.type,
    required this.text,
    required this.onPressed,
    this.icon,
  });
  @override
  Widget build(BuildContext context) {
    if (type == BlaButtonType.primary) {
      return SizedBox(
        width: 400,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: BlaColors.primary,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) Icon(icon, color: Colors.white),
              Text(text, style: TextStyle(color: Colors.white)),
            ],
          ),
        ),
      );
    } else if (type == BlaButtonType.secondary) {
      return SizedBox(
        width: 400,
        child: OutlinedButton(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
            foregroundColor: BlaColors.primary,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) Icon(icon, color: BlaColors.primary),
              Text(text, style: TextStyle(color: BlaColors.primary)),
            ],
          ),
        ),
      );
    }
    return Container();
  }
}
