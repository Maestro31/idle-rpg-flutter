import 'package:flutter/material.dart';
import 'package:idle_rpg_flutter/app/themes/theme.dart';

class UITextField extends StatelessWidget {
  final String label;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final bool obscureText;

  const UITextField(
      {Key? key,
      required this.label,
      this.onChanged,
      this.validator,
      this.controller,
      this.obscureText = false})
      : super(key: key);

  @override
  Widget build(context) {
    final ThemeData theme = Theme.of(context).copyWith(splashColor: Colors.transparent);

    return Theme(
        data: theme,
        child: TextFormField(
          decoration: InputDecoration(
            filled: true,
            fillColor: CustomColors.lightBrown1,
            border: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(3.0)),
            ),
            labelText: label,
            labelStyle: TextStyle(color: CustomColors.lightBrown2),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            isDense: true,
          ),
          style: TextStyle(color: CustomColors.darkBrown),
          cursorColor: CustomColors.darkBrown,
          onChanged: onChanged,
          validator: validator,
          controller: controller,
          obscureText: obscureText,
        ));
  }
}
