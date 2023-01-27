import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'main_event.dart';

enum MainStates { SplashIn, Login, HomeScreen, LoggedLoading }

class MainBloc extends Bloc<MainEvent, MainStates> {
  MainBloc() : super(MainStates.SplashIn);

  init() {
    add(LoginEvent());
  }

  @override
  Stream<MainStates> mapEventToState(MainEvent event) async* {
    // sets state based on events
    if (event is SplashInEvent) {
      yield MainStates.SplashIn;
    } else if (event is LoginEvent) {
      yield MainStates.LoggedLoading;
      yield MainStates.Login;
    } else if (event is HomeScreenEvent) {
      yield MainStates.LoggedLoading;
      yield MainStates.HomeScreen;
    }
  }
}
