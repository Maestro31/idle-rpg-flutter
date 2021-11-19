import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:idle_rpg_flutter/app/themes/theme.dart';

class UIPrimaryButton extends StatelessWidget {
  final bool? disabled;
  final String label;
  final void Function()? onPressed;

  const UIPrimaryButton({Key? key, required this.label, required this.onPressed, this.disabled})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: CustomColors.extraDarkBrown,
        minimumSize: const Size(double.infinity, 48),
      ),
      child: Text(label, style: TextStyle(color: CustomColors.lightBrown1)),
      onPressed: disabled == true ? null : onPressed,
    );
  }
}
