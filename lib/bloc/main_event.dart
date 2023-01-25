part of 'main_bloc.dart';

@immutable
abstract class MainEvent {}

// to show splash screen
class SplashInEvent extends MainEvent {
  SplashInEvent();
}

class LoginEvent extends MainEvent {
  LoginEvent();
}

class HomeScreenEvent extends MainEvent {
  HomeScreenEvent();
}
