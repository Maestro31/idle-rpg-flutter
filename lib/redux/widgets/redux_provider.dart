import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:idle_rpg_flutter/redux/app_state.dart';
import 'package:redux/redux.dart';

class ReduxProvider extends StatelessWidget {
  final Store<AppState> store;
  final Widget child;

  const ReduxProvider({
    Key? key,
    required this.store,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: child,
    );
  }
}
