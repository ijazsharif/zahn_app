part of 'colorization_bloc.dart';

@immutable
abstract class ColorizationEvent {}

class ColorizePhoto extends ColorizationEvent {
  final File photo;
  ColorizePhoto({@required this.photo});
}
