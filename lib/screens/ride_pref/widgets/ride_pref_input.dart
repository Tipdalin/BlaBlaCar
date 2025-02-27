import 'package:flutter/material.dart';
import 'package:week_3_blabla_project/theme/theme.dart';

class RidePrefInputTile extends StatelessWidget {
  final String title;
  final IconData icon;

  final VoidCallback onPressed;

  final bool isPlaceholder;

  const RidePrefInputTile({super.key, required this.title, required this.icon, required this.onPressed, this.isPlaceholder = false});

  @override
  Widget build(BuildContext context) {

    Color textColor = isPlaceholder ? BlaColors.textLight : BlaColors.textNormal;
    return  ListTile(
      onTap: onPressed,
      title: Text(title,
          style: BlaTextStyles.button.copyWith(fontSize: 14, color: textColor)),
      leading: Icon(
        icon,
        size: BlaSize.icon,
        color: BlaColors.iconLight,
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: BlaSize.icon,
        color: BlaColors.iconLight,
      ),
    );
  }
}
