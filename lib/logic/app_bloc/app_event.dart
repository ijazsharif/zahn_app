part of 'app_bloc.dart';

@immutable
abstract class AppEvent {}

class RunStartupChecker extends AppEvent {}

class CheckAppConnectivity extends AppEvent {}
