import 'package:ecom_admin/controllers/category_controller.dart';
import 'package:ecom_admin/models/category.dart';
import 'package:flutter/material.dart';

class CategoryWidgets extends StatefulWidget {
  const CategoryWidgets({super.key});

  @override
  State<CategoryWidgets> createState() => _CategoryWidgetsState();
}

class _CategoryWidgetsState extends State<CategoryWidgets> {
  // a future that will hold list of categories once loaded form thr API
  late Future<List<Category>> futureCategories;

  @override
  void initState() {
    super.initState();
    futureCategories = CategoryController().loadCategories();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: futureCategories,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text("failed to load categories"));
        } else if (!snapshot.hasData || !snapshot.data!.isNotEmpty) {
          return Center(child: Text("Not category found"));
        } else {
          final categories = snapshot.data!;
          return GridView.builder(
            itemCount: categories.length,
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 6,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
            ),
            itemBuilder: (context, index) {
              final category = categories[index];
              return Column(
                spacing: 3,
                children: [
                  Image.network(category.image, height: 200, width: 200),
                  Text(category.name),
                ],
              );
            },
          );
        }
      },
    );
  }
}
