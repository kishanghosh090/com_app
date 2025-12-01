import 'package:ecom_admin/views/side_bar_screens/buyers_screen.dart';
import 'package:ecom_admin/views/side_bar_screens/categories_screen.dart';
import 'package:ecom_admin/views/side_bar_screens/orders_screen.dart';
import 'package:ecom_admin/views/side_bar_screens/product_screen.dart';
import 'package:ecom_admin/views/side_bar_screens/upload_banner_screen.dart';
import 'package:ecom_admin/views/side_bar_screens/vendor_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Widget _seletedScreen = VendorScreen();
  screenSelectot(item) {
    switch (item.route) {
      case BuyersScreen.id:
        setState(() {
          _seletedScreen = BuyersScreen();
        });
        break;
      case CategoriesScreen.id:
        setState(() {
          _seletedScreen = CategoriesScreen();
        });
        break;
      case ProductScreen.id:
        setState(() {
          _seletedScreen = ProductScreen();
        });
        break;
      case OrdersScreen.id:
        setState(() {
          _seletedScreen = OrdersScreen();
        });
        break;

      case UploadBannerScreen.id:
        setState(() {
          _seletedScreen = UploadBannerScreen();
        });
        break;
      case VendorScreen.id:
        setState(() {
          _seletedScreen = VendorScreen();
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text("Management"),
      ),
      body: _seletedScreen,
      sideBar: SideBar(
        onSelected: (item) {
          screenSelectot(item);
        },
        header: Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(color: Colors.black),
          child: Center(
            child: Text("Mac store", style: TextStyle(color: Colors.white)),
          ),
        ),
        items: const [
          AdminMenuItem(
            title: 'Vendors',
            route: VendorScreen.id,
            icon: CupertinoIcons.person_3,
          ),
          AdminMenuItem(
            title: 'Buyers',
            route: BuyersScreen.id,
            icon: CupertinoIcons.person,
          ),
          AdminMenuItem(
            title: 'Orders',
            route: OrdersScreen.id,
            icon: CupertinoIcons.shopping_cart,
          ),
          AdminMenuItem(
            title: 'Categories',
            route: CategoriesScreen.id,
            icon: Icons.category,
          ),
          AdminMenuItem(
            title: 'Upload Banners',
            route: UploadBannerScreen.id,
            icon: Icons.upload,
          ),
          AdminMenuItem(
            title: 'Products',
            route: ProductScreen.id,
            icon: Icons.store,
          ),
        ],
        selectedRoute: '',
      ),
    );
  }
}
