import 'package:ecom_admin/controllers/banner_controller.dart';
import 'package:ecom_admin/views/side_bar_screens/banner_widgets.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class UploadBannerScreen extends StatefulWidget {
  static const String id = '\bannerscreeen';
  const UploadBannerScreen({super.key});

  @override
  State<UploadBannerScreen> createState() => _UploadBannerScreenState();
}

class _UploadBannerScreenState extends State<UploadBannerScreen> {
  dynamic _image;
  Widget? banners = null;
  BannerController _bannerController = BannerController();
  pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );
    if (result != null) {
      setState(() {
        _image = result.files.first.bytes;
      });
    } else {
      // User canceled the picker
    }
  }

  Widget getBanners() {
    return BannerWidgets();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 3,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: Alignment.topLeft,
              child: Text(
                "Banners",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
            ),
          ),
          Divider(color: Colors.green, thickness: 2),
          Row(
            spacing: 3,
            children: [
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: _image != null
                    ? Image.memory(_image, fit: BoxFit.cover)
                    : Center(child: Text("Category Image")),
              ),
              ElevatedButton(
                onPressed: () async {
                  await _bannerController.uploadBanner(
                    pickedImage: _image,
                    context: context,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade200,
                  textStyle: TextStyle(color: Colors.green),
                ),
                child: Text("save"),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton(
              onPressed: () async {
                await pickImage();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                elevation: 8,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 15,
                ),
                textStyle: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),

              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.image, size: 15),
                  SizedBox(width: 8),
                  Text("Pick Image"),
                ],
              ),
            ),
          ),
          Divider(color: Colors.black),
          BannerWidgets(),
        ],
      ),
    );
  }
}
