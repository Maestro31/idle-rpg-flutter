import 'package:flutter/material.dart';
import 'package:idle_rpg_flutter/app/containers/private_page.dart';
import 'package:idle_rpg_flutter/app/containers/page_layout.dart';

class HomePage extends StatelessWidget {
  static const String routeName = '/';

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const PrivatePage(
      backRouteName: routeName,
      child: PageLayout(child: Text("Home page")),
    );
  }
}
