import 'package:flutter/material.dart';
import 'package:idle_rpg_flutter/redux/app_state.dart';
import 'package:idle_rpg_flutter/redux/configure_store.dart';
import 'package:redux/redux.dart';

import 'package:idle_rpg_flutter/app.dart';
import 'package:idle_rpg_flutter/dependencies.dart';
import 'package:idle_rpg_flutter/redux/widgets/redux_provider.dart';

import 'core/auth/gateways/fake_user_gateway.dart';

late final Dependencies dependencies;

void main() {
  dependencies = Dependencies(userGateway: FakeUserGateway());
  Store<AppState> store = configureStore(dependencies);
  runApp(ReduxApp(store: store));
}

class ReduxApp extends StatelessWidget {
  final Store<AppState> store;
  final GlobalKey<NavigatorState>? navigatorKey;

  const ReduxApp({Key? key, required this.store, this.navigatorKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ReduxProvider(
      store: store,
      child: const MyApp(),
    );
  }
}
