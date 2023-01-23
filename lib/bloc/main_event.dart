part of 'main_bloc.dart';

@immutable
abstract class MainEvent {}

// to show splash screen
class SplashIn extends MainEvent {
  SplashIn();
}

class Login extends MainEvent {
  Login();
}

class HomeScreenEvent extends MainEvent {
  HomeScreenEvent();
}
