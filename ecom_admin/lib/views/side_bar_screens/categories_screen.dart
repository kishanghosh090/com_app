import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});
  static const String id = '\categoryscreeen';

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  late String categoryName;
  dynamic _image;
  dynamic _bannerImage;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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

  pickBannerImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );
    if (result != null) {
      setState(() {
        _bannerImage = result.files.first.bytes;
      });
    } else {
      // User canceled the picker
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: Alignment.topLeft,
              child: Text(
                "Categories",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Divider(color: Colors.blueGrey.shade700),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              spacing: 50,
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
                SizedBox(
                  width: 150,
                  child: TextFormField(
                    onChanged: (value) {
                      setState(() {
                        categoryName = value;
                      });
                    },
                    validator: (value) {
                      if (value!.isNotEmpty) {
                        return null;
                      } else {
                        return "please enter category name";
                      }
                    },
                    decoration: InputDecoration(
                      labelText: 'Enter Category Name',
                    ),
                  ),
                ),
                Row(
                  spacing: 5,
                  children: [
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.red.shade100,
                        textStyle: TextStyle(color: Colors.red),
                      ),
                      child: Text("cancel"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          print(categoryName);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green.shade200,
                        textStyle: TextStyle(color: Colors.green),
                      ),
                      child: Text("save"),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () async {
                await pickImage();
              },
              child: Text("Pick Image"),
            ),
          ),
          Divider(color: Colors.blueGrey.shade700),
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(5),
            ),
            child: _bannerImage != null
                ? Image.memory(_bannerImage, fit: BoxFit.cover)
                : Center(child: Text("Category Image")),
          ),

          Padding(
            padding: EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () async {
                await pickImage();
              },
              child: Text("Pick Image"),
            ),
          ),
        ],
      ),
    );
  }
}
