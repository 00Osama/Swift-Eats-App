import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fooddeliveryapp/CustomWidgets/MyButton.dart';
import 'package:fooddeliveryapp/auth/services/auth_gate.dart';
import 'package:fooddeliveryapp/auth/services/auth_service.dart';
import 'package:fooddeliveryapp/auth/services/error_message.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';
import 'package:fooddeliveryapp/global_fields.dart';

class ChooseProfilePhoto extends StatefulWidget {
  const ChooseProfilePhoto({super.key});

  @override
  State<ChooseProfilePhoto> createState() => _ChooseProfilePhotoState();
}

class _ChooseProfilePhotoState extends State<ChooseProfilePhoto> {
  final ImagePicker picker = ImagePicker();
  Widget pickedImage = Image.asset(
    'lib/auth/images/defult person.jpg',
  );
  bool isImagePicked = false;
  String? emailErrorText;

  imgFromGallery() async {
    await picker
        .pickImage(source: ImageSource.gallery, imageQuality: 50)
        .then((value) {
      if (value != null) {
        _cropImage(File(value.path));
      }
    });
  }

  imgFromCamera() async {
    await picker
        .pickImage(source: ImageSource.camera, imageQuality: 50)
        .then((value) {
      if (value != null) {
        _cropImage(File(value.path));
      }
    });
  }

  void showImagePicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (builder) {
        return Card(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 5.2,
            margin: const EdgeInsets.only(top: 8.0),
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: InkWell(
                    child: const Column(
                      children: [
                        Icon(Icons.image, size: 60.0),
                        SizedBox(height: 12.0),
                        Text(
                          "Gallery",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      ],
                    ),
                    onTap: () {
                      imgFromGallery();
                      Navigator.pop(context);
                    },
                  ),
                ),
                Expanded(
                  child: InkWell(
                    child: const Column(
                      children: [
                        Icon(Icons.camera_alt, size: 60.0),
                        SizedBox(height: 12.0),
                        Text(
                          "Camera",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      ],
                    ),
                    onTap: () {
                      imgFromCamera();
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  _cropImage(File imgFile) async {
    final croppedFile = await ImageCropper().cropImage(
        sourcePath: imgFile.path,
        aspectRatioPresets: Platform.isAndroid
            ? [
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio16x9
              ]
            : [
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio5x3,
                CropAspectRatioPreset.ratio5x4,
                CropAspectRatioPreset.ratio7x5,
                CropAspectRatioPreset.ratio16x9
              ],
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: "Image Cropper",
              toolbarColor: Colors.deepOrange,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          IOSUiSettings(
            title: "Image Cropper",
          )
        ]);
    if (croppedFile != null) {
      imageCache.clear();
      setState(() {
        imageFile = File(croppedFile.path);
        pickedImage = Image.file(
          imageFile!,
          fit: BoxFit.cover,
        );
        isImagePicked = true;
      });
      // reload();
    }
  }

  void _showPermissionDeniedDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Permission Denied"),
          content: const Text(
              "Please allow permissions in the app settings to continue."),
          actions: [
            TextButton(
              child: const Text("Settings"),
              onPressed: () {
                openAppSettings();
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  File? imageFile;
  String? imagePath;
  String? imageUrl;

  Future<void> uploadImage(BuildContext context) async {
    File? fileToUpload;

    if (imageFile != null) {
      fileToUpload = imageFile;
    } else {
      // Load the default image from assets
      ByteData byteData =
          await rootBundle.load('lib/auth/images/defult person.jpg');
      // Get the temporary directory
      Directory tempDir = await getTemporaryDirectory();
      // Create a file
      fileToUpload = File('${tempDir.path}/default_person.jpg');
      // Write the byte data to the file
      await fileToUpload.writeAsBytes(byteData.buffer.asUint8List());
    }

    try {
      FirebaseStorage storage = FirebaseStorage.instance;
      String fileName = fileToUpload!.path.split('/').last;
      Reference ref = storage.ref().child('profile/$fileName');
      UploadTask uploadTask = ref.putFile(fileToUpload);

      imageUrl = await (await uploadTask).ref.getDownloadURL();
      imagePath = ref.fullPath;
    } catch (e) {
      message(
        context,
        title: 'Error',
        content: e.toString(),
        buttonText: 'Failed to upload image, please try again',
        onPressed: () {
          Navigator.pop(context);
        },
      );
    }
  }

  final auth = AuthService();

  void signUP() async {
    try {
      await auth.signUp(
        emailController.text.trim(),
        passwordController.text.trim(),
        fullNameController.text.trim(),
        phoneNumberController.text.trim(),
        imageUrl!,
      );
      emailController.clear();
      passwordController.clear();
      confirmPasswordController.clear();
      fullNameController.clear();
      phoneNumberController.clear();

      Navigator.pop(context);
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => AuthGate()),
        (route) => false,
      );
    } catch (e) {
      Navigator.pop(context);
      message(
        context,
        title: 'error',
        content: e.toString(),
        buttonText: 'Ok',
        onPressed: () {
          Navigator.pop(context);
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Choose Profile Photo',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Ubuntu',
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 110, 124, 148),
              ),
            ),
            SizedBox(height: 4),
            Text(
              'Optional But Recommended',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Ubuntu',
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 110, 124, 148),
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  width: 200,
                  height: 200,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10000),
                    child: pickedImage,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      pickedImage = Image.asset(
                        'lib/auth/images/defult person.jpg',
                      );
                    });
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.delete_rounded,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: SizedBox(
                    width: double.infinity,
                    child: MyButton(
                      color: const Color.fromARGB(255, 239, 48, 41),
                      text: 'Choose Photo',
                      onPressed: () async {
                        Map<Permission, PermissionStatus> statuses = await [
                          Permission.storage,
                          Permission.camera
                        ].request();
                        if (statuses[Permission.storage]!.isGranted &&
                            statuses[Permission.camera]!.isGranted) {
                          showImagePicker(context);
                        } else {
                          _showPermissionDeniedDialog(context);
                        }
                        setState(() {});
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    width: double.infinity,
                    child: MyButton(
                      color: const Color.fromARGB(255, 239, 48, 41),
                      text: 'Sign Up',
                      onPressed: () async {
                        showDialog(
                          context: context,
                          builder: (context) => const Center(
                            child:
                                CircularProgressIndicator(color: Colors.black),
                          ),
                        );
                        await uploadImage(context);
                        signUP();
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
