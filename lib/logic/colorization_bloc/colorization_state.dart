part of 'colorization_bloc.dart';

@immutable
abstract class ColorizationState {}

class Colorization extends ColorizationState {}

class SuccessfullyColorizeImage extends ColorizationState {
  final String imageUrl;
  SuccessfullyColorizeImage({@required this.imageUrl});
}

class SuccessfullyGetColorizedPhotosList extends ColorizationState {
  final List<String> photos;
  SuccessfullyGetColorizedPhotosList({@required this.photos});
}

class ColorizedPhotosListIsEmpty extends ColorizationState {}

class FailedToColorizeImage extends ColorizationState {}
