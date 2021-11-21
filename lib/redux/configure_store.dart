import 'package:idle_rpg_flutter/dependencies.dart';
import 'package:idle_rpg_flutter/redux/app_reducer.dart';

import 'package:idle_rpg_flutter/redux/app_state.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

Store<AppState> configureStore(Dependencies dependencies) {
  final store = Store<AppState>(
    appReducer,
    initialState: AppState.initialState(),
    middleware: [
      ExtraArgumentThunkMiddleware<AppState, Dependencies>(dependencies),
    ],
  );

  return store;
}
