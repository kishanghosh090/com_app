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
          final banners = snapshot.data!;
          return Expanded(
            child: GridView.builder(
              itemCount: banners.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 6,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemBuilder: (context, index) {
                final banner = banners[index];
                return Image.network(banner.image, height: 100, width: 100);
              },
            ),
          );
        }
      },
    );
  }
}
