import 'dart:typed_data';
import 'package:ecom_admin/global_variabes.dart';
import 'package:ecom_admin/services/manage_http_reponse.dart';
import 'package:http/http.dart' as http;
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:ecom_admin/models/category.dart';

class CategoryController {
  uploadCategory({
    required dynamic pickedImage,
    required dynamic pickedBanner,
    required String name,
    required context,
  }) async {
    try {
      // convert to byte image
      Uint8List pickedImageBytes = pickedImage;
      final bufferImage = pickedImageBytes.buffer;
      final ByteData byteDataImage = ByteData.view(bufferImage);

      // convert to byte banner
      Uint8List pickedBannerBytes = pickedBanner;
      final bufferbanner = pickedBannerBytes.buffer;
      final ByteData byteDataBanner = ByteData.view(bufferbanner);

      final cloudinary = CloudinaryPublic("kishanrana", "kishan");

      CloudinaryResponse? imageResponse = await cloudinary.uploadFile(
        CloudinaryFile.fromByteData(
          byteDataImage,
          identifier: 'pickerImage',
          folder: 'category',
        ),
      );

      String image = imageResponse.secureUrl;

      CloudinaryResponse bannerResponse = await cloudinary.uploadFile(
        CloudinaryFile.fromByteData(
          byteDataBanner,
          identifier: 'bannerImage',
          folder: 'categoryImages',
        ),
      );
      String banner = bannerResponse.secureUrl;

      Category category = Category(
        id: "",
        name: name,
        image: image,
        banner: banner,
      );

      http.Response res = await http.post(
        Uri.parse("$uri/category"),
        body: category.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      manageHttpResponse(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(context, "category uploaded");
        },
      );
    } catch (e) {
      print(e);
    }
  }
}
