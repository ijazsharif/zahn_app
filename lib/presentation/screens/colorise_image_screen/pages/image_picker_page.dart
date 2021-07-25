import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';
import 'package:zahn_app/logic/colorization_bloc/colorization_bloc.dart';
import 'package:zahn_app/presentation/common/widgets/shutter_botton.dart';
import 'package:zahn_app/presentation/screens/colorise_image_screen/widgets/alert_message.dart';
import 'package:zahn_app/presentation/screens/colorise_image_screen/widgets/image_picker_topbar.dart';
import 'package:zahn_app/presentation/screens/colorise_image_screen/widgets/image_preview.dart';

class ImagePickerPage extends StatefulWidget {
  ImagePickerPage({
    Key key,
    this.pageController,
  }) : super(key: key);

  final PageController pageController;

  @override
  _ImagePickerPageState createState() => _ImagePickerPageState();
}

class _ImagePickerPageState extends State<ImagePickerPage> {
  bool showCapturedPhoto = false;
  String selectedImage;
  bool isCameraReady = false;

  Future<void> _initializeControllerFuture;
  CameraController _controller;
  List cameras;

  Future _initCameraController() async {
    cameras = await availableCameras();

    if (cameras.isNotEmpty) {
      _controller = CameraController(
        cameras.first,
        ResolutionPreset.ultraHigh,
        enableAudio: false,
      );
      _initializeControllerFuture = _controller.initialize();
    }

    if (!mounted) {
      return;
    }

    setState(() {
      isCameraReady = true;
    });
  }

  @override
  void initState() {
    super.initState();
    _initCameraController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return showCapturedPhoto
        ? ImagePreview(
            selectedImage: selectedImage,
            onCancel: () {
              setState(() {
                showCapturedPhoto = false;
                selectedImage = null;
              });
            },
            onConfirm: () {
              BlocProvider.of<ColorizationBloc>(context).add(
                ColorizePhoto(photo: File(selectedImage)),
              );
            },
          )
        : Stack(
            children: [
              FutureBuilder<void>(
                future: _initializeControllerFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    _controller.setFlashMode(FlashMode.off);
                    return _controller.value.isInitialized
                        ? SafeArea(child: CameraPreview(_controller))
                        : AlertMessage();
                  } else {
                    return Center(
                      child: CupertinoActivityIndicator(
                        animating: true,
                      ),
                    );
                  }
                },
              ),
              Positioned(
                bottom: 20.0.sp,
                left: 0,
                right: 0,
                child: ShutterBotton(onTap: () async {
                  try {
                    await _controller.takePicture().then((file) {
                      setState(() {
                        selectedImage = file.path;
                        showCapturedPhoto = true;
                      });
                    });
                  } catch (_) {
                    _initCameraController();
                  }
                }),
              ),
              ImagePickerTopBar(
                onPickImageFromGalleryButtonClicked: () async {
                  try {
                    selectedImage = await ImagePicker()
                        .getImage(source: ImageSource.gallery)
                        .then((image) => image.path);
                    setState(() {
                      showCapturedPhoto = true;
                    });
                  } catch (_) {}
                },
              ),
            ],
          );
  }
}
