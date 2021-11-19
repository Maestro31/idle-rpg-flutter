import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:idle_rpg_flutter/app/themes/theme.dart';

class UITextButton extends StatelessWidget {
  final String label;
  final void Function()? onPressed;

  const UITextButton({Key? key, required this.label, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(label,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: CustomColors.extraDarkBrown,
          fontSize: 18,
          decoration: TextDecoration.underline,
        )
      ),
      onPressed: onPressed,
    );
  }
}
