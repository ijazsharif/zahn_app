part of 'app_bloc.dart';

@immutable
abstract class AppState {}

class Cheking extends AppState {}

class AppRunForTheFirstTime extends AppState {}

class AppIsConnected extends AppState {}

class AppIsNotConnected extends AppState {}
