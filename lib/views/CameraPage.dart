import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late List<CameraDescription> _cameras;
  late CameraController _cameraController;
  var cameraValue;
  late final XFile picture;
  late final List<File> galleryImages;

  Future getImagesPreview() async {
    try {
      ImagePicker imagePicker = ImagePicker();
      List<XFile> image = await imagePicker.pickMultiImage();
      // imagePicker./
      if (image.isEmpty) {
        setState(() {
          // galleryImages.add(File(image.));
        });
      }
      print(image);
    } catch (e) {
      print("error from catch");
      print(e);
    }
  }

  void checkAvailability() async {
    try {
      _cameras = await availableCameras();
      await initCamera(_cameras[0]);
      print("from checking");
      print(_cameras);
    } catch (e) {
      print("somthing is wrong ion camera");
      print("$e");
    }
  }

  Future initCamera(CameraDescription cameraDescription) async {
    try {
// create a CameraController
      _cameraController =
          CameraController(cameraDescription, ResolutionPreset.high);
// Next, initialize the controller. This returns a Future.
      await _cameraController.initialize().then((_) {
        if (!mounted) return;
        setState(() {});
      });
      cameraValue = _cameraController.initialize();
    } catch (e) {
      print(e);
      print('error from init camra');
      debugPrint("camera error $e");
    }
  }

  bool isImageTaken = false;
  void clickImage() async {
    print("click image");
    if (!_cameraController.value.isInitialized) {
      return null;
    }
    if (_cameraController.value.isTakingPicture) {
      return null;
    }
    try {
      await _cameraController.setFlashMode(FlashMode.always);
      picture = await _cameraController.takePicture();
      setState(() {
        isImageTaken = true;
      });
      print(picture.path);
    } on CameraException catch (e) {
      debugPrint('Error occured while taking picture: $e');
      return null;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkAvailability();
  }

  @override
  Widget build(BuildContext context) {
    return !isImageTaken
        ? SafeArea(
            child: cameraValue != null
                ? CameraPreview(
                    _cameraController,
                    child: cameraView(),
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
          )
        : Image.file(File(picture.path));
  }

  void switchCamera() async {
    // print(_cameraController);
    print(_cameraController.description.lensDirection);
    if (_cameraController.description.lensDirection ==
        _cameras[0].lensDirection) {
      setState(() {
        initCamera(_cameras[1]);
      });
    } else {
      setState(() {
        initCamera(_cameras[0]);
      });
    }
  }

  Widget cameraView() {
    return SizedBox(
      height: 50,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: InkWell(
                onTap: () {
                  switchCamera();
                  getImagesPreview();
                },
                child: const Icon(
                  Icons.cameraswitch_outlined,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      clickImage();
                    },
                    child: const Icon(
                      Icons.camera_outlined,
                      color: Colors.white,
                      size: 80,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
