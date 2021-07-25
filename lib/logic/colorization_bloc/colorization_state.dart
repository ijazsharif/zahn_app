part of 'colorization_bloc.dart';

@immutable
abstract class ColorizationState {}

class Colorization extends ColorizationState {}

class SuccessfullyColorizeImage extends ColorizationState {
  final String imageUrl;
  SuccessfullyColorizeImage({@required this.imageUrl});
}

class FailedToColorizeImage extends ColorizationState {}
