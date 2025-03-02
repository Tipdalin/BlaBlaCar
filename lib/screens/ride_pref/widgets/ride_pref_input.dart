import 'package:flutter/material.dart';

import '../../../theme/theme.dart';

class RidePrefTile extends StatelessWidget {
  final String title;
  final IconData iconLeft;
  final VoidCallback onTap;
  final IconData? iconRight;
  final VoidCallback? onRightTap;
  final bool isInput;

  const RidePrefTile({
    super.key,
    required this.title,
    required this.iconLeft,
    required this.onTap,
    this.iconRight,
    this.onRightTap,
    this.isInput = false,
  });

  @override
  Widget build(BuildContext context) {
    Color textColor = isInput ? BlaColors.textNormal : BlaColors.iconLight;

    return ListTile(
      onTap: onTap,
      title: Text(title, style: BlaTextStyles.label.copyWith(color: textColor)),
      leading: Icon(iconLeft, color: BlaColors.iconNormal),
      trailing: iconRight != null
          ? IconButton(
              icon: Icon(iconRight, color: BlaColors.iconNormal),
              onPressed: onRightTap,
            )
          : null,
    );
  }
}
