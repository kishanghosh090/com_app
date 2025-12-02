import 'package:ecom_admin/controllers/banner_controller.dart';
import 'package:ecom_admin/models/banner.dart';
import 'package:flutter/material.dart';

class BannerWidgets extends StatefulWidget {
  const BannerWidgets({super.key});

  @override
  State<BannerWidgets> createState() => _BannerWidgetsState();
}

class _BannerWidgetsState extends State<BannerWidgets> {
  // a future that will hold list of banners once loaded from the API

  late Future<List<BannerModel>> futureBanner;

  @override
  void initState() {
    super.initState();

    futureBanner = BannerController().loadBanners();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: futureBanner,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Center(child: Text("Error ${snapshot.error}"));
        } else if (!snapshot.hasData || !snapshot.data!.isNotEmpty) {
          return Center(child: Text("No banners"));
        } else {
          final banners = snapshot.data;
          return SizedBox(
            height: 400,
            child: ListView.builder(
              itemCount: banners!.length,
              itemBuilder: (context, index) {
                final banner = banners[index];
                return Padding(
                  
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(width: 100, height: 100, banner.image),
                );
              },
            ),
          );
        }
      },
    );
  }
}
