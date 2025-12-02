import 'package:flutter/material.dart';

class UploadBannerScreen extends StatelessWidget {
  static const String id = '\bannerscreeen';
  const UploadBannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
      ],
    );
  }
}
