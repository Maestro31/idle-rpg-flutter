import 'package:flutter/material.dart';
import 'package:idle_rpg_flutter/app/themes/theme.dart';

class FormContainer extends StatelessWidget {
  final String title;
  final Widget child;

  const FormContainer({Key? key, required this.title, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context).custom.authTheme;

    return Container(
      margin: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: CustomColors.lightBrown2,
        boxShadow: const [
          BoxShadow(
            color: Color(0x3F000000),
            spreadRadius: 4,
            blurRadius: 4,
          )
        ],
      ),
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: theme.textTheme.headline3,
          ),
          const SizedBox(height: 10),
          child,
        ],
      ),
    );
  }
}
