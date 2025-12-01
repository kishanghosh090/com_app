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

  String _selectedRoute = VendorScreen.id; 

  Widget _seletedScreen = const VendorScreen(); 

  void screenSelectot(AdminMenuItem item) {
    setState(() {
     
      _selectedRoute = item.route!; 
    
      if (item.route == BuyersScreen.id) {
        _seletedScreen = const BuyersScreen();
      } else if (item.route == CategoriesScreen.id) {
        _seletedScreen = const CategoriesScreen();
      } else if (item.route == ProductScreen.id) {
        _seletedScreen = const ProductScreen();
      } else if (item.route == OrdersScreen.id) {
        _seletedScreen = const OrdersScreen();
      } else if (item.route == UploadBannerScreen.id) {
        _seletedScreen = const UploadBannerScreen();
      } else if (item.route == VendorScreen.id) {
        _seletedScreen = const VendorScreen();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // --- Define your colors ---
    const Color primaryColor = Colors.deepPurple;
    const Color sidebarBgColor = Color(0xFF1E2135);
    const Color headerBgColor = Color(0xFF2C314C);
    const Color textLight = Colors.white70;
    const Color activeItemColor = Colors.amber;

    return AdminScaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 4,
        title: const Text(
          "Management Dashboard",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: _seletedScreen,
      sideBar: SideBar(
        iconColor: textLight,
        textStyle: const TextStyle(color: textLight, fontSize: 14),
        onSelected: (item) {
           if (item.route != null) {
              // Call the selector function
              screenSelectot(item);
           }
        },
        backgroundColor: sidebarBgColor,
        header: Container(
          height: 60,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: headerBgColor,
            border: Border(bottom: BorderSide(color: primaryColor, width: 3)),
          ),
          child: const Center(
            child: Text(
              "Mac Store Admin",
              style: TextStyle(
                color: activeItemColor,
                fontSize: 18,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ),
        // --- ACTIVE ITEM STYLING (The section that controls the color) ---
        activeBackgroundColor: primaryColor.withOpacity(0.3),
        activeTextStyle: const TextStyle(
          color: activeItemColor, // Amber text
          fontWeight: FontWeight.bold,
        ),
        activeIconColor: activeItemColor, // Amber icon

        items: [ 
          AdminMenuItem(
            title: 'Vendors',
            route: VendorScreen.id, // e.g., 'vendors_screen'
            icon: CupertinoIcons.person_3,
          ),
          AdminMenuItem(
            title: 'Buyers',
            route: BuyersScreen.id, // e.g., 'buyers_screen'
            icon: CupertinoIcons.person,
          ),
          AdminMenuItem(
            title: 'Orders',
            route: OrdersScreen.id, // e.g., 'orders_screen'
            icon: CupertinoIcons.shopping_cart,
          ),
          AdminMenuItem(
            title: 'Categories',
            route: CategoriesScreen.id, // e.g., 'categories_screen'
            icon: Icons.category,
          ),
          AdminMenuItem(
            title: 'Upload Banners',
            route: UploadBannerScreen.id, // e.g., 'upload_banner_screen'
            icon: Icons.photo_library,
          ),
          AdminMenuItem(
            title: 'Products',
            route: ProductScreen.id, // e.g., 'products_screen'
            icon: Icons.inventory,
          ),
        ],
        // The property that determines WHICH item gets the active style
        selectedRoute: _selectedRoute, 
      ),
    );
  }
}